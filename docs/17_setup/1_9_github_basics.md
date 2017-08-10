# Setup Github access {#github-access}

This chapter describes how to create a Github account and setup SSH
on the robot and on the laptop.

## Create an SSH key on your machine

This step needs to be repeated twice: once on the Duckiebot, and once on your laptop.

You will thus create two private/public key pairs.

An SSH key can be generated with the command:

    $ ssh-keygen -h

The program will prompt you for the filename on which to save the file.

Use the convention

    /home/![username]/.ssh/![username]@![host name]

So when you do this on the robot, use

    /home/![ubuntu]/.ssh/![username]@![robot name]

and when doing it on the laptop, use the file name:

    /home/![username]/.ssh/![username]@![laptop name]

The session output will look something like this:

    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/![username]/.ssh/id_rsa):

Choose this file:

    /home/![username]/.ssh/![username]@![host name]

Then:

    Enter passphrase (empty for no passphrase):

Press enter.

    Enter same passphrase again:

Press enter.

    Your identification has been saved in /home/![username]/.ssh/![username]@![host name]
    Your public key has been saved in /home/![username]/.ssh/![username]@![host name].pub
    The key fingerprint is:
    ![XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX] ![username]@![host name]
    The key's randomart image is:
    +--[ RSA 2048]----+
    |            .    |
    |       o   o  .  |
    |      o = o  . o |
    |       B . .  * o|
    |        S o    O |
    |         o o  . E|
    |          o o  o |
    |           o  +  |
    |            .. . |
    +-----------------+


Note that the program created two files: a file that contains the private key in

    /home/![username]/.ssh/![username]@![host name]

and a file that contains the public key with extension `.pub` called

    /home/![username]/.ssh/![username]@![host name].pub

## Create a Github account

Our example account is the following:

    Github name: greta-p
    E-mail: greta-p@duckietown.com

Create a Github account ([](#fig:github0)).

<!-- (redirects to Andrea)
    greta-p@censi.org -->

<img figure-id='fig:github0' class='github-screenshot' src='github0.png'/>

Go to your inbox and verify the email.

Go to settings ([](#fig:github1)).

<img figure-id='fig:github1'  class='github-screenshot'  src='github1.png'/>

Add the two public SSH keys that you created (on the laptop and on the robot).

<img figure-id='fig:github2' class='github-screenshot'  src='github2.png'/>

<img figure-id='fig:github3' class='github-screenshot'  src='github3.png'/>

<img figure-id='fig:github4' class='github-screenshot'  src='github4.png'/>


## Creation of SSH config file for your machine

This step should be performed twice, once on the laptop and once on the robot.

First, create the file `~/.ssh/config`:

    $ touch ~/.ssh/config

Add a line containing

    IdentityFile ![PRIVATE_KEY_FILE]

(using the filename for the private key).

Check that the config file is correct:

    $ cat ~/.ssh/config

    IdentityFile ![PRIVATE_KEY_FILE]

To check that all of this works, use the command

    $ ssh -T git@github.com

The command tries to connect to Github using the private keys that you specified.
This is the expected output:

    $ ssh -T git@github.com

    Warning: Permanently added the RSA host key for IP address '![ip address]' to the list of known hosts.
    Hi ![username]! You've successfully authenticated, but GitHub does not provide shell access.

If you don't see the greeting, stop.

Repeat what you just did for the Duckiebot on the laptop as well, making sure
to change the name of the file containing the private key.


## Setting up global configurations for Git

Finally, set up Git options, with the following commands:

    $ git config --global user.email "![email]"
    $ git config --global user.name  "![full name]"

The email will be public in our repository's history.

Also do this, and it doesn't matter if you don't know what it is:

    $ git config --global push.default simple
