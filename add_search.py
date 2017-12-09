#!/usr/bin/env python
import os
from sys import argv

class AddSearch():
    def __init__(self):

        # jquery
        jquery = '<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>'

        # lunr loads the index
        lunr = '<script src="https://unpkg.com/lunr/lunr.js"></script>'

        # get URL from section ID
        getURL = '<script src="getURL.js"></script>'

        # results page logic
        results = '<script type="text/javascript" src="results.js"></script>'

        # results CSS
        style = '<link rel="stylesheet" href="style/duckietown.css">'

        self.include = [jquery, lunr, getURL, results, style]



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



if __name__ == '__main__':
    if len(argv) == 3 and argv[2] == "--remove":
        AddSearch().removeSearch(argv[1])
    else:
        AddSearch().addSearch(argv[1], verbose=True)