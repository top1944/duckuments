duckuments-dist=../duckuments-dist
duckiebook=$(duckuments-dist)/master/duckiebook
docs=../docs
out=out

all:
	@type node >/dev/null 2>&1 || { echo "Node not install"; \
	echo 'Please install Node.js'; \
	echo '(This is used to create a search index)'; \
	echo '    sudo apt-get install nodejs'; \
	exit 1; }

	@[ -e "`npm root -g`/lunr" ] || { echo 'Lunr not installed'; \
	echo 'Please install Lunr'; \
	echo '(This is used to create a search index)'; \
	echo '    npm install -g lunr'; \
	exit 1; }

	@pip show regex >/dev/null 2>&1 || { echo "Python RegEx module not install"; \
	echo 'Please install RegEx'; \
	echo '(This is used in creating a search index)'; \
	echo '    pip install --user regex'; \
	exit 1; }

	@echo "All searchbar dependencies were found"
	@./make-index.sh $(docs)
	@./add_search_multiple.py  $(duckiebook)

	@cp -r content/* $(out)/* $(duckiebook)

clean:
	rm -rf $(out)
