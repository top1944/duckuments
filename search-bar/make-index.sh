#!/bin/bash

echo "indexing files..."

export NODE_PATH="$(npm root -g)"

printf -v FILES %s "$(${DUCKUMENTS_ROOT}/search-bar/make-json.py $1)"

#echo $FILES

if echo $FILES | node $DUCKUMENTS_ROOT/search-bar/build-index.js \
	> $DUCKUMENTS_ROOT/search-bar/content/index.json
then
	echo "index successfully created"
else
	echo "index not created"
fi
