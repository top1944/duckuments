# Installing Ubuntu on laptops

Before you prepare the Duckiebot, you need to have a laptop with Ubuntu installed.

<div class='requirements'>

Requires:

- A laptop with free disk space.
- Internet connection to download the Ubuntu image.
- About ??? minutes.

TODO: estimate time

Results:

- A laptop ready to be used for Duckietown.

</div>

## Install Ubuntu

Install Ubuntu 16.04.2.

See: For instructions, see for example [this online tutorial][tutorial].

[tutorial]: https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop

**On the choice of username:**  During the installation, create a user for yourself with a username different from `ubuntu`, which is the default. Otherwise, you may get confused later.


<!--

I chose the following options:

        language: English
        username: ubuntu
        password: ubuntu
        hostname: duckietop

If you choose a different username, you will need to change all the commands later. -->

## Install useful software

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


## Passwordless sudo

Add passwordless `sudo`.

See: This procedure is described in [](#howto-passwordless-sudo).

## SSH and Git setup

### Create key pair for `![username]`

Next, create a private/public key pair for the user; call it `![username]@![robot name]`.

See: The procedure is documented in [](#howto-create-key-pair).

### Add `![username]`'s public key to Github

Add the public key to your Github account.

See: The procedure is documented in [](#howto-add-pubkey-to-github).

If the step is done correctly, this command should succeed:

    duckiebot $ ssh -T git@github.com
