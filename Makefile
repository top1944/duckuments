out_html=compiled/duckiebook.html
out_pdf=compiled/duckiebook.pdf

tmp_files=out/tmp

all: $(out_pdf)

install:
	git clone -b my-branch README.md


clean:
	rm -rf $(tmp_files)

$(out_html): $(wildcard docs/**/*md)
	$(MAKE) compile

compile:
	DISABLE_CONTRACTS=1 mcdp-render-manual \
		--src docs/ \
		--stylesheet v_manual_blurb \
		-o $(tmp_files) \
		--output_file $(out_html) -c "config echo 1; rparmake"

%.pdf: %.html
	prince --javascript -o $@ $<
