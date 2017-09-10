# First Steps for Students {#first-steps-for-students}

## Onboarding Procedure {#onboarding-fall2017}

Welcome aboard! We are so happy you are joining us at Duckietown!

### Slack

The primary mode of online confabulation between staff and students is Slack, a team communication forum that allows the community to collaborate in making Duckietown awesome.

Note: Emails are otherwise forbidden, unless they relate to a private, university-based admistrative concern.

If are reading this you should have recieved an invitation to join our Slack - check your inbox. If you have not recieved an invitation to Slack, you need to send an email to Kirsten Bowser &lt;akbowser@gmail.com&gt;.

More details about Slack are available [here](#slack)


A brief synopsis of all of the help related Slack channels is here: [](#slack_channels).

Check out all the channels in Slack, and add yourself to those that pertain or interest you. Be sure to introduce yourself in the General channel.


### Github

The next thing you need to do is provide Duckietown HR (Kirsten Bowser) with your Github username via Slack.

If you don't already have a Github account, follow the steps here: [](#github-access)


<!--
### Google Documents

We need a Google-compatible email address so that you can view all the necessary Google Docs and Sheets. Send yours to Duckietown HR via (you guessed it!) Slack.

If you experience any difficulties don't hesitate to contact Duckietown HR on the #help-accounts channel.

TLDR: Follow naming guidelines in Slack, send Github username and gmail address to Duckietown HR via Slack. NO EMAILS. -->


## Laptop Requirements

You need a laptop with these specifications:

- Linux Ubuntu 16.04 installed natively (dual boot), not in a virtual machine.
  See [](#can-we-use-vm) below for a discussion of the virtual machine option.
- A WiFi interface that supports 5 GHz wireless networks. If you have a 2.4 GHz WiFi, you will not be able to comfortably stream images from the robot; moreover, you will need to adapt certain instructions.
- Minimum 50 GB of free disk space in addition to the OS. Ideally you have 200 GB+. This is for storing and processing logs.


<!-- Ability to store somewhere (at home or somewhere on campus), and to bring regularly to the lab, a box, or “Duckiebox”, of dimensions 30 cm × 30 cm × 60 cm. This box has to be used to contain your Duckiebot and associate materials. -->

There are no requirements of having a particularly good GPU, or a particularly
good CPU.  You will be developing code that runs on a Raspberry PI. Any laptop
bought in the last 3 years should be powerful enough. However, having a good
CPU / lots of RAM makes it faster to run regression tests.

If you do not have a laptop that meets these requirements, please post a note in the channel `help-laptops` and we will resolve the issue.

### Can I use a virtual machine instead of dual booting? {#can-we-use-vm}

Running things in a virtual machine is possible, but **not supported**.

This means that while there is a way to make it work (in fact,
Andrea develops in a VMWare virtual machine on OS X),
we cannot guarantee that the instructions will work on a virtual machine,
and, most importantly, the TAs will *not* help you debug those problems.

The issues that you will encounter are of two types.

* There are performance issues. For example, 3D acceleration might not work in the
virtual machine.

* Most importantly, there are network configuration issues. These come up late in
the class, when you start connecting the laptop to the Duckiebot. At that
point, ROS makes certain assumptions about subnets, that might not be satisfied
by your virtual machine configuration. At that point, you need to be relatively
skilled to fix it.

So, the required skill here is not "being able to install Ubuntu on a virtual
machine", but rather "Being able to debug network problems involving multiple
real/virtual networks and  multiple real/virtual adapters".

Here's a quiz: do these commands look familiar to you?

    $ route add default gw 192.168.1.254 eth0
    $ iptables -A FORWARD -o eth1 -j ACCEPT

If so, then things will probably work ok for you.

Otherwise, we strongly suggest that you use dual booting instead of a virtual machine.


## Start learning

Here's something you can start learning before the class.

### Learn about Duckietown

Read about Duckietown's history; watch the Duckumentary.

See: [](#part:duckietown-project)

### Learn about Git and Github

Start learning about Git and Github.

See: [](#git-reference)


### Math refresher

Do a bit of a refresher on some math basics.

Linear Algegra: [](#linear_algebra)
Probability Basics: [](#probability_basics)
