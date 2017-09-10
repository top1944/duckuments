# Student guide: the first steps

## Onboarding procedure {#onboarding-fall2017}

Welcome aboard! We are so happy you are joining us at Duckietown!

### Slack

The primary mode of online confabulation between staff and students is Slack, a team communication forum that allows the community to collaborate in making Duckietown awesome.

Download the Slack app --- it's much more convenient than using the website.

If are reading this you should have recieved an invitation to join our Slack - check your inbox. If you have not recieved an invitation to Slack, you need to send an email to Kirsten Bowser &lt;akbowser@gmail.com&gt;.

Note: Emails are otherwise forbidden, unless they relate to a private, university-based admistrative concern.

When you accept your Slack invite, please follow these rules in setting up your profile:

- username = last name
- first name = first name
- last name = last name (institution/location)

<div class='example-usage' markdown="1">
Here is an example: Andrea Censi from ETHZ is `@censi`, his name on Slack is "Andrea Censi (ETHZ)".
</div>

Check out all the channels in Slack, and add yourself to those that pertain or interest you. Be sure to introduce yourself in the General channel.

Please add a picture (relatively professional, so that we can use it for rosters when the time comes.)

Modify your settings to prevent email notifications, they are annoying and defeat the purpose of the communication forum. The point of Slack is that we don't have inboxes full of Duckietown emails.

### Github

The next thing you need to do is provide Duckietown HR (Kirsten Bowser) with your Github username via Slack.

If you don't already have a Github account, follow these steps:

1) Sign up for [GitHub](https://github.com/).

2) Use the same email associated with your Slack account. Your Github username should be the same as your Slack username if possible, otherwise something similar.

<div class='example-usage' markdown="1">
 `@censi` is the slack handle, the GitHub username is `AndreaCensi`.
</div>

3) Send your Github username to Duckietown HR via Slack.

4) Next, you need to *accept* the invite to the Duckietown organization. The invite should be waiting for you at the page [https://github.com/duckietown](https://github.com/duckietown).

<!--
### Google Documents

We need a Google-compatible email address so that you can view all the necessary Google Docs and Sheets. Send yours to Duckietown HR via (you guessed it!) Slack.

If you experience any difficulties don't hesitate to contact Duckietown HR on the #help-accounts channel.

TLDR: Follow naming guidelines in Slack, send Github username and gmail address to Duckietown HR via Slack. NO EMAILS. -->


## Preparation before the class

### Laptop Hardware

You need a laptop with these specifications:

- Linux Ubuntu 16.04 installed natively (dual boot), not in a virtual machine.
  See [](#can-we-use-vm) below for a discussion of the virtual machine option.
- A WiFi interface that supports 5 GHz wireless networks. If you have a 2.4 GHz WiFi, you will not be able to comfortably stream images from the robot; moreover, you will need to adapt certain instructions.
- Minimum 50 GB of free disk space in addition to the OS. Ideally you have 200 GB+. This is for storing and processing logs.
- You need (infrequent) access to an SD card reader/writer. A few times in the semester, you will be asked to burn an SD card image.

<!-- Ability to store somewhere (at home or somewhere on campus), and to bring regularly to the lab, a box, or “Duckiebox”, of dimensions 30 cm × 30 cm × 60 cm. This box has to be used to contain your Duckiebot and associate materials. -->

There are no requirements of having a particularly good GPU, or a particularly
good CPU.  You will be developing code that runs on a Raspberry PI. Any laptop
bought in the last 3 years should be powerful enough. However, having a good
CPU / lots of RAM makes it faster to run regression tests.


### Install Ubuntu on your laptop and related software

Install Ubuntu, ROS, Atom, Liclipse, the Duckuments, etc. on your laptop.

See: The procedure is explained in [](#setup-laptop)


### Can I use a virtual machine instead of dual booting? {#can-we-use-vm}

Running things in a virtual machine is possible, but **not supported**.

This means that while there is a way to make it work (in fact,
Andrea develops in a VMWare virtual machine on OS X),
we cannot guarantee that the instructions will work on a virtual machine,
and, most importantly, the TAs will *not* help you debug those problems.

The issues that you will encounter are of two types.

There are performance issues. For example, 3D acceleration might not work in the
virtual machine.

Most importantly, there are network configuration issues. These come up late in
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

Start learning about Git and Github. You don't have to read the entirety of the
following references now, but keep them "on your desk" for later reference.

See: [Good book](https://git-scm.com/book/en/v2)

See: [Git Flow](http://nvie.com/posts/a-successful-git-branching-model/)


### Math refresher

TODO: to write
