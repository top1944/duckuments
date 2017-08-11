# Source code control with Git

Assigned: Andrea

## Background reading

TODO: to write

- Git
- GitFlow

## Installation


The basic Git program is installed using

    $ sudo apt install git

Additional utilities for `git` are installed using:

    $ sudo apt install git-extras

This include the `git-ignore` utility.


## Setting up global configurations for Git  {#howto-git-local-config}

This should be done twice, once on the laptop, and later, on the robot.

These options tell Git who you are:

    $ git config --global user.email "![email]"
    $ git config --global user.name  "![full name]"

Also do this, and it doesn't matter if you don't know what it is:

    $ git config --global push.default simple

## Git tips

### Shallow clone

You can clone without history with the command:

    $ git clone --depth 1 ![repo]
