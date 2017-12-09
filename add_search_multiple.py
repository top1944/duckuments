#!/usr/bin/python

from add_search import AddSearch
import os
from sys import argv

def addSearchMultiple(rootDir):
    for dirName, subdirList, fileList in os.walk(rootDir):
        for fname in fileList:
            name, ext = os.path.splitext(fname)
            # only indexing markdown files
            if ext != ".html":
                continue
            file = os.path.join(dirName,fname)
            AddSearch().addSearch(file)

if __name__ == '__main__':
    addSearchMultiple(argv[1])
