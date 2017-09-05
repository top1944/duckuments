# Student guide

## Preparation before you start the class

TODO: to write

These are tasks that you can start doing before the class starts.

### Install Ubuntu on your laptop and related software

Install Ubuntu, ROS, Atom, Liclipse, the duckuments, etc. on your laptop.

See: [](#setup-laptop)


### Can I use a virtual machine instead of dual booting?

Running things in a virtual machine is possible, but **not supported**.

This means that while there is a way to make it work (in fact,
Andrea develops in a VMWare virtual machine on OS X), but
we cannot guarantee that the instructions will work on a virtual machine,
and, most importantly, the TAs will *not* help you debug those problems.

The issues that you will encounter are of two types.

There are performance issues. For example, 3D acceleration might not work in the
virtual machine.

Most importantly, there are network configuration issues.
 These come up late in the class, when you start connecting the laptop to the Duckiebot.
At that point, ROS makes certain assumptions about subnets, that might not be satisfied by
your virtual machine configuration. At that point, you need to be relatively skilled to fix it.

So, the required skill here is not "being able to install Ubuntu on a virtual machine",
but rather "Being able to debug network problems involving multiple real/virtual networks
and  multiple real/virtual adapters".

Here's a quiz: do these commands look familiar to you?

    $ route add default gw 192.168.1.254 eth0
    $ iptables -A FORWARD -o eth1 -j ACCEPT

If so, then things will probably work ok for you.

Otherwise, we strongly suggest that you use dual booting instead of a virtual machine.



### Refreshers

Read the following preliminaries:

- ...
- ...


##
