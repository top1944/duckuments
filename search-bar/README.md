DuckieSearch
============

DuckieSearch allows you to search the Duckietown documentation.

To add DuckieSearch to a compiled Duckiebook, run:

    make add-searchbar

from the `duckuments` root directory. 

To removie DuckieSearch from a compiled Duckiebook, run:

    make remove-searchbar

Dependencies
------------

Compiling the index for DuckieSearch requires:


- `Node.js`. To install in Ubuntu:

        sudo apt-get install nodejs

- The JavaScript library `Lunr`, which creates the index. To install:

        npm install -g lunr

- The Python `RegEx` module. To install:

        pip install --user regex

Known Issues
------------

- Page loading speed needs to be improved.
- We would like to add more search options (quotes, boolean search). However, Lunr does not support this, so it might be necessary to use a different indexer.
- The order of result display could be optimized.

Contribute
----------

- Source Code: `github.com/duckietown/duckuments/search-bar`

Support
-------

If you are having issues, please let us know. 

Slack channel on `duckietown.slack.com`: `#devel-heroes`

Primary contact: Lucy Newman -- `@Lucy Newman - TTIC`, `newmanlucy@uchicago.edu`

License
-------

The project is licensed under the GNU General Public License v2.