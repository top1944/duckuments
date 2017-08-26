# Contributing to the documentation {#sec:contribute-to-docs}

## Where the documentation is

All the documentation is in the repository `duckietown/duckuments`.

The documentation is written as a series of small files in Markdown format.

It is then processed by a series of scripts to create this output:

* [a publication-quality PDF][master-pdf];
* [an online HTML version, split in multiple pages and with comments boxes][master-split].

[master-pdf]: http://book.duckietown.org/master/duckiebook.pdf
[master-html]: http://book.duckietown.org/master/duckiebook.html
[master-split]: http://book.duckietown.org/master/duckiebook/index.html
<!-- * [HTML (single-page)][master-html]; -->

## Editing links

The simplest way to contribute to the documentation is to click any of the "✎" icons next to the headers.

They link to the "edit" page in Github. There, one can make and commit the edits in only a few seconds.

## Comments

In the multiple-page version, each page also includes a comment box powered by a service called Disqus. This provides a way for people to write comments with a very low barrier. (We would periodically remove the comments.)

## Installing the documentation system {#installing-docs-system}

In the following, we are going to assume that the documentation system is
installed in `~/duckuments`. However, it can be installed anywhere.

We are also going to assume that you have setup
a Github account with working public keys.

<!-- See: The documentation for that is in XXX. -->

We are also going to assume that you have installed the `duckietown/software` in `~/duckietown`.

### Dependencies (Ubuntu 16.04)

On Ubuntu 16.04, these are the dependencies to install:

    $ sudo apt install libxml2-dev libxslt1-dev
    $ sudo apt install libffi6 libffi-dev
    $ sudo apt install python-dev python-numpy python-matplotlib
    $ sudo apt install virtualenv
    $ sudo apt install bibtex2html pdftk



### Download the `duckuments` repo

Download the `duckietown/duckuments` repository in the `~/duckuments` directory:

    $ git lfs clone --depth 100 git@github.com:duckietown/duckuments duckuments-on-ext4

Here, note we are using `git lfs clone` -- it's much faster, because it downloads
the Git LFS files in parallel.

