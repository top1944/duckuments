# Connect the laptop and the Duckiebot


## Make sure that you can ping the robot

Connect your laptop to the same network as the robot.

From your laptop, now you should be able to ping the Duckiebot:

    laptop $ ping ![robot name].local

(or if you have not changed your hostname then `![robot name]` = `duckiebot`)

Do not continue if you cannot do this successfully.


## Make sure you can connect with a password

Verify that you can establish an SSH connection to the robot:

    laptop $ ssh ubuntu@![robot name].local

Say "yes" if you get asked whether you want to add it to a list of known hosts.

The password is "`ubuntu`".


### Troubleshooting

**Symptom**: "Offending key error".

If you get something like this:

    Warning: the ECDSA host key for ![...] differs from the key for the IP address '![...] '

    Offending key for IP in /home/![user]/.ssh/known_hosts:![line]

then remove line `![line]` in `~/.ssh/known_hosts`.

## Setup passwordless SSH

Now, let's set up passwordless SSH, so that you don't need to type a password.

On the laptop, create the `.ssh` directory:

    laptop $ mkdir -p ~/.ssh

The key `duckietown_key1` is found at the URL:

    https://www.dropbox.com/s/q23qptu01u7ur3y/duckietown_key1?dl=1

Download the file and call it `~/.ssh/duckietown_key1`

    laptop $ curl -o ~/.ssh/duckietown_key1 ![URL above]

Edit the permission of the file. SSH wants the key file to be not
readable or writable from other users or groups.

    laptop $ chmod 600 ~/.ssh/duckietown_key1

Regenerate the public key according to:

    laptop $ ssh-keygen -f ~/.ssh/duckietown_key1 -y > ~/.ssh/duckietown_key1.pub

On the laptop, now edit `~/.ssh/config` and add the following lines:

    Host ![robot name]
      Hostname ![robot name].local
      User ![user name]
      IdentityFile ~/.ssh/duckietown_key1
      HostKeyAlgorithms ssh-rsa

Now you should be able to connect without using a password.

The following command should connect without a password being asked:

    laptop $ ssh ![robot name]

Note that you can actually auto-complete with tab after ssh.

### Troubleshooting

Symptom: "Scheme missing"

Resolution: If there are issues such as "scheme missing" and the file
`duckietown_key1` does not exist in the `~/.ssh/` folder, but instead
downloaded a file named `duckietown_key1?dl=1` in the current folder, simply
rename `duckietown_key1?dl=1` to `duckietown_key1` and copy it over to the
directory `~/.ssh/`.

## Advice

In general, if you find yourself:

- typing an IP
- typing a password
- typing "ssh" more than once
- using a screen / USB keyboard

it means you should learn more about Linux and networks, and you are setting
yourself up for failure.

Yes, you "can do without", but with an additional 30 seconds of your time. The
30 seconds you are not saving every time are the difference between being
productive roboticists and going crazy.

Really, it is impossible to do robotics when you have to think about IPs and
passwords...
