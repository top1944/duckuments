duckuments-branch=master
dist_dir=duckuments-dist/$(duckuments-branch)

out_html=$(dist_dir)/duckiebook.html
out_html2=$(dist_dir)/duckiebook_pdf.html
out_pdf=$(dist_dir)/duckiebook.pdf

tmp_files=out/tmp
tmp_files2=out/tmp2
tex-symbols=docs/symbols.tex
duckietown-software=duckietown

src="docs:$(duckietown-software)/catkin_ws/src"

all: compile compile-pdf

.PHONY: $(out_html) checks check-duckietown-software check-programs

checks: check-duckietown-software check-programs

check-programs-pdf:
	@which  pdftk || ( \
		echo "You need to install pdftk."; \
		exit 1)

check-programs:
	@which  bibtex2html || ( \
		echo "You need to install bibtex2html."; \
		exit 2)

	@which  mcdp-render || ( \
		echo "The program mcdp-render is not found"; \
		echo "You are not in the virtual environment."; \
		exit 3)

	@which  mcdp-split || ( \
		echo "The program mcdp-split is not found"; \
		echo "You need to run 'python setup.py develop' from mcdp/."; \
		exit 4)



check-duckietown-software:
	@if [ -d $(duckietown-software) ] ; \
	then \
	     echo '';\
	else \
		echo 'Please create a link "$(duckietown-software)" to the Software repository.'; \
		echo '(This is used to include the package documentation)'; \
		echo ''; \
		echo '      ln -s DUCKIETOWN_ROOT $(duckietown-software)'; \
		echo ''; \
		exit 1; \
	fi;

duckuments-dist:
	# clone branch "dist"
	git clone --depth 3 -b gh-pages git@github.com:duckietown/duckuments.git duckuments-dist

automatic-compile:
	git pull
	$(MAKE) clean
	$(MAKE) compile-slow
	-$(MAKE) upload
	$(MAKE) compile-pdf
	-$(MAKE) upload

upload:
	#git -C duckuments-dist pull -X ours
	echo ignoring errors
	-git -C duckuments-dist add $(duckuments-branch)
	-git -C duckuments-dist commit -a -m "automatic compilation"
	-git -C duckuments-dist push --force


clean:
	rm -rf $(tmp_files)
	rm -rf $(tmp_files2)
	#rm -rf $(dist_dir)/duckiebook/*html

$(out_html): $(wildcard docs/**/*md)
	$(MAKE) compile

compile-pdf: checks check-programs-pdf
	# mathjax is 1 in this case
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src $(src) \
		--stylesheet v_manual_blurb \
		--mathjax 1 \
		--symbols $(tex-symbols) \
		-o $(tmp_files2) \
		--output_file $(out_html2).tmp -c "config echo 1; rparmake"

	python -m mcdp_docs.add_edit_links < $(out_html2).tmp > $(out_html2)

	prince --javascript -o /tmp/duckiebook.pdf $(out_html2)

	pdftk A=/tmp/duckiebook.pdf B=misc/blank.pdf cat A1-end B output /tmp/duckiebook2.pdf keep_final_id
	pdftk /tmp/duckiebook2.pdf update_info misc/blank-metadata output $(out_pdf)

	# open $(out_pdf)

update-mcdp:
	-git -C mcdp/ pull

update-software: checks
	-git -C $(duckietown-software) pull

compile: checks update-mcdp update-software
	$(MAKE) index
	$(MAKE) compile-html
	$(MAKE) split

compile-slow: update-mcdp update-software
	$(MAKE) index
	$(MAKE) compile-html-slow
	$(MAKE) split

index:
	# XXX: requires node
	#mcdp-render -D misc book_index
	#cp misc/book_index.html duckuments-dist/index.html

compile-html:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src $(src) \
		--stylesheet v_manual_split \
		--mathjax 0 \
		--symbols $(tex-symbols) \
		-o $(tmp_files) \
		--output_file $(out_html).tmp -c "config echo 1; config colorize 1; rparmake"

	python -m mcdp_docs.add_edit_links  $(out_html).localcss.html < $(out_html).tmp
	python -m mcdp_docs.embed_css $(out_html) < $(out_html).localcss.html

compile-html-slow:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src $(src) \
		--stylesheet v_manual_split \
		--mathjax 0 \
		--symbols $(tex-symbols) \
		-o $(tmp_files) \
		--output_file $(out_html).tmp -c "config echo 1; config colorize 0; rmake"

	python -m mcdp_docs.add_edit_links $(out_html).localcss.html < $(out_html).tmp
	python -m mcdp_docs.embed_css $(out_html) < $(out_html).localcss.html

%.pdf: %.html
	prince --javascript -o $@ $<
	# open $@

split:
	rm -f $(dist_dir)/duckiebook/*html
	mcdp-split \
		--filename $(out_html) \
		--output_dir $(dist_dir)/duckiebook \
		-o $(tmp_files)/split \
		-c "clean; config echo 1; config colorize 1; rparmake" \
		--mathjax \
		--preamble $(tex-symbols) \
		--disqus
	#
	# python -m mcdp_docs.add_mathjax --preamble $(tex-symbols) $(dist_dir)/duckiebook/*html
