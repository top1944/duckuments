# Setup Github access

This chapter describes how to create a Github account and setup SSH on the robot and on the laptop.

## Create an SSH key on your machine

This step needs to be repeated twice: once on the Duckiebot, and once on your laptop.
You will thus create two private/public key pairs.

An SSH key can be generated with the command:

    laptop / duckiebot $ ssh-keygen -h

The program will prompt you for the filename on which to save the file.

When you do this on the robot, use this name convention:


<style>

.custom { color: darkorange; }
.github-screenshot {
    max-width: 100%;
    max-height: 15em;
}
</style>

<pre>
<code>/home/<span class='custom'>ubuntu</span>/.ssh/<span class='custom'>username@robot name</span></code>
</pre>

Of course, substitute your username and hostname.

When doing it on the laptop, use the file name:

<pre>
<code>/home/<span class='custom'>username</span>/.ssh/<span class='custom'>username@laptop name</span></code>
</pre>

The output will look something like this:

<pre>
<code>Generating public/private rsa key pair.
Enter file in which to save the key (/home/<span class='custom'>username</span>/.ssh/id_rsa): /home/<span class='custom'>username</span>/.ssh/<span class='custom'>username@hostname</span>
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/<span class='custom'>username</span>/.ssh/<span class='custom'>username@hostname</span>
Your public key has been saved in /home/<span class='custom'>username</span>/.ssh/<span class='custom'>username@hostname</span>.pub
The key fingerprint is:
XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX <span class='custom'>username@hostname</span>
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
</code>
</pre>

Note that the program created two files: a file that contains the private key in
<code>/home/<span class='custom'>username</span>/.ssh/<span class='custom'>username@hostname</span></code> and a file that contains the public key with extension `.pub` called
<code>/home/<span class='custom'>username</span>/.ssh/<span class='custom'>username@hostname</span><strong>.pub</strong></code>.

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

    laptop / duckiebot $ touch ~/.ssh/config

Add a line containing "<code>IdentityFile <span class="custom">PRIVATE_KEY_FILE</span></code>"
(using the filename for the private key).

Check that the config file is correct:

    laptop / duckiebot $ cat ~/.ssh/config
    IdentityFile ~/.ssh/PRIVATE_KEY_FILE

To check that all of this works, use the command `ssh -T git@github.com`. The
command tries to connect to Github using the private keys that you specified:

    laptop / duckiebot $ ssh -T git@github.com
    Warning: Permanently added the RSA host key for IP address '192.30.252.128' to the list of known hosts.
    Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.

If you don't see the greeting, stop.

Repeat what you just did for the Duckiebot on the laptop as well, making sure
to change the name of the file containing the private key.


## Setting up global configurations for Git
On your laptop, set up git, with the following commands:

    laptop / duckiebot $ git config --global user.email "<email>"
    laptop / duckiebot $ git config --global user.name "<name>"

The email will be public in our repository’s history. You should use either the @mit.edu email or <nickname>@duckietown.com.

Also do this, and it doesn’t matter if you don’t know what it is:

$ git config --global push.default simple
