# First Steps in Duckietown {#first-steps-for-students status=ready}

## Onboarding Procedure {#onboarding-fall2017}

Welcome aboard! We are so happy you are joining us at Duckietown!

This is your onboarding procedure. Please read all the steps and then complete all the steps. Failure to follow these steps in order will cause unnecessary confusion.

### Github sign up {#onboarding-github-signup}

If you don't already have a Github account, sign up now.

See: [Github signup page](https://github.com/join)

Please use your full name when it asks you. Ideally, the username should be
something like `FirstLast` or something that resembles your name.

When you sign up, use your university email.
This allows to claim an educational discount that will be useful later.

### Questionnaire

Next, fill in this questionnaire:

[Preliminary Student Questionnaire](https://docs.google.com/forms/d/e/1FAIpQLSdTo235gCM-GRWKY0EYmfCieC4-FEsO1CqQIqE8EaQz0y8KWA/viewform)

**Zurich: Please fill in questionnaire by Tuesday, 3 pm (extended from original deadline of 12pm).**

Point of contact: if you have problems with this step, please contact
Jacopo Tani &lt;tanij@eth.ch&gt;.

### Accept invite to Github organization Duckietown

After we receive the questionnaire, we will invite you to the Duckietown
organization. You need to accept the invite; until you do, you are not part of the
Duckietown organization and can't access our repositories.

The invite should be waiting for you [at this page](https://github.com/duckietown).

### Accept the invite to Slack

After we receive the questionnaire, we will invite you to Slack.

The primary mode of online confabulation between staff and students is Slack, a team communication forum that allows the community to collaborate in making Duckietown awesome.

(Emails are otherwise forbidden, unless they relate to a private, university-based administrative concern.)

We will send you an invite to Slack. Check your inbox.

If after 24 hours from sending the questionnaire you haven't received the invite,
contact HR representative Kirsten Bowser &lt;akbowser@gmail.com&gt;.


**What is Slack?** More details about Slack are available [here](#slack).
In particular, remember to disable email notifications.

**Slack username**. When you accept your Slack invite, please identify yourself with first and last names followed by a "-" and your affiliation.

<div class='example-usage' markdown="1">
Andrea Censi - ETHZ
</div>

**Slack picture**. Please add a picture (relatively professional, with duckie accessories encouraged).

**Slack channels**. A brief synopsis of all the help-related Slack channels is here: [](#slack_channels).

Check out all the channels in Slack, and add yourself to those that pertain or interest you. Be sure to introduce yourself in the General channel.

##  (optional) Add Duckietown Engineering Linkedin profile

This is an optional step.

If you wish to connect with the Duckietown alumni network, on LinkedIn
you can join the company "Duckietown Engineering", with the title
"Vehicle Autonomy Engineer in training". Please keep updated your
Linkedin profile with any promotions you might receive in the future.



<!--
### Google Documents

We need a Google-compatible email address so that you can view all the necessary Google Docs and Sheets. Send yours to Duckietown HR via (you guessed it!) Slack.

If you experience any difficulties don't hesitate to contact Duckietown HR on the #help-accounts channel.

TLDR: Follow naming guidelines in Slack, send Github username and gmail address to Duckietown HR via Slack. NO EMAILS. -->


## Laptops

If you do not have access to a laptop that meets the following requirements, please post a note in the channel `#help-laptops`.

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

## Next steps for people in Zurich

### Get acquainted with class journal and class logistics

At this point, you should be all set up, able to access our Github
repositories, and, most important of all, able to ask for help on Slack.

You can now get acquainted to the class journal, to know the next steps.

See: [](#ETH-journal)

Also, in this page, we will collect the logistics information (lab times, etc.).

See: [](#ETH-logistics)

### Make sure you can edit the Duckuments

To receive your Duckiebox on Wednesday Sep 27, you need to prove to be able
to edit the Duckuments successfully.

See: See the instructions [in this section](#1709-duckieboxes).

If you can't come on Wednesday, please contact one of the TAs.


## Next steps for people in Chicago

TODO: to write
