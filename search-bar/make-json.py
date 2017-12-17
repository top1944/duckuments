#!/usr/bin/python

import os
from sys import argv
import json
import regex as re
from pyquery import PyQuery as pq
from subprocess import check_output, Popen


def readIDs(file, outd):
    # TODO check file extension
    with open(file) as f:
        html = f.read()
    
    doc = pq(html)
    h1 = doc('h1')

    h1_ID_list = []

    for el in h1:
        h1_ID = pq(el).attr('id').split(':')[-1]
        h1_ID_list.append(h1_ID)

    return h1_ID_list


def makeJSON(rootDirs, compiledIDsFile, outd):
    compiledIDs = readIDs(compiledIDsFile, outd)

    jsonList = []
    secIDs = []

    for rootDir in rootDirs.split(':'):
        for dirName, subdirList, fileList in os.walk(rootDir):
            for fname in fileList:
                name, ext = os.path.splitext(fname)
                # only indexing markdown files
                if ext != ".md":
                    continue
                file=os.path.join(dirName,fname)
                with open(file, 'r') as f:
                    secName = None
                    secID = None
                    # assuming the following syntax for section name and ID:
                    #   # [Title of Page] {#[section-ID] (options)}
                    pattern = re.compile("\#\s([^\n]+)[\s]+\{\#([\S]+)[^\n]*\}")
                    for line in f:
                        match = pattern.match(line)
                        if match:
                            secName = match.groups()[0]
                            secID = match.groups()[1].split(':')[-1]
                            if secID in compiledIDs:
                                secIDs.append(secID)
                            break
                # skip files with no ID
                if not secID:
                    continue
                with open(file, 'r') as f:
                    text=f.read().replace('\n', ' ')
                    d={"id": secID, "title": secName, "body": text}
                    jsonList.append(d)
    contentToIndex = json.dumps(jsonList, indent=4, separators=(", ", ": "))
    
    indexFileName = os.path.join(outd, "indexContent.json")
    with open(indexFileName, 'w') as f:
        f.write(contentToIndex)

    secIDsFileName = os.path.join(outd, "secIDs.json")
    with open(secIDsFileName, 'w') as f:
        json.dump(secIDs, f)

    return secIDs, contentToIndex

if __name__ == '__main__':
    outd = "out"
    if not os.path.exists(outd):
        os.makedirs(outd)

    compiledIDs = readIDs(argv[2], outd)
    secIDs, contentToIndex = makeJSON(argv[1], argv[2], outd)


    secIDsSet = set(secIDs)
    print("sec IDs len: {}".format(len(secIDs)))
    print("sec IDs dict len: {}".format(len(secIDsSet)))

    compiledIDsSet = set(compiledIDs)
    print("compiled IDs len: {}".format(len(compiledIDs)))
    print("compiled IDs dict len: {}".format(len(compiledIDsSet)))

    secIDnotCompiled = secIDsSet.difference(compiledIDsSet)
    print("in secID not in compiled: {}".format(len(secIDnotCompiled)))

    compiledIDnotSec = compiledIDsSet.difference(secIDsSet)
    print("in compiledID not in sec: {}".format(len(compiledIDnotSec)))