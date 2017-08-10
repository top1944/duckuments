# Linux


## Background reading

- UNIX
- Linux
- free software; open source software.

<!--

### Can you do the following?

- Log in the Duckiebot from the laptop;
- Log in the Duckiebot from the laptop, without using password;


### Can you do the following?

- Copy a file from the Duckiebot to the laptop;
- Copy a file from the laptop to the Duckiebot; -->



## VIM

The editor to choose is VI, or more precisely, `vim` (improved vi).

Install like this:

    $ sudo apt install vim

Documentation:

* [A VIM tutorial](http://www.openvim.com/)

## Ubuntu packaging

### `apt install`

### `apt update`

### `apt dist-upgrade`


## Measuring resource usage

### Testing SD Card and disk speed

Test SD Card (or any disk) speed using the following commands,
which write to a file called `![filename]`.

    $ dd if=/dev/zero of=![filename] bs=500K count=1024
    $ sync
    $ echo 3 | sudo tee /proc/sys/vm/drop_caches
    $ dd if=![filename] of=/dev/null bs=500K count=1024
    $ rm ![filename]

Note the `sync` and the `echo` command are very important.

Example results:

    524288000 bytes (524 MB, 500 MiB) copied, 30.2087 s, 17.4 MB/s
    524288000 bytes (524 MB, 500 MiB) copied, 23.3568 s, 22.4 MB/s

That is write 17.4 MB/s, read 22 MB/s.

### Measuring CPU usage using `htop`

You can use `htop` to monitor CPU usage.

    $ sudo apt install htop

### Measuring I/O usage using `iotop`

    $ sudo apt install iotop

## How to burn an image to an SD card {#howto-burn-image}

<div class='requirements' markdown='1'>

Requires:

- A blank SD card.
- An image file to burn.
- An Ubuntu computer with an SD reader.

Results:

- A burned image.

</div>

### Finding your device name for the SD card

First, find out what is the device name for the SD card.

Insert the SD Card in the slot.

Run the command:

    $ sudo fdisk -l

Find your device name, by looking at the sizes.

For example, the output might contain:

    Disk /dev/mmcblk0: 14.9 GiB, 15931539456 bytes, 31116288 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes

In this case, the device is `/dev/mmcblk0`. That will be the `![device]`
in the next commands.

You may see `/dev/mmcblk0pX` or a couple of similar entries for each partition on the card,
where `X` is the partition number. If you don't see anything like that, take out
the SD card and run the command again and see what disappeared.

### Unmount partitions

Before proceeding, unmount all partitions.

Run `df -h`. If there are partitions like `/dev/mmcblk0p![n]`, then unmount
each of them. For example:

    laptop $ sudo umount /dev/mmcblk0p1
    laptop $ sudo umount /dev/mmcblk0p2


### Burn the image

Now that you know that the device is `![device]`,
you can burn the image to disk.

Let the image file be `![image file]`.

Burn the image using the command `dd`:

    laptop $ sudo dd of=![device] if=![image file] status=progress bs=4M

Note: Use the name of the device, without partitions. i.e., `/dev/mmcblk0`, not
`/dev/mmcblk0pX`.



## Byobu

You need to learn to use `byobu`. It will save much time later.

Byobu is "GNU `screen`" with fancy configuration; if you know `screen`,
that's fine as well.

Please learn about Byobu here:

- [http://byobu.co/](http://byobu.co/)

Install using:

    $ sudo apt install byobu

### Advantages of using Byobu

TODO: To write

### Quick command reference

Quick commands reference, using function keys:

- `F2`: open a new terminal.
- `F3`/`F4`: switch among the terminals.
- `Ctrl-F6`: close current terminal.

Using control sequences:

- `ctrl-A` then `C`: creates new terminal.
- `ctrl-A` then a number: switches to that terminal.
- `ctrl-A` then `D`: detaches the terminal.

To quit a terminal, just use `exit`.
