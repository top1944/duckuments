#!/usr/bin/python

from add_search import AddSearch
import os
from sys import argv

def addSearchMultiple(rootDir,remove=False):
    for dirName, subdirList, fileList in os.walk(rootDir):
        for fname in fileList:
            name, ext = os.path.splitext(fname)
            # only indexing markdown files
            if ext != ".html":
                continue
            file = os.path.join(dirName,fname)
            if not remove:
                AddSearch().addSearch(file)
            else:
                AddSearch().removeSearch(file)
    print("Search elements have been added.")

if __name__ == '__main__':
    if len(argv) == 3 and argv[2] == "--remove": 
        addSearchMultiple(argv[1], remove=True)
    else:
        addSearchMultiple(argv[1])
