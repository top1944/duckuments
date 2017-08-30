# Python

## Background reading

- Python
- Python tutorial

## Python packages

## Python virtual environments

Install using:

    $ sudo apt install virtualenv

## Useful libraries

    matplotlib
    seaborne
    numpy
    panda
    scipy
    opencv
    ...

## Context managers {#python-context-manager}

TODO: to write

## Exception hierarchies

TODO: to write

## Object orientation - Abstract classes, class  hierarchies

TODO: to write

## Downloading resources

Use this recipe if you need to download things:

    from duckietown_utils.download import download_if_not_exist
    url = 'https://www.dropbox.com/s/bzezpw8ivlfu4b0/frame0002.jpg?dl=0'
    f = 'local.jpg'
    download_if_not_exist(url, f)

(Do not commit JPGs and other binary data to the `Software` repository.)
