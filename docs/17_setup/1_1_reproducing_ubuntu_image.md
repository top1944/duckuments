# Reproducing the Ubuntu image for the Duckiebot

These are the instructions to reproduce the Ubuntu image that we use.

We organize this in three steps:

- Step 1: From downloaded image, to updated setup.
- Step 2: Installation of ros and other dependencies.

## Step 1: From blank to minimal setup

Resources necessaries:

- Internet connection to download the packages.
- A PC running any Linux with an SD card reader.
- Time: about 20 minutes.

Results:

-  A baseline Ubuntu Mate 16.04.2 image with updated software.

### Download and uncompress the Ubuntu Mate image

Download the image from the page https://ubuntu-mate.org/download/.

The file we are looking for is:

    filename: ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz
        size: 1.2 GB
      SHA256: dc3afcad68a5de3ba683dc30d2093a3b5b3cd6b2c16c0b5de8d50fede78f75c2

Run the command `sha256sum` to make sure you have the right version:

    laptop $ sha256sum ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz
    dc3afcad68a5de3ba683dc30d2093a3b5b3cd6b2c16c0b5de8d50fede78f75c2

If the string does not correspond exactly, your download was corrupted.
Delete the file and try again.

Then decompress using the command `xz`:

    laptop $ xz -d ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz

### Finding your device name for the SD card an unmount it

    laptop $ df -h

Inspect the output for something like `/dev/mmcblk0`
If you don't see anything like that, take out the sd card and run the command again and see what disappeared.

Next unmount all the partitions associated with the device probably:

    laptop $ sudo umount /dev/mmcblk0p1
    laptop $ sudo umount /dev/mmcblk0p2 

### Burn the image to an SD card

Then burn to disc using the command `dd`:

    laptop $ sudo dd of=DEVICE if=IMG status=progress bs=4M

where `IMG` is the `.img` file you unzipped, and `DEVICE` is the device
that represents your SD card reader.

### Verify that the SD card was created correctly

Remove the SD card and plug it in again in the laptop.

Ubuntu will mount two partitions, by the name of `PI_ROOT` and `PI_BOOT`.


### Installation

Boot the disk in the Raspberry PI.

I chose the following options:

    language: English
    username: ubuntu
    password: ubuntu
    hostname: duckiebot

Then I rebooteed.

### Update installed software

The WiFi was connected to airport network `duckietown`
with password `quackquack`.

Afterwards I upgraded all the software preinstalled with these
commands:

    duckiebot $ sudo apt-get update
    duckiebot $ sudo apt-get dist-upgrade
