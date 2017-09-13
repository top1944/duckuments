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

all:
	@echo "To compile master:     make master"
	@echo "To clean:              make master-clean"
	@echo "To compile fall2017:   make fall2017"
	@echo "To clean:              make fall2017-clean"
	@echo "To compile pdf:        make master-pdf"

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


log=misc/bot/logs/generic.log
log-master-html=misc/bot/logs/master-html/compilation.log
log-master-pdf=misc/bot/logs/master-pdf/compilation.log
log-fall2017=misc/bot/logs/fall2017/compilation.log

automatic-compile-cleanup:
	echo "\n\nautomatic-compile-cleanup killing everything" >> $(log)
	-killall -9 /home/duckietown/scm/duckuments/deploy/bin/python
	$(MAKE) master-clean
	$(MAKE) fall2017-clean
	rm -f misc/bot/locks/*
	rm -f /home/duckietown/scm/duckuments/duckuments-dist/.git/index.lock
	echo "\n\nautomatic-compile-cleanup killing everything\n\n" >> $(log-master-html)
	echo "\n\nautomatic-compile-cleanup killing everything\n\n" >> $(log-master-pdf)
	echo "\n\nautomatic-compile-cleanup killing everything\n\n" >> $(log-fall2017)

cleanup-repo:
	echo "\n\n Cleaning up the repo " >> $(log)
	df -h / >> $(log)
	git -C duckuments-dist show-ref -s HEAD > duckuments-dist/.git/shallow
	git -C duckuments-dist reflog expire --expire=0 --all
	git -C duckuments-dist prune
	git -C duckuments-dist prune-packed
	echo "\nafter cleanup\n" >> $(log)
	df -h / >> $(log)


automatic-compile-fall2017:
	git pull
	touch $(log-fall2017)
	echo "\n\n Starting" >> $(log-fall2017)
	date >> $(log-fall2017)
	-$(MAKE) fall2017
	echo "  succeded fall 2017" >> $(log-fall2017)
	-$(MAKE) upload
	echo "  succeded upload" >> $(log-fall2017)
	date >> $(log-fall2017)
	echo "Done." >> $(log-fall2017)


automatic-compile-master-html:
	git pull
	touch $(log-master-html)
	echo "\n\nStarting" >> $(log-master-html)
	date >> $(log-master-html)
	nice -n 10 $(MAKE) master-html
	echo "  succeded html " >> $(log-master-html)
	#-$(MAKE) fall2017
	#echo "  succeded fall 2017" >> $(log)
	#-$(MAKE) upload
	#echo "  succeded upload " >> $(log)
	#nice -n 10 $(MAKE) split-imprecise
	nice -n 10 $(MAKE) master-split
	echo "  succeded split " >> $(log-master-html)
#	-$(MAKE) upload
#	echo "  succeded html upload " >> $(log-master-html)
	date >>$(log-master-html)
	echo "Done." >> $(log-master-html)

automatic-compile-master-pdf:
	nice -n 10 $(MAKE) master-pdf
	echo "  succeded PDF  " >> $(log-master-pdf)
#	-$(MAKE) upload
	echo "  succeded PDF upload" >> $(log-master-pdf)
	date >>  $(log-master-pdf)
	echo "Done." >> $(log-master-pdf)


upload:
	#git -C duckuments-dist pull -X ours
	echo ignoring errors

	-git -C duckuments-dist add master
	-git -C duckuments-dist add fall2017
	-git -C duckuments-dist commit -a -m "automatic compilation $(shell date)"
	-git -C duckuments-dist push --force


clean:
	$(MAKE) master-clean

	# rm -rf $(tmp_files)
	# rm -rf $(tmp_files2)
	#rm -rf $(dist_dir)/duckiebook/*html

# $(out_html): $(wildcard docs/**/*md)
# 	$(MAKE) compile

# compile-pdf-slow: checks check-programs-pdf
# 	# mathjax is 1 in this case
# 	DISABLE_CONTRACTS=1 mcdp-render-manual \
# 		--src $(src) \
# 		--stylesheet v_manual_blurb \
# 		--mathjax 1 \
# 		--symbols $(tex-symbols) \
# 		-o $(tmp_files2) \
# 		--output_file $(out_html2).tmp -c "config echo 1; config colorize 0; rmake"
#
# 	python -m mcdp_docs.add_edit_links < $(out_html2).tmp > $(out_html2)
#
# 	prince --javascript -o /tmp/duckiebook.pdf $(out_html2)
#
# 	pdftk A=/tmp/duckiebook.pdf B=misc/blank.pdf cat A1-end B output /tmp/duckiebook2.pdf keep_final_id
# 	pdftk /tmp/duckiebook2.pdf update_info misc/blank-metadata output $(out_pdf)

compile-pdf:
	$(MAKE) master-pdf

master-pdf: checks check-programs-pdf
	# mathjax is 1 in this case
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src $(src) \
		--stylesheet v_manual_blurb \
		--mathjax 1 \
		--symbols $(tex-symbols) \
		-o out/master/pdf \
		--output_file out/master/pdf/duckiebook.html -c "config echo 1; rparmake n=8"

	python -m mcdp_docs.add_edit_links <  out/master/pdf/duckiebook.html > out/master/pdf/b.html

	prince --javascript -o out/master/pdf/duckiebook1.pdf out/master/pdf/b.html

	pdftk A=out/master/pdf/duckiebook1.pdf B=misc/blank.pdf cat A1-end B output out/master/pdf/duckiebook2.pdf keep_final_id
	pdftk out/master/pdf/duckiebook2.pdf update_info misc/blank-metadata output duckuments-dist/master/duckiebook.pdf


	# open $(out_pdf)

