# SD Card speed

Test SD Card (or any disk) speed using:

    $ dd if=/dev/zero of=~/test.tmp bs=500K count=1024
    $ sync
    $ echo 3 | sudo tee /proc/sys/vm/drop_caches
    $ dd if=~/test.tmp of=/dev/null bs=500K count=1024
    $ rm ~/test.tmp

Andrea's results:

    524288000 bytes (524 MB, 500 MiB) copied, 30.2087 s, 17.4 MB/s
    524288000 bytes (524 MB, 500 MiB) copied, 23.3568 s, 22.4 MB/s

That is write 17.4 MB/s, read 22 MB/s. 

# misc

    $ sudo apt install iotop

# network

    $ ifconfig

# wireless networks

    $ sudo iwlist ![interface] scan | grep SSID


Check if it supports 5 GHz:

    $ sudo iwlist wlan0 freq

In our case:

    wlx74da38c9caa0  20 channels in total; available frequencies :
      Channel 01 : 2.412 GHz
      Channel 02 : 2.417 GHz
      Channel 03 : 2.422 GHz
      Channel 04 : 2.427 GHz
      Channel 05 : 2.432 GHz
      Channel 06 : 2.437 GHz
      Channel 07 : 2.442 GHz
      Channel 08 : 2.447 GHz
      Channel 09 : 2.452 GHz
      Channel 10 : 2.457 GHz
      Channel 11 : 2.462 GHz
      Channel 36 : 5.18 GHz
      Channel 40 : 5.2 GHz
      Channel 44 : 5.22 GHz
      Channel 48 : 5.24 GHz
      Channel 149 : 5.745 GHz
      Channel 153 : 5.765 GHz
      Channel 157 : 5.785 GHz
      Channel 161 : 5.805 GHz
      Channel 165 : 5.825 GHz
      Current Frequency:2.437 GHz (Channel 6)

Note that only *some* 5Ghz channels are supported:
36, 40, 44, 48, 149, 153, 157, 161, 165.
