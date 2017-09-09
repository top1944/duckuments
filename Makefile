duckuments-branch=master
dist_dir=duckuments-dist/$(duckuments-branch)

out_html=$(dist_dir)/duckiebook.html
out_html2=$(dist_dir)/duckiebook_pdf.html
out_pdf=$(dist_dir)/duckiebook.pdf

tmp_files=out/tmp
tmp_files2=out/tmp2
tex-symbols=docs/symbols.tex
duckietown-software=duckietown

src="docs:$(duckietown-software)/catkin_ws/src:$(duckietown-software)/Makefiles"

all: compile compile-pdf

.PHONY: $(out_html) checks check-duckietown-software check-programs

checks: check-duckietown-software check-programs

check-programs-pdf:
	@which  pdftk >/dev/null || ( \
		echo "You need to install pdftk."; \
		exit 1)

check-programs:
	@which  bibtex2html >/dev/null || ( \
		echo "You need to install bibtex2html."; \
		exit 2)

	@which  mcdp-render >/dev/null  || ( \
		echo "The program mcdp-render is not found"; \
		echo "You are not in the virtual environment."; \
		exit 3)

	@which  mcdp-split >/dev/null  || ( \
		echo "The program mcdp-split is not found"; \
		echo "You need to run 'python setup.py develop' from mcdp/."; \
		exit 4)

	@which  convert >/dev/null  || ( \
		echo "You need to install ImageMagick"; \
		exit 2)

	@which  gs >/dev/null  || ( \
		echo "You need to install Ghostscript (used by ImageMagick)."; \
		exit 2)

	@echo All programs installed.

check-duckietown-software:
	@if [ -d $(duckietown-software) ] ; \
	then \
	     echo '';\
	else \
		echo 'Please create a link "$(duckietown-software)" to the Software repository.'; \
		echo '(This is used to include the package documentation)'; \
		echo ''; \
		echo 'Assuming the usual layout, this is:'; \
		echo '      ln -s  ~/duckietown $(duckietown-software)'; \
		echo ''; \
		exit 1; \
	fi;

generated_figs=docs/generated_pdf_fig

inkscape2=/Applications/Inkscape.app/Contents//Resources/bin/inkscape

process-svg-clean:
	-rm -f $(generated_figs)/*pdf

process-svg:
	@which  inkscape >/dev/null || which $(inkscape2) || ( \
		echo "You need to install inkscape."; \
		exit 2)
	@which  pdfcrop >/dev/null || (echo "You need to install pdfcrop."; exit 1)
	@which  pdflatex >/dev/null || (echo "You need to install pdflatex."; exit 1)


	python -m mcdp_docs.process_svg docs/ $(generated_figs) $(tex-symbols)


duckuments-dist:
	# clone branch "dist"
	git clone --depth 3 git@github.com:duckietown/duckuments-dist.git duckuments-dist


log=~/logs/compilation.log
automatic-compile-cleanup:
	rm ~/lockfile
	-killall -9 /home/duckietown/scm/duckuments/deploy/bin/python
	$(MAKE) clean

automatic-compile:
	git pull
	touch $(log)
	echo "\n\nStarting" >> $(log)
	date >> $(log)
	nice -n 10 $(MAKE) compile-html-slow
	echo "  succeded html " >> $(log)
	-$(MAKE) fall2017
	echo "  succeded fall 2017" >> $(log)
	-$(MAKE) upload
	echo "  succeded upload " >> $(log)
	nice -n 10 $(MAKE) split-slow
	echo "  succeded split 2017" >> $(log)
	-$(MAKE) upload
	echo "  succeded html upload " >> $(log)
	nice -n 10 $(MAKE) compile-pdf
	echo "  succeded PDF  " >> $(log)
	-$(MAKE) upload
	echo "  succeded PDF upload" >> $(log)
	date >> $(log)
	echo "Done." >> $(log)
upload:
	#git -C duckuments-dist pull -X ours
	echo ignoring errors

	-git -C duckuments-dist add master
	-git -C duckuments-dist add fall2017
	-git -C duckuments-dist commit -a -m "automatic compilation $(shell date)"
	-git -C duckuments-dist push --force


clean:
	rm -rf $(tmp_files)
	rm -rf $(tmp_files2)
	#rm -rf $(dist_dir)/duckiebook/*html

$(out_html): $(wildcard docs/**/*md)
	$(MAKE) compile

