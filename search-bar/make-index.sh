#!/bin/bash

echo "indexing files..."

export NODE_PATH="$(npm root -g)"

python make-json.py $1 $2

if cat out/indexContent.json | node build-index.js \
	> out/index.json
then
	echo "index successfully created"
else
	echo "index not created"
fi
