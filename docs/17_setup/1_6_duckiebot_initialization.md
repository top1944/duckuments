# Duckiebot Initialization

Prerequisites:

- A mounted Duckiebot in configuration `D17-C0`.
- An SD card.
- A computer to download the image.
- A computer to burn the SD card.

Result:

- A Duckiebot that is ready to use.

XXX What does it mean "ready to use"?.

## Acquire and burn the image

TODO: where is image?

TODO: to write

Make sure that the image is downloaded correctly.

TODO: hash

Next, burn the image on disk.

See: The procedure of how to burn an image is explained in [](#howto-burn-image).

## Turn on

Put the SD Card in the Duckiebot.

Turn on the Duckiebot by connecting the power cable.

TODO: figure

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

Please see [](#sec:byobu) for an introduction to Byobu.

XXX: not sure it's a good idea to boot into Byobu.

## (For D17-C1) Configure the robot-generated network

The Duckiebot in configuration `D17-C0+w` can create a WiFi network.

It is a 5 GHz network; this means that you need to have a 5 GHz
WiFi adapter in your laptop.

First, make sure that the Edimax is correctly installed.
Using `iwconfig`, you should see four interfaces:

    $ iwconfig
    wlx![AABBCCDDEEFFGG]  unassociated  Nickname:"rtl8822bu"

    ![...]

    lo        no wireless extensions.

    enxb827eb1f81a4  no wireless extensions.

    wlan1     IEEE 802.11bgn  ESSID:"duckietown"

    ![...]


Make note of the name `wlx![AABBCCDDEEFFGG]`.

Look up the MAC address using the command:

    $ ifconfig wlx![AABBCCDDEEFFGG]
    wlx74da38c9caa0 Link encap:Ethernet  HWaddr ![AA:BB:CC:DD:EE:FF:GG]

Then, edit the connection file

    /etc/NetworkManager/system-connections/create-5ghz-network

Make the following changes:

* Where it says `interface-name=![...]`, put "`wlx![AABBCCDDEEFFGG]`".
* Where it says `mac-address=![...]`, put "`![AA:BB:CC:DD:EE:FF:GG]`".
* Where it says `ssid=duckiebot-not-configured`, put "`ssid=![robot name]`".

Reboot.

At this point you should see a new network being created named "`![robot name]`".

You can connect with the laptop to that network.

If the PI's network interface is connected to the `duckietown` network
and to the internet, the PI will act as a bridge to the internet.


## Setting up wireless network configuration

XXX This part is to be tested

The Duckiebot is configured by default to connect to a wireless network with
SSID `duckietown`. If that is not your SSID then you will need to change the
configuration.

You can add a new network by editing the file:

    /etc/wpa_supplicant/wpa_supplicant.conf

You will see a block like the following:

    network={
     ssid="duckietown"
     scan_ssid=1
     psk="quackquack"
     priority=10
    }

Add a new one with your SSS and password.

This assumes you have a roughly similar wireless network setup - if not then
you might need to change some of the other attributes.


## Update the system

Next, we need to update to bring the system up to date.

Use these commands

    duckiebot $ sudo apt update
    duckiebot $ sudo apt dist-upgrade


## Check that the camera works

Check that the camera is connected using this command:

    duckiebot $ vcgencmd get_camera
    supported=1 detected=1

If you see `detected=0`, it means that the hardware connection is not working.

You can test the camera right away using a command-line utility
called `raspistill`.

Use the `raspistill` command to capture the file `out.jpg`:

    duckiebot $ raspistill -t 1 -o out.jpg

Then download `out.jpg` to your computer using `scp` for inspection.

See [](#howto-download-file-with-scp)

### Troubleshooting

If you see `detected=0`, it is likely that the

If you see an error that starts like this:

    mmal: Cannot read cameara info, keeping the defaults for OV5647
    ![...]
    mmal: Camera is not detected. Please check carefully the camera module is installed correctly.

then, just like it says: "Please check carefully the camera module is installed correctly.".

## Give a name to the Duckiebot

It is now time to give a name to the Duckiebot.

These are the criteria:

- It should be a simple alphabetic string (no numbers or other characters like "`-`", "`_`", etc.) .
- It will always appear lowercase.

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

Then reboot the PI using the command

    $ sudo reboot

After reboot, log in again, and run the command
`hostname` to check that the change persisted:

    $ hostname
    ![robot name]


## Do not change the default shell

If you know what you are doing, you are welcome to install and use additional
shells (such as zsh), but please keep Bash as be the default shell. This is
important for some scripts.

(For the record, our favorite shell is ZSH with `oh-my-zsh`.)