update-mcdp:
	-git -C mcdp/ pull

update-software: checks
	-git -C $(duckietown-software) pull

compile:
	$(MAKE) master


index:
	mcdp-render -D misc book_index
	cp misc/book_index.html duckuments-dist/index.html



#
# compile-html-no-embed:
# 	DISABLE_CONTRACTS=1 mcdp-render-manual \
# 		--src $(src) \
# 		--stylesheet v_manual_split \
# 		--mathjax 0 \
# 		--symbols $(tex-symbols) \
# 		-o $(tmp_files) \
# 		--output_file $(out_html).tmp -c "config echo 1; config colorize 1; rparmake"
#
# 	python -m mcdp_utils_xml.note_errors_inline $(out_html).tmp
# 	python -m mcdp_docs.add_edit_links  $(out_html).localcss.html < $(out_html).tmp
# 	# python -m mcdp_docs.embed_css $(out_html) < $(out_html).localcss.html
# 	cp $(out_html).localcss.html $(out_html)
# 	$(MAKE) split
#
# compile-html-slow:
# 	DISABLE_CONTRACTS=1 mcdp-render-manual \
# 		--src $(src) \
# 		--stylesheet v_manual_split \
# 		--mathjax 0 \
# 		--symbols $(tex-symbols) \
# 		-o $(tmp_files) \
# 		--output_file $(out_html).tmp -c "config echo 1; config colorize 0; rmake"
#
# 	python -m mcdp_utils_xml.note_errors_inline $(out_html).tmp
# 	python -m mcdp_docs.add_edit_links $(out_html).localcss.html < $(out_html).tmp
# 	python -m mcdp_docs.embed_css $(out_html) < $(out_html).localcss.html

%.pdf: %.html
	prince --javascript -o $@ $<
	# open $@

# split-slow:
# 	# rm -f $(dist_dir)/duckiebook/*html
# 	mcdp-split \
# 		--filename $(out_html) \
# 		--output_dir $(dist_dir)/duckiebook \
# 		-o $(tmp_files)/split \
# 		-c " config echo 1; config colorize 0; rmake" \
# 		--mathjax \
# 		--preamble $(tex-symbols)

master: checks update-mcdp update-software
	$(MAKE) master-html
	$(MAKE) master-split

master-clean:
	rm -rf out/master

circle:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src $(src) \
		--stylesheet v_manual_split \
		--mathjax 0 \
		--symbols $(tex-symbols) \
		-o out/master/html \
		--output_file out/master/data/1.html \
		-c "config echo 1; config colorize 0; rparmake n=4"

master-html:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src $(src) \
		--stylesheet v_manual_split \
		--mathjax 0 \
		--symbols $(tex-symbols) \
		-o out/master/html \
		--output_file out/master/data/1.html \
		-c "config echo 1; config colorize 1; rparmake n=8"

	python add_stylesheet.py out/master/data/1.html style/duckietown.css
	python -m mcdp_utils_xml.note_errors_inline out/master/data/1.html
	python -m mcdp_docs.add_edit_links out/master/data/localcss.html < out/master/data/1.html
	python -m mcdp_docs.embed_css out/master/data/duckiebook.html < out/master/data/localcss.html
	python -m mcdp_docs.extract_assets  \
		--input out/master/data/duckiebook.html  \
		--output duckuments-dist/master/duckiebook.html \
		--assets duckuments-dist/master/duckiebook/assets

master-split:
	# rm -f $(dist_dir)/duckiebook/*html
	 mcdp-split \
		--filename out/master/data/duckiebook.html \
		--output_dir duckuments-dist/master/duckiebook \
		-o out/master/split \
		-c " config echo 1; config colorize 1; rparmake" \
		--mathjax \
		--preamble $(tex-symbols)



# split-imprecise:
# 	# rm -f $(dist_dir)/duckiebook/*html
# 	 mcdp-split \
# 		--filename $(out_html) \
# 		--faster_but_imprecise \
# 		--output_dir $(dist_dir)/duckiebook \
# 		-o $(tmp_files)/split \
# 		-c " config echo 1; config colorize 1; rparmake" \
# 		--mathjax \
# 		--preamble $(tex-symbols)

#--disqus

fall2017-clean:
	rm -rf out/fall2017
	#rm -rf duckuments-dist/fall2017

fall2017-prepare:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src $(src) \
		--stylesheet v_manual_split \
		--mathjax 0 \
		--no_resolve_references \
		--symbols $(tex-symbols) \
		-o out/fall2017/prepare \
		--output_file out/fall2017/one.html -c "config echo 1; config colorize 1; rparmake"

	python -m mcdp_utils_xml.note_errors_inline out/fall2017/one.html
	# python -m mcdp_docs.add_edit_links duckuments-dist/fall2017/two.html < duckuments-dist/fall2017/one.html
	python -m mcdp_docs.embed_css out/fall2017/master.html < out/fall2017/one.html

fall2017-compose:
	mcdp-docs-compose --config fall2017.version.yaml

fall2017-split:
	mcdp-split \
	   --filename duckuments-dist/fall2017/duckiebook.html \
	   --output_dir duckuments-dist/fall2017/duckiebook \
	   -o out/fall2017/split \
	   -c " config echo 1; config colorize 1; rparmake" \
	   --mathjax \
	   --preamble $(tex-symbols)

	python -m mcdp_docs.extract_assets  \
		--input duckuments-dist/fall2017/duckiebook.html \
		--output duckuments-dist/fall2017/duckiebook.html \
		--assets duckuments-dist/fall2017/duckiebook/assets

fall2017: checks update-mcdp update-software
	$(MAKE) fall2017-prepare
	$(MAKE) fall2017-compose
	$(MAKE) fall2017-split
