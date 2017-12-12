#!/usr/bin/env python2
import os
from optparse import OptionParser

class AddSearch():
    def __init__(self):

        # jquery
        jquery = '<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>'

        # lunr loads the index
        lunr = '<script src="https://unpkg.com/lunr/lunr.js"></script>'

        # results page logic
        results = '<script type="text/javascript" src="results.js"></script>'

        # results CSS
        style = '<link rel="stylesheet" href="style/duckietown.css">'

        self.include = [jquery, lunr, style]



        ### ADD SEARCHBOX TO THE BODY ###

        # div with the searchbox
        self.d = """
            <div id="topbar">
                <div id="searchdiv">
                    <form action="results.html">
                       <input type="text" id="searchbox" name="searchbox" placeholder="search">
                    </form>
                </div>
            </div> 
            <br><br>
            """

    def addSearch(self, filename, verbose=False):
        
        data = open(filename).read()

        ### ADD SCRIPTS TO THE HEADER ###

        if self.d in data and verbose:
            print('Already present:\n\t' + self.d)
        else:
            after = '<body>'
            data = data.replace(after, after + self.d)
            assert self.d in data

        for s in self.include:
            if s in data and verbose:
                print('Already present:\n\t' + s)
            else:
                before = '</head>'
                data = data.replace(before, s + before)
                assert s in data

        with open(filename, 'w') as f:
            f.write(data)

    def removeSearch(self, filename):
        data = open(filename).read()
        data = data.replace(self.d, '')
        for s in self.include:
            data = data.replace(s, '')
        with open(filename, 'w') as f:
            f.write(data)

    def addSearchMultiple(self, rootDir, remove=False):
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


if __name__ == '__main__':
    usage = "usage: %prog [options] FILE"
    parser = OptionParser(usage)
    parser.add_option("-d", "--directory", dest="is_directory",
                      help="interpret input FILE as directory",
                      action="store_true", default=False)
    parser.add_option("-r", "--remove", dest="remove",
                      help="remove search instead of adding",
                      action="store_true", default=False)
    (options, args) = parser.parse_args()

    if len(args) == 0:
        print("Please specify a file.")
        exit(1)
    
    file = args[0]
    search = AddSearch()
    if options.is_directory:
        search.addSearchMultiple(file, remove=options.remove)
    else:
        if options.remove:
            search.removeSearch(file)
        else:
            search.addSearch(file)