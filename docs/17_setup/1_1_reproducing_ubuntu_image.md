# Reproducing the image

These are the instructions to reproduce the Ubuntu image that we use.

Please note that the image is already available, so you don't need to do this manually.

However, this documentation might be useful if you would like to port the software to a different distribution.


Resources necessaries:

- Internet connection to download the packages.
- A PC running any Linux with an SD card reader.
- Time: about 20 minutes.

Results:

-  A baseline Ubuntu Mate 16.04.2 image with updated software.


## Download and uncompress the Ubuntu Mate image

Download the image from the page

> [https://ubuntu-mate.org/download/](https://ubuntu-mate.org/download/)

The file we are looking for is:

    filename: ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz
        size: 1.2 GB
      SHA256: dc3afcad68a5de3ba683dc30d2093a3b5b3cd6b2c16c0b5de8d50fede78f75c2

After download, run the command `sha256sum` to make sure you have the right version:

    laptop $ sha256sum ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz
    dc3afcad68a5de3ba683dc30d2093a3b5b3cd6b2c16c0b5de8d50fede78f75c2

If the string does not correspond exactly, your download was corrupted.
Delete the file and try again.

Then decompress using the command `xz`:

    laptop $ xz -d ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz

## Burn the image to an SD card

Next, burn the image on to the SD card.

See: This procedure is explained in [](#howto-burn-image).


### Verify that the SD card was created correctly

Remove the SD card and plug it in again in the laptop.

Ubuntu will mount two partitions, by the name of `PI_ROOT` and `PI_BOOT`.


### Installation

Boot the disk in the Raspberry PI.

Choose the following options:

    language: English
    username: ubuntu
    password: ubuntu
    hostname: duckiebot

Choose the option to log in automatically.

Reboot.

### Update installed software

The WiFi was connected to airport network `duckietown`
with password `quackquack`.

Afterwards I upgraded all the software preinstalled with these
commands:

    duckiebot $ sudo apt update
    duckiebot $ sudo apt dist-upgrade

Expect `dist-upgrade` to take quite a long time (up to 2 hours).


## Raspberry PI Config

The Raspberry PI is not accessible by SSH by default.

Run `raspi-config`:

    duckiebot $ sudo raspi-config

choose "3. Interfacing Options", and enable SSH,

We need to enable the camera and the I2C bus.

choose "3. Interfacing Options", and enable camera, and I2C.

Also disable the graphical boot
<!-- In "5. Advanced options", "A3 Memory Split", select 256 MB for the GPU memory. -->


## Install packages

Install these packages.

Etckeeper:

    duckiebot $ sudo apt install etckeeper

Editors / shells:

    duckiebot $ sudo apt install -y vim emacs byobu zsh

Git:

    duckiebot $ sudo apt install -y git git-extras


Other:

    duckiebot $ sudo apt install htop atop nethogs iftop
    duckiebot $ sudo apt install aptitude apt-file

Development:

    duckiebot $ sudo apt install -y build-essential libblas-dev liblapack-dev libatlas-base-dev gfortran libyaml-cpp-dev

Python:

    duckiebot $ sudo apt install -y python-dev ipython python-sklearn python-smbus
    duckiebot $ sudo pip install scipy --upgrade

I2C:

    duckiebot $ sudo apt install -y i2c-tools

You may need to do the following (but might be done already through `raspi-config`):

    duckiebot $ sudo usermod -a -G i2c ubuntu
    duckiebot $ sudo udevadm trigger


## Install Edimax driver

First, mark the kernel packages as not upgradeable:

    $ sudo apt-mark hold raspberrypi-kernel raspberrypi-kernel-headers
    raspberrypi-kernel set on hold.
    raspberrypi-kernel-headers set on hold

Then, download and install the Edimax driver from [this repository](https://github.com/duckietown/rtl8822bu).


## Install ROS

The first commands are copied from [this page][ros-ubuntu].

[ros-ubuntu]: http://wiki.ros.org/kinetic/Installation/Ubuntu

Tell Ubuntu where to find ROS:

    duckiebot $ sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

Tell Ubuntu that you trust the ROS people (they are nice folks):

    duckiebot $ sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

Fetch the ROS repo:

    duckiebot $ sudo apt update

Now install the mega-package `ros-kinetic-desktop-full`.

    duckiebot $ sudo apt install ros-kinetic-desktop-full

There's more to install:

    duckiebot $ sudo apt install ros-kinetic-{tf-conversions,cv-bridge,image-transport,camera-info-manager,theora-image-transport,joy,image-proc,compressed-image-transport,phidgets-drivers,imu-complementary-filter,imu-filter-madgwick}


## Wireless configuration (old version)

XXX This is the old version.

There are two files that are important to edit.

The file `/etc/network/interfaces` should look like this:

```
# interfaces(5) file used by ifup(8) and ifdown(8)
# Include files from /etc/network/interfaces.d:
#source-directory /etc/network/interfaces.d

auto wlan0

# The loopback network interface
auto lo
iface lo inet loopback

# Wireless network interface
allow-hotplug wlan0
iface wlan0 inet dhcp
wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
iface default inet dhcp
```

The file `/etc/wpa_supplicant/wpa_supplicant.conf` should look like this:

```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
ssid="duckietown"
psk="quackquack"
proto=RSN
key_mgmt=WPA-PSK
pairwise=CCMP
auth_alg=OPEN
}
network={
   key_mgmt=NONE
}
```

## Wireless configuration

The files that describe the network configuration are
in the directory

    /etc/NetworkManager/system-connections/

This is the contents of the connection file `duckietown`, which
describes how to connect to the `duckietown` wireless network:

    [connection]
    id=duckietown
    uuid=e9cef1bd-f6fb-4c5b-93cf-cca837ec35f2
    type=wifi
    permissions=
    secondaries=
    timestamp=1502254646

    [wifi]
    mac-address-blacklist=
    mac-address-randomization=0
    mode=infrastructure
    ssid=duckietown

    [wifi-security]
    group=
    key-mgmt=wpa-psk
    pairwise=
    proto=
    psk=quackquack

    [ipv4]
    dns-search=
    method=auto

    [ipv6]
    addr-gen-mode=stable-privacy
    dns-search=
    ip6-privacy=0
    method=auto

This is the file

    /etc/NetworkManager/system-connections/create-5ghz-network

Contents:

    [connection]
    id=create-5ghz-network
    uuid=7331d1e7-2cdf-4047-b426-c170ecc16f51
    type=wifi
    # Put the Edimax interface name here:
    interface-name=![wlx74da38c9caa0 - to change]
    permissions=
    secondaries=
    timestamp=1502023843

    [wifi]
    band=a
    # Put the Edimax MAC address here
    mac-address=![74:DA:38:C9:CA:A0 - to change]
    mac-address-blacklist=
    mac-address-randomization=0
    mode=ap
    seen-bssids=
    ssid=duckiebot-not-configured

    [ipv4]
    dns-search=
    method=shared

    [ipv6]
    addr-gen-mode=stable-privacy
    dns-search=
    ip6-privacy=0
    method=ignore

Note that there is an interface name and MAC address that need to be changed
on each PI.

## SSH server config

This enables the SSH server:

    $ sudo systemctl enable ssh


## Create swap Space

Do the following:

Create an empty file using the `dd` (device-to-device copy) command:

    duckiebot $ sudo dd if=/dev/zero of=/swap0 bs=1M count=512

This is for a 512 MB swap space.

Format the file for use as swap:

    duckiebot $ sudo mkswap /swap0

Add the swap file to the system configuration:

    duckiebot $ sudo vi /etc/fstab

Add this line to the bottom:

    /swap0 swap swap

Activate the swap space:

    duckiebot $ sudo swapon -a

## Passwordless sudo {#howto-passwordless-sudo}

First, make `vi` the default editor, using

    sudo update-alternatives --config editor

and then choose `vim.basic`.

Then run:

    $ sudo visudo

And then change this line:

    %sudo   ALL=(ALL:ALL) ALL

into this line:

    %sudo   ALL=(ALL:ALL) NOPASSWD:ALL


## Ubuntu user configuration

### SSH config

Create the SSH directory with appropriate permissions:

    duckiebot $ cd ~
    duckiebot $ mkdir -p ~/.ssh
    duckiebot $ chmod g-rwx,o-rwx ~/.ssh

Add `.authorized_keys` so that we can all do passwordless ssh.

The key is at the URL

    https://www.dropbox.com/s/pxyou3qy1p8m4d0/duckietown_key1.pub?dl=1

Download to `.ssh/authorized_keys`:

    duckiebot $ curl -o .ssh/authorized_keys ![URL above]
<!--
### Optional user preferences

Configure to automatically boot into `byobu`:

    duckiebot $ byobu-enable

This can be disabled with `byobu-disable`. -->


### Shell prompt

Add the following lines to `~ubuntu/.bashrc`:

    echo ""
    echo "Welcome to a duckiebot!"
    echo ""
    echo "Reminders:"
    echo ""
    echo "1) Do not use the user 'ubuntu' for development - create your own user."
    echo "2) Change the name of the robot from 'duckiebot' to something else."
    echo ""

    export EDITOR=vim
