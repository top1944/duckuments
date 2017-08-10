# Installing Ubuntu on laptops

Before you prepare the Duckiebot, you need to have a laptop with Ubuntu installed.

Requires:

- A laptop with free disk space.
- Internet connection to download the Ubuntu image.
- About 1 hour XXX.

Results:

- A laptop ready to be used for Duckietown.

## Install Ubuntu

The image was Ubuntu 16.04.2.

We are not writing here the instructions on how to install Ubuntu.

See: See for example [this online tutorial][tutorial] on how to install Ubuntu.

[tutorial]: https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop

<!--

I chose the following options:

        language: English
        username: ubuntu
        password: ubuntu
        hostname: duckietop

If you choose a different username, you will need to change all the commands later. -->

## Useful software

Use `etckeeper` to keep track of the configuration in `/etc`:

    laptop $ sudo apt install etckeeper

Install `ssh` to login remotely and the server:

    laptop $ sudo apt install ssh

Use `byobu`:

    laptop $ sudo apt install byobu

Use `vim`:

    laptop $ sudo apt install vim

Use `htop` to monitor CPU usage:

    laptop $ sudo apt install htop

Additional utilities for `git`:

    laptop $ sudo apt install git git-extras

Other utilities:

    laptop $ sudo apt install avahi-utils ecryptfs-utils


## Other suggested software

### Redshift

This is Flux for Linux. It is an accessibility/lab safety issue: bright screens damage eyes and perturb sleep [](#bib:tosini16).

<cite id='bib:tosini16'>
    Tosini, G., Ferguson, I., Tsubota, K. <em>Effects of blue light on the circadian system and eye physiology</em>. Molecular Vision, 22, 61–72, 2016 (<a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4734149/">online</a>).
</cite>

Install redshift and run it.

    laptop $ sudo apt install redshift-gtk

Set to "autostart" from the icon.

### Installation of the duckuments system

Next, install the documentation system using the documentation in [](#sub:installing-docs-system).


## Other

See [](#howto-passwordless-sudo).
