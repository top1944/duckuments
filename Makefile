

dist_dir=duckuments-dist

out_html=$(dist_dir)/duckiebook.html
out_pdf=$(dist_dir)/duckiebook.pdf

tmp_files=out/tmp

all: $(out_pdf)

duckuments-dist:
	# clone branch "dist"
	git clone -b dist git@github.com:duckietown/duckuments.git duckuments-dist

clean:
	rm -rf $(tmp_files)

$(out_html): $(wildcard docs/**/*md)
	$(MAKE) compile

compile-pdf:
	$(MAKE) compile
	$(MAKE) $(out_pdf)

compile:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src docs/ \
		--stylesheet v_manual_blurb \
		-o $(tmp_files) \
		--output_file $(out_html) -c "config echo 1; rparmake"

%.pdf: %.html
	prince --javascript -o $@ $<
