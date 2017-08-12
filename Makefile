duckuments-branch=master
dist_dir=duckuments-dist/$(duckuments-branch)

out_html=$(dist_dir)/duckiebook.html
out_html2=$(dist_dir)/duckiebook_pdf.html
out_pdf=$(dist_dir)/duckiebook.pdf

tmp_files=out/tmp
tmp_files2=out/tmp2

all: compile compile-pdf

.PHONY: $(out_html)

duckuments-dist:
	# clone branch "dist"
	git clone -b gh-pages git@github.com:duckietown/duckuments.git duckuments-dist

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

compile-pdf:
	# mathjax is 1 in this case
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src docs/ \
		--stylesheet v_manual_blurb_ready \
		--mathjax 1 \
		-o $(tmp_files2) \
		--output_file $(out_html2).tmp -c "config echo 1; rparmake"

	python -m mcdp_docs.add_edit_links < $(out_html2).tmp > $(out_html2)

	prince --javascript -o $(out_pdf) $(out_html2)

	# open $(out_pdf)

compile:
	$(MAKE) compile-html
	$(MAKE) split

compile-slow:
	$(MAKE) compile-html-slow
	$(MAKE) split

compile-html:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src docs/ \
		--stylesheet v_manual_split \
		--mathjax 0 \
		-o $(tmp_files) \
		--output_file $(out_html).tmp -c "config echo 1; config colorize 1; rparmake"

	python -m mcdp_docs.add_edit_links  $(out_html).localcss.html < $(out_html).tmp
	python -m mcdp_docs.embed_css $(out_html) < $(out_html).localcss.html

compile-html-slow:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src docs/ \
		--stylesheet v_manual_split \
		--mathjax 0 \
		-o $(tmp_files) \
		--output_file $(out_html).tmp -c "config echo 1; config colorize 0; rmake"

	python -m mcdp_docs.add_edit_links $(out_html).localcss.html < $(out_html).tmp
	python -m mcdp_docs.embed_css $(out_html) < $(out_html).localcss.html

%.pdf: %.html
	prince --javascript -o $@ $<
	# open $@

split:
	rm -f $(dist_dir)/duckiebook/*html
	python -m mcdp_docs.split $(out_html) $(dist_dir)/duckiebook
	python -m mcdp_docs.add_mathjax $(dist_dir)/duckiebook/*html
