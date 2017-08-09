# Duckiebot Initialization

Prerequisites:

* A complete Duckiebot in configuration C0.

* An SD card with image v2.0.

Result:

* A Duckiebot that is ready to use


## Login and update base system

If you are in an environment where there is a wireless network with SSID "`duckietown`" and password "`quackquack`" then good news! your robot is (should be) already connected to the network. If not you can either connect through an wired LAN or worst case connect a monitor and keyboard.

To ssh into your robot do:

    laptop $ ssh ubuntu@![robot name].local

The pwd is `ubuntu`.

## Learn to love Byobu

By default your robot terminal boots into `byobu`.

Yes, you need to learn to use byobu, unless you know an equivalent program. You will save much time later.

Byobu is "GNU screen" with fancy configuration. Please learn about Byobu here: [http://byobu.co/](http://byobu.co/)

Quick commands reference, using function keys:

F2: open a new terminal

F3/F4: switch among the terminals

Ctrl-F6: close current terminal

Using control sequences:

    ctrl-A then C: creates new terminal
    ctrl-A then number: switches to terminal

To quit a terminal:

    duckiebot $ exit


## Wireless network configuration

The duckiebot is configured by default to connect to a wireless network with SSID "duckietown". If that is not your SSID then you will need to change/add a new clause to the `/etc/wpa_supplicant/wpa_supplicant.conf` file:

    duckiebot $ sudo vi /etc/wpa_supplicant/wpa_supplicant.conf

you will see a block:

    network={
     ssid="duckietown"
     scan_ssid=1
     psk="quackquack"
     priority=10
    }

either modify that one or add a new one with your ssid and password (assuming you have a roughly similar wireless network setup - if not then you might need to change some of the other attributes)

## Update basic system

Use:

    duckiebot $ sudo apt update
    duckiebot $ sudo apt dist-upgrade

## Camera Test

You can test the camera right away using a command-line utility
called `raspistill`.

Use this command to capture the file `out.jpg`:

    duckiebot $ raspistill -t 1 -o out.jpg

Then download `out.jpg` using `scp`:

    laptop $ scp ubuntu@duckiebot.local:~/out.jpg out.jpg

## Do not change the default shell

If you know what you are doing, you are welcome to install and use additional shells (such as zsh), but please keep Bash as be the default shell. This is important for some scripts.

(For the record, our favorite shell is ZSH with `oh-my-zsh`.)

## Set hostname

Choose a name for your robot. This is a simple string that will always appear lowercase.

Edit `/etc/hostname` and put "`![robot name]`" instead of `duckiebot`.

    duckiebot $ sudo vi /etc/hostname

Also edit /etc/hosts and put "`![robot name]`" instead of `duckiebot`:

    duckiebot $ sudo vi /etc/hosts

Note: the command

    sudo hostname `![host name]`

is not enough to actually change the hostname.
The change will not persist. You need to go through the steps above.

**NEVER ADD HOSTNAMES IN `/etc/hosts` (e.g. `duckiebot.local`)**

XXX The above should be clarified; we just told them to do it.

Then reboot:

    $ sudo reboot

When you reboot, you should see your new hostname:

    Ubuntu 16.04.2 LTS
    ![robot name] login:
