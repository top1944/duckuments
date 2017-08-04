# Reproducing the image for laptops

These are Andrea's notes for the laptops (Duckietops).

The image was Ubuntu Mate 16.04.2.

I chose the following options:

        language: English
        username: ubuntu
        password: ubuntu
        hostname: duckietop

If you choose a different username, you will need to change all the commands later.

## Useful software

Use `etckeeper` to keep track of the configuration in `/etc`:

    laptop $ sudo apt install etckeeper

Install `ssh` to login remotely:

    laptop $ sudo apt install ssh

Use `byobu`:

    laptop $ sudo apt install byobu

Use `vim`:

    laptop $ sudo apt install vim

Use `htop` to monitor CPU usage:

    laptop $ sudo apt install htop

Additional utilities for `git`:

    laptop $ sudo apt install git-extras

Other utilities:

    laptop $ sudo apt install avahi-utils ecryptfs-utils

### Redshift

This is Flux for Linux. It is an accessibility/lab safety issue: bright screens damage eyes and perturb sleep [](#bib:tosini16).

<cite id='bib:tosini16'>
    Tosini, G., Ferguson, I., Tsubota, K. . Effects of blue light on the circadian system and eye physiology. Molecular Vision, 22, 61–72, 2016 (<a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4734149/">online</a>).
</cite>

Install redshift and run it.

    laptop $ sudo apt install redshift-gtk

Set to "autostart" from the icon.

## Installation of the documentation system

Next, the docs system was installed using the documentation in [](#sub:installing-docs-system).
