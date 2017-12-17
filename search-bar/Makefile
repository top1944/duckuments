duckuments-dist=../duckuments-dist
duckiebook=$(duckuments-dist)/master/duckiebook
single-page=$(duckiebook).html
docs=../docs
out=out
duckietown-software=../duckietown
src="$(docs):$(duckietown-software)/catkin_ws/src:$(duckietown-software)/Makefiles"

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
	@./make-index.sh $(src) $(single-page)
	@./add_search.py -d $(duckiebook)
	@echo "Search bar added to duckiebook html"
	@cp -r content/* $(out)/* $(duckiebook)
	@echo "Search files moved to duckiebook directory"

clean:
	@./add_search.py -rd $(duckiebook)
	@echo "Search bar removed from html"
	rm -rf $(out)
