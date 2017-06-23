# Contributing to this documentation {#sec:contribute-to-docs}

## Where the documentation is

All the documentation is in the repository duckietown/duckuments.

The documentation is written as a series of small files in Markdown format.

It is then processed by a series of scripts to create this output:

* [a publication-quality PDF][master-pdf];
* [an online HTML version, split in multiple pages and with comments boxes][master-split].

[master-pdf]: https://duckietown.github.io/duckuments/master/duckiebook.pdf
[master-html]: https://duckietown.github.io/duckuments/master/duckiebook.html
[master-split]: https://duckietown.github.io/duckuments/master/duckiebook/index.html
<!-- * [HTML (single-page)][master-html]; -->

## Editing links

The simplest way to contribute to the documentation is to click any of the “✎” icons next to the headers.

They link to the “edit” page in Github. There, one can make and commit the edits in only a few seconds.

## Comments

In the multiple-page version, each page also includes a comment box powered by a service called Disqus. This provides a way for people to write comments with a very low barrier. (We would periodically remove the comments.)

## Installing dependencies for compiling the documentation

Let `DUCKUMENTS` be the base directory for the documentation.

Download the `duckuments` repo in that directory:

    $ git clone git@github.com:duckietown/duckuments.git $DUCKUMENTS

Cd into directory:

    $ cd $DUCKUMENTS

Create a virtual environment usign `venv` (the command `virtualenv` might be used as well,
depending on the distribution):

    $ venv deploy

Activate the virtual environment:

    $ source $DUCKUMENTS/deploy/bin/activate

Clone this external repository:

    $ cd $DUCKUMENTS
    $ git clone -b duckuments git@github.com:AndreaCensi/mcdp.git

Install it and its dependencies:

    $ cd $DUCKUMENTS/mcdp
    $ python setup.py develop

Install these other dependencies:

    $ cd $DUCKUMENTS
    $ pip install numpy matplotlib
    $ npm install MathJax-node jsdom@9.3

Install PrinceXML from [this page](https://www.princexml.com/download/).

## Compiling the documentation

Run this command:

    $ cd $DUCKUMENTS
    $ make duckuments-dist

This creates the directory `duckuments-dist`, which contains
another checked out copy of the repository, but with the branch `gh-pages`, which
is the branch that is published by Github using the "Github Pages" mechanism.

At this point, please make sure that you have these two `.git` folders:

    $DUCKUMENTS/.git
    $DUCKUMENTS/duckuments-dist/.git

To compile the docs, go in the `DUCKUMENTS` directory and run `make compile`:

    $ cd $DUCKUMENTS
    $ make all split

This creates the following files:

* `duckuments-dist/master/duckiebook.html` is a single-page HTML of everything.
* `duckuments-dist/master/duckiebook.pdf` is the PDF version.
* `duckuments-dist/master/duckiebook/index.html` is the first page of the version with each chapter on a different page.

## Deploying the documentation

To deploy the documentation, jump into the `DUCKUMENTS/duckuments-dist` directory.

Run the command `git branch`. If it doesn't say that you are on the branch `gh-pages`,
then one of the steps before was done incorrectly.

    $ cd $DUCKUMENTS/duckuments-dist
    $ git branch
    ...
    * gh-pages
    ...

Now, after triple checking that you are in the `gh-pages` branch, you can
use `git status` to see the files that were added or modified,
and simply use `git add`, `git commit` and `git push` to push the files
to Github.
