# Linux


## Background reading

- UNIX
- Linux
- free software; open source software.

<!--

### Can you do the following?

- Log in the duckiebot from the laptop;
- Log in the duckiebot from the laptop, without using password;


### Can you do the following?

- Copy a file from the duckiebot to the laptop;
- Copy a file from the laptop to the duckiebot; -->



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
