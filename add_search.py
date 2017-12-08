#!/usr/bin/env python
import sys, os
filename = sys.argv[1]

# python add_stylesheet.py out/master/data/1.html style/duckietown.css

data = open(filename).read()

### ADD SCRIPTS TO THE HEADER ###

# jquery
jquery = '<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>'

# lunr loads the index
lunr = '<script src="https://unpkg.com/lunr/lunr.js"></script>'

# get URL from section ID
getURL = '<script src="getURL.js"></script>'

# results page logic
results = '<script type="text/javascript" src="results.js"></script>'

scripts = [jquery, lunr, getURL, results]

for s in scripts:
    before = '</head>'
    if s in data:
        print('Already present ' + s)
    else:
        data = data.replace(before, s + before)
        assert s in data

with open(filename, 'w') as f:
    f.write(data)



### ADD SEARCHBOX TO THE BODY ###

# div with the searchbox
d = """
    <div id="searchdiv">
        <form action="results.html">
           <input type="text" id="searchbox" name="searchbox" placeholder="search">
        </form>
    </div> <br> <br>
    """

after = '<body>'
if d in data:
    print('Already present ' + d)
else:

    data2 = data.replace(after, after + d)
    assert d in data2

    with open(filename, 'w') as f:
        f.write(data2)