If it fails, it means that you do not have Git LFS installed. See [](#git-lfs).

The command `--depth 100` tells it we don't care about the whole history.


### Setup the virtual environment

Next, we will create a virtual environment using inside  the `~/duckuments`
directory.

Change into that directory:

    $ cd ~/duckuments

Create the virtual environment using `virtualenv`:

    $ virtualenv --system-site-packages deploy

Other distributions: In other distributions you might need to use `venv` instead of `virtualenv`.

Activate the virtual environment:

    $ source ~/duckuments/deploy/bin/activate

### Setup the `mcdp` external repository

Make sure you are in the directory:

    $ cd ~/duckuments

Clone the `mcdp` external repository, with the branch `duckuments`.

    $ git clone -b duckuments git@github.com:AndreaCensi/mcdp

Install it and its dependencies:

    $ cd ~/duckuments/mcdp
    $ python setup.py develop

Note: If you get a permission error here, it means you have not properly
activated the virtual environment.

Other distributions: If you are not on Ubuntu 16, depending on your system, you might need to install these other dependencies:

    $ pip install numpy matplotlib

You also should run:

    $ pip install -U SystemCmd==2.0.0

## Compiling the documentation

<div class="check" markdown="1">

Make sure you have deployed and activated the virtual environment. You can check
this by checking which `python` is active:

    $ which python
    /home/![user]/duckuments/deploy/bin/python

</div>

Then:

    $ cd ~/duckuments
    $ make duckuments-dist

This creates the directory `duckuments-dist`, which contains
another checked out copy of the repository, but with the branch `gh-pages`, which
is the branch that is published by Github using the "Github Pages" mechanism.

<div class="check" markdown="1">

At this point, please make sure that you have these two `.git` folders:

    ~/duckuments/.git
    ~/duckuments/duckuments-dist/.git

</div>

To compile the docs, run `make clean compile`:

    $ make clean compile

To see the result, open the file

    ./duckuments-dist/master/duckiebook/index.html

### Incremental compilation

If you want to do incremental compilation, you can omit the `clean` and just
use:

    $ make compile

This will be faster. However, sometimes it might get confused. At that point,
do `make clean`.

## Troubleshooting compilation

Symptom: "Invalid XML"

Resolution: "Markdown" doesn't mean that you can put anything in a file. Except
for the code blocks, it must be valid XML. For example, if you use
"<code>&gt;</code>" and "<code>&lt;</code>" without quoting, it will likely
cause a compile error.

Symptom: "Tabs are evil"

Resolution: Do not use tab characters. The error message in this case is quite
helpful in telling you exactly where the tabs are.


Symptom: The error message contains `ValueError: Suspicious math fragment 'KEYMATHS000ENDKEY'`

Resolution: You probably have forgotten to indent a command line by at least 4 spaces. The dollar in the command line is now being confused for a math formula.


## The workflow to edit documentation.

This is the workflow:

1. Edit the Markdown in the `master` branch of the `duckuments` repository.
2. Run `make compile` to make sure it compiles.
3. Commit the Markdown and push on the `master` branch.

Done. A bot will redo the compilation and push the changes in the `gh-pages` branch.

Step 2 is there so you know that the bot will not encounter errors.

## \*Deploying the documentation

Note: This part is now done by a bot, so it has been removed by the documentation.

The book is published to a different [repository called `duckuments-dist`](https://github.com/duckietown/duckuments-dist) and from there
published as `book.duckietown.org`.



<!-- don't need to do it manually.

To deploy the documentation, jump into the `DUCKUMENTS/duckuments-dist` directory.

Run the command `git branch`. If the out does not say that you are on the branch `gh-pages`,
then one of the steps before was done incorrectly.

    $ cd $DUCKUMENTS/duckuments-dist
    $ git branch
    ...
    * gh-pages
    ...

Now, after triple checking that you are in the `gh-pages` branch, you can
use `git status` to see the files that were added or modified,
and simply use `git add`, `git commit` and `git push` to push the files
to Github. -->

## \*Compiling the PDF version

Note: The dependencies below are harder to install. If you don't manage
to do it, then you only lose the ability to compile the PDF. You can do `make compile`
to compile the HTML version, but you cannot do `make compile-pdf`.

### Installing `nodejs`

Ensure the latest version (>6) of `nodejs` is installed.

Run:

    $ nodejs --version
    6.xx

If the version is 4 or less, remove `nodejs`:

    $ sudo apt remove nodejs

Install `nodejs` using [the instructions at this page][nodejs].

[nodejs]: https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions

<!-- $ sudo apt install node-less -->

Next, install the necessary Javascript libraries using `npm`:

    $ cd $DUCKUMENTS
    $ npm install MathJax-node jsdom@9.3 less



### Troubleshooting `nodejs` installation problems

The only pain point  in the installation procedure has been the installation of `nodejs` packages using `npm`. For some reason, they cannot be installed globally (`npm install -g`).

Do **not** use `sudo` for installation. It will cause problems.

If you use `sudo`, you probably have to delete a bunch of directories,
such as: `~/duckuments/node_modules`, `~/.npm`, and `~/.node_modules`, if they exist.

### Installing Prince

Install PrinceXML from [this page](https://www.princexml.com/download/).

### Installing fonts
<!--
Download STIX fonts from [this site][stix].

[stix]: https://sourceforge.net/projects/stixfonts/files/latest/download

Unzip and copy the ttf to `~/.fonts`:

    $ cp -R STIXv2.0.0 ~/.fonts -->

Copy the `~/duckuments/fonts` directory in `~/.fonts`:

    $ mkdir -p ~/.fonts    # create if not exists
    $ cp -R ~/duckuments/fonts ~/.fonts

and then rebuild the font cache using:

    $ fc-cache -fv


### Compiling the PDF

To compile the PDF, use:

    $ make compile-pdf

This creates the file:

    ./duckuments-dist/master/duckiebook.pdf
