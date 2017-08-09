# Setup the laptops


## Setup an Ubuntu laptop to ssh to the Duckiebot

Connect your laptop to the same network as the robot.

From your laptop, now you should be able to ping the Duckiebot:

    laptop $ ping ![robot name].local

(or if you have not changed your hostname then `![robot name]` = `duckiebot`)

Do not continue if you cannot do this successfully.

**_Protip_**: In general, if you find yourself:

- typing an IP
- typing a password
- typing "ssh" more than once
- using a screen / USB keyboard

it means you should learn more about Linux and networks, and you are setting yourself up for failure. Yes, you "can do without", but with an additional 30 seconds of your time. The 30 seconds you are not saving every time are the difference between being productive roboticists and going crazy. Really, it is impossible to do robotics when you have to think about IPs and passwords...

Verify that you can ssh to the PI:

    laptop $ ssh ubuntu@![robot name].local

Say "yes" if you get asked whether you want to add it to a list of known hosts.

**Offending key error:**

If you get something like this:

    Warning: the ECDSA host key for ![...] differs from the key for the IP address '![...] '

    Offending key for IP in /home/![user]/.ssh/known_hosts:![line]

then remove line `![line]` in `~/.ssh/known_hosts`.

Now, let's set up **passwordless** SSH.

On the laptop, create the `.ssh` directory:

    laptop $ mkdir -p ~/.ssh

Install the key `duckietown_key1` by downloading it:

    laptop $ curl -o ~/.ssh/duckietown_key1 "https://www.dropbox.com/s/q23qptu01u7ur3y/duckietown_key1?dl=1"

**Changing Key Permission **

Edit the permission of the file to make ssh happy. The key file must not be readable or writable from other users or groups.

**1**

    laptop $ chmod 600 ~/.ssh/duckietown_key1

Regenerate the public key according to:

    laptop $ ssh-keygen -f ~/.ssh/duckietown_key1 -y > ~/.ssh/duckietown_key1.pub

**Troubleshooting**

If there are issues such as "scheme missing" and the file `duckietown_key1` does
not exist in the `~/.ssh/` folder but instead downloaded a file named `duckietown_key1?dl=1` in the current folder simply rename `duckietown_key1?dl=1` to `duckietown_key1` and copy it over to the directory `~/.ssh/`.

To move the mislabeled file:

    laptop $ mv "duckietown_key1?dl=1" ~/.ssh/duckietown_key1

On the laptop, now edit `~/.ssh/config` and add the following lines:

    Host ![robot name]
    Hostname ![robot name].local
    User ![user name]
    IdentityFile ~/.ssh/duckietown_key1
    HostKeyAlgorithms ssh-rsa

Now you should be able to ssh passwordlessly from your laptop:

    laptop $ ssh ![robot name]

This should succeed. Do not continue unless it does.

Note that you can actually auto-complete with tab after ssh.
