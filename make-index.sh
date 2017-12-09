#!/bin/bash

echo "indexing files..."

printf -v FILES %s "$(./make-json.py $1)"

#echo $FILES

if echo $FILES | node build-index.js > index.json
then
	echo "index successfully created"
else
	echo "index not created"
fi