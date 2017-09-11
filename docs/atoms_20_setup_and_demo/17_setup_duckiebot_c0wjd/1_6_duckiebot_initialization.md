# Duckiebot Initialization {#setup-duckiebot}

Assigned: Andrea


<div class='requirements' markdown="1">

Requires: An SD card of dimensions at least 16 GB.

Requires: A computer with an internet connection, an SD card reader, and 16 GB of free space.

Requires: An assembled Duckiebot in configuration `D17-C0`. This is the result of [](#assembling-duckiebot-c0).

Results: A Duckiebot that is ready to use.

</div>

XXX What does it mean "ready to use"?.

## Acquire and burn the image

On the laptop, download the compressed image at this URL:

> [https://www.dropbox.com/s/1jgn0chx3hu3a4a/duckiebot-RPI3-AD-sep7.img.xz?dl=1](https://www.dropbox.com/s/1jgn0chx3hu3a4a/duckiebot-RPI3-AD-sep7.img.xz?dl=1)

The size is 1.7 GB.

You can use:

    $ curl -o duckiebot-RPI3-AD-sep7.img.xz ![URL above]

Uncompress the file:

    $ xz -d -k duckiebot-RPI3-AD-sep7.img.xz

This will create a file of 11 GB in size.

To make sure that the image is downloaded correctly, compute its hash
using the program `sha256sum`:

    $ sha256sum duckiebot-RPI3-AD-sep7.img
    681c4653c309df530791dbdbe2e89819def330c20d58d4c4baf5979b02e5b381  duckiebot-RPI3-AD-sep7.img

Compare the hash that you obtain with the hash above. If they are different,
there was some problem in downloading the image.

Next, burn the image on disk.

See: The procedure of how to burn an image is explained in [](#howto-burn-image).

## Turn on the Duckiebot

Put the SD Card in the Duckiebot.

Turn on the Duckiebot by connecting the power cable to the battery.

TODO: Add figure

Comment: In general, for the battery: if it's off, a single click on the power button will turn the battery on. When it's on, a single click will show you the charge indicator (4 white lights = full), and holding the button for 3s will turn off the battery. Shutting down the Duckiebot is not recommended because it may cause corruption of the SD card.

## Connect the Duckiebot to a network

You can login to the Duckiebot in two ways:

1. Through an Ethernet cable.
2. Through a `duckietown` WiFi network.

In the worst case, you can use an HDMI monitor and a USB keyboard.

### Option 1: Ethernet cable

Connect the Duckiebot and your laptop to the same network
switch.

Allow 30 s - 1 minute for the DHCP to work.

### Option 2: Duckietown network

The Duckiebot connects automatically to a 2.4 GHz network
called "`duckietown`" and password "`quackquack`".

Connect your laptop to the same wireless network.


## Ping the Duckiebot

To test that the Duckiebot is connected, try to ping it.

The hostname of a freshly-installed duckiebot is `duckiebot-not-configured`:

    laptop $ ping duckiebot-not-configured.local

You should see output similar to the following:

    PING duckiebot-not-configured.local (![X.X.X.X]): 56 data bytes
    64 bytes from ![X.X.X.X]: icmp_seq=0 ttl=64 time=2.164 ms
    64 bytes from ![X.X.X.X]: icmp_seq=1 ttl=64 time=2.303 ms
    ![...]

## SSH to the Duckiebot

Next, try to log in using SSH, with account `ubuntu`:

    laptop $ ssh ubuntu@duckiebot-not-configured.local

The password is `ubuntu`.

By default, the robot boots into Byobu.

Please see [](#byobu) for an introduction to Byobu.

XXX Not sure it's a good idea to boot into Byobu.

## (For `C1`) Configure the robot-generated network
XXX `D17-0+w`
The Duckiebot in configuration `D17-C0+w` can create a WiFi network.

It is a 5 GHz network; this means that you need to have a 5 GHz
WiFi adapter in your laptop.

First, make sure that the Edimax is correctly installed.
Using `iwconfig`, you should see four interfaces:

    duckiebot $ iwconfig
    wlx![AABBCCDDEEFFGG]  unassociated  Nickname:"rtl8822bu"

    ![...]

    lo        no wireless extensions.

    enxb827eb1f81a4  no wireless extensions.

    wlan1     IEEE 802.11bgn  ESSID:"duckietown"

    ![...]


Make note of the name `wlx![AABBCCDDEEFFGG]`.

Look up the MAC address using the command:

    duckiebot $ ifconfig wlx![AABBCCDDEEFFGG]
    wlx![AABBCCDDEEFFGG] Link encap:Ethernet  HWaddr ![AA:BB:CC:DD:EE:FF:GG]

Then, edit the connection file

    /etc/NetworkManager/system-connections/create-5ghz-network

Make the following changes:

* Where it says `interface-name=![...]`, put "`wlx![AABBCCDDEEFFGG]`".
* Where it says `mac-address=![...]`, put "`![AA:BB:CC:DD:EE:FF:GG]`".
* Where it says `ssid=duckiebot-not-configured`, put "`ssid=![robot name]`".

Reboot.

At this point you should see a new network being created named "`![robot name]`".

You can connect with the laptop to that network.

If the Raspberry Pi's network interface is connected to the `duckietown` network
and to the internet, the Raspberry Pi will act as a bridge to the internet.


## Setting up wireless network configuration

You are connected to the Duckiebot via WiFi, but the Duckiebot also needs to connect to the internet in order to get updates and install some software. There are three options for achieving this:

### Option 1: `duckietown` WiFi 

Check with your phone or laptop if there is a WiFi in reach with the name of `duckietown`. If there is, you are all set. The defaut configuration for the Duckiebot is to have one WiFi adapter connect to this network and the other broadcast the access point which you are currently connected to.

### Option 2: `eduroam` WiFi

If there should be no `duckietown` network in reach then you have to manually add a network configuration file for the network that you'd like to connect to. Most universities around the world should have to `eduroam` network available. You can use it for connecting your Duckiebot.

Save the following block as `TODO: filename eduroam wifi setting`:

    TODO code block for eduroam connection

### Option 3: custom WiFi

If neither `duckietown` nor `eduroam` are available, you can add your own configuration file. Here is an example for a standard WPA2-private home network. Save the following block as `TODO: filename custom wifi setting`:

    TODO code block for custom connection

## Update the system

Next, we need to update to bring the system up to date.

Use these commands

    duckiebot $ sudo apt update
    duckiebot $ sudo apt dist-upgrade

## Give a name to the Duckiebot

It is now time to give a name to the Duckiebot.

These are the criteria:

- It should be a simple alphabetic string (no numbers or other characters like "`-`", "`_`", etc.) .
- It will always appear lowercase.
- It cannot be a generic name like "`duckiebot`", "`robot`" or similar.

From here on, we will refer to this string as "`![robot name]`".
Every time you see `![robot name]`, you should substitute the name that you chose.


## Change the hostname

We will put the robot name in configuration files.

Note: Files in `/etc` are only writable by `root`,
so you need to use `sudo` to edit them. For example:

    duckiebot $ sudo vi ![filename]

Edit the file

    /etc/hostname

and put "`![robot name]`" instead of `duckiebot-not-configured`.

Also edit the file

    /etc/hosts

and put "`![robot name]`" where `duckiebot-not-configured` appears.

The first two lines of `/etc/hosts` should be:

    127.0.0.1   localhost
    127.0.1.1   ![robot name]

Note: there is a command `hostname` that promises to change the hostname.
However, the change given by that command does not persist across reboots. You
need to edit the files above for the changes to persist.

Note: Never add other hostnames in `/etc/hosts`. It is a tempting
fix when DNS does not work, but it will cause other problems
subsequently.

Then reboot the Raspberry Pi using the command

    $ sudo reboot

After reboot, log in again, and run the command `hostname` to check that the
change has persisted:

    $ hostname
    ![robot name]

## Expand your filesystem {#expand-filesystem}

If your SD card is larger than the image, you'll want to expand the filesystem on your robot so that
you can use all of the space available. Achieve this with:

    duckiebot $ sudo raspi-config --expand-rootfs

and then reboot

    duckiebot $ sudo shutdown -r now

once rebooted you can test whether this was successful by doing

    duckiebot $ df -lh

the output should give you something like:

```
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        15G  6.3G  8.2G  44% /
devtmpfs        303M     0  303M   0% /dev
tmpfs           431M     0  431M   0% /dev/shm
tmpfs           431M   12M  420M   3% /run
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           431M     0  431M   0% /sys/fs/cgroup
/dev/mmcblk0p1   63M   21M   43M  34% /boot
tmpfs            87M     0   87M   0% /run/user/1000
```
You should see that the Size of your `/dev/root` Filesystem is "close" to the size of your SD card.


## Create your user {#create-user-on-duckiebot}

You must not use the `ubuntu` user for development.
Instead, you need to create a new user.

Choose a user name, which we will refer to as `![username]`.

To create a new user:

    duckiebot $ sudo useradd -m ![username]

Make the user an administrator by adding it to the group `sudo`:

    duckiebot $ sudo adduser ![username] sudo

Make the user a member of the groups `input`, `video`, and `i2c`

    duckiebot $ sudo adduser ![username] input
    duckiebot $ sudo adduser ![username] video
    duckiebot $ sudo adduser ![username] i2c

Set the shell `bash`:

    duckiebot $ sudo chsh -s /bin/bash ![username]


To set a password, use:

    duckiebot $ sudo passwd ![username]

At this point, you should be able to login to the new user from the laptop
using the password:

    laptop $ ssh ![username]@![robot name]

Next, you should repeat some steps that we already described.

### Basic SSH config

Do the basic SSH config.

See: The procedure is documented in [](#ssh-local-configuration).

### Create key pair for `![username]`

Next, create a private/public key pair for the user; call it `![username]@![robot name]`.

See: The procedure is documented in [](#howto-create-key-pair).

### Add `![username]`'s public key to Github

Add the public key to your Github account.

See: The procedure is documented in [](#howto-add-pubkey-to-github).

If the step is done correctly, this command should succeed:

    duckiebot $ ssh -T git@github.com

### Local Git configuration

See: This procedure is in [](#howto-git-local-config).

### Set up the laptop-Duckiebot connection

Make sure that you can login passwordlessly to your user from the laptop.

See: The procedure is explained in [](#howto-login-without-password).
In this case, we have:
 `![local]` = laptop, `![local-user]` = your local user on the laptop,
 `![remote]` = `![robot name]`, `![remote-user]` = `![username]`.

If the step is done correctly, you should be able to login from the laptop to
the robot, without typing a password:

    laptop $ ssh ![username]@![robot name]

### Some advice on the importance of passwordless access

In general, if you find yourself:

- typing an IP
- typing a password
- typing `ssh` more than once
- using a screen / USB keyboard

it means you should learn more about Linux and networks, and you are setting
yourself up for failure.

Yes, you "can do without", but with an additional 30 seconds of your time. The
30 seconds you are not saving every time are the difference between being
productive roboticists and going crazy.

Really, it is impossible to do robotics when you have to think about IPs and
passwords...

## Other customizations

If you know what you are doing, you are welcome to install and use additional
shells, but please keep Bash as be the default shell. This is
important for ROS installation.

For the record, our favorite shell is ZSH with `oh-my-zsh`.

## Hardware check: camera {#camera-hardware-check}

Check that the camera is connected using this command:

    duckiebot $ vcgencmd get_camera
    supported=1 detected=1

If you see `detected=0`, it means that the hardware connection is not working.

You can test the camera right away using a command-line utility
called `raspistill`.

Use the `raspistill` command to capture the file `out.jpg`:

    duckiebot $ raspistill -t 1 -o out.jpg

Then download `out.jpg` to your computer using `scp` for inspection.

See: For instructions on how to use `scp`, see [](#howto-download-file-with-scp).

### Troubleshooting

Symptom: `detected=0`

Resolution: If you see `detected=0`, it is likely that the camera is not connected correctly.

If you see an error that starts like this:

    mmal: Cannot read camera info, keeping the defaults for OV5647
    ![...]
    mmal: Camera is not detected. Please check carefully the camera module is installed correctly.

then, just like it says: "Please check carefully the camera module is installed correctly.".