compile-pdf-slow: checks check-programs-pdf
	# mathjax is 1 in this case
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src $(src) \
		--stylesheet v_manual_blurb \
		--mathjax 1 \
		--symbols $(tex-symbols) \
		-o $(tmp_files2) \
		--output_file $(out_html2).tmp -c "config echo 1; config colorize 0; rmake"

	python -m mcdp_docs.add_edit_links < $(out_html2).tmp > $(out_html2)

	prince --javascript -o /tmp/duckiebook.pdf $(out_html2)

	pdftk A=/tmp/duckiebook.pdf B=misc/blank.pdf cat A1-end B output /tmp/duckiebook2.pdf keep_final_id
	pdftk /tmp/duckiebook2.pdf update_info misc/blank-metadata output $(out_pdf)


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
	$(MAKE) split-slow

index:

index2:
	# XXX: requires node
	mcdp-render -D misc book_index
	cp misc/book_index.html duckuments-dist/index.html


compile-html:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src $(src) \
		--stylesheet v_manual_split \
		--mathjax 0 \
		--symbols $(tex-symbols) \
		-o $(tmp_files) \
		--output_file $(out_html).tmp -c "config echo 1; config colorize 1; rparmake"

	python add_stylesheet.py $(out_html).tmp style/duckietown.css
	python -m mcdp_utils_xml.note_errors_inline $(out_html).tmp
	python -m mcdp_docs.add_edit_links  $(out_html).localcss.html < $(out_html).tmp
	python -m mcdp_docs.embed_css $(out_html) < $(out_html).localcss.html



compile-html-no-embed:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src $(src) \
		--stylesheet v_manual_split \
		--mathjax 0 \
		--symbols $(tex-symbols) \
		-o $(tmp_files) \
		--output_file $(out_html).tmp -c "config echo 1; config colorize 1; rparmake"

	python -m mcdp_utils_xml.note_errors_inline $(out_html).tmp
	python -m mcdp_docs.add_edit_links  $(out_html).localcss.html < $(out_html).tmp
	# python -m mcdp_docs.embed_css $(out_html) < $(out_html).localcss.html
	cp $(out_html).localcss.html $(out_html)
	$(MAKE) split

compile-html-slow:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src $(src) \
		--stylesheet v_manual_split \
		--mathjax 0 \
		--symbols $(tex-symbols) \
		-o $(tmp_files) \
		--output_file $(out_html).tmp -c "config echo 1; config colorize 0; rmake"

	python -m mcdp_utils_xml.note_errors_inline $(out_html).tmp
	python -m mcdp_docs.add_edit_links $(out_html).localcss.html < $(out_html).tmp
	python -m mcdp_docs.embed_css $(out_html) < $(out_html).localcss.html

%.pdf: %.html
	prince --javascript -o $@ $<
	# open $@

split-slow:
	# rm -f $(dist_dir)/duckiebook/*html
	mcdp-split \
		--filename $(out_html) \
		--output_dir $(dist_dir)/duckiebook \
		-o $(tmp_files)/split \
		-c " config echo 1; config colorize 0; rmake" \
		--mathjax \
		--preamble $(tex-symbols)

split:
	# rm -f $(dist_dir)/duckiebook/*html
	 mcdp-split \
		--filename $(out_html) \
		--output_dir $(dist_dir)/duckiebook \
		-o $(tmp_files)/split \
		-c " config echo 1; config colorize 1; rparmake" \
		--mathjax \
		--preamble $(tex-symbols)

#--disqus

fall2017-compose:
	mcdp-docs-compose --config fall2017.version.yaml

fall2017-split:
	mcdp-split \
	   --filename duckuments-dist/fall2017/duckiebook.html \
	   --output_dir duckuments-dist/fall2017/duckiebook \
	   -o $(tmp_files)/fall2017/split \
	   -c " config echo 1; config colorize 1; rparmake" \
	   --mathjax \
	   --preamble $(tex-symbols)

fall2017:
	$(MAKE) fall2017-compose
	$(MAKE) fall2017-split
