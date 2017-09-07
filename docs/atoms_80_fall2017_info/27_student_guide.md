# Student guide

## How to get help, how to check and report your progress {#org-sheets}

Please familiarize yourself with [this spreadsheet][sheets] and bookmark it
in your browser.

Yes, it's intimidating! You'll get used to it.

### The Areas sheet

The sheet called "Areas" describes the points of contact for
each part of this experience. These are the people that
can offer support. In particular, note that we list two points of contact:
one for America, and one for Europe. Moreover, there is a link
to a Slack channel, which is the place where to ask for help. (We'll get you
started on Slack in just a minute.)

(Later in the class, when you are all set up and running, we will
ask you to use tools like Github Issues to ask for help; in this
onboarding phase, you only need to care about Slack.)

### The Tasks sheet

The sheet called "Tasks" describes specific tasks that you must do
in a certain sequence.  Tasks include things like "assemble your robot"
or "sign up on Github".

The difference between the Areas sheet and the Task sheet is that
the Task sheet contains tasks that you have to do once; instead,
the Areas sheet contains ongoing activities.

In this sheet, each task is a row, and each person is a column. There is one
column for each person in the class, including instructors, TAs, mentors, and
students.

In this sheet we keep track of the class status. It is very, very important
for us to know the progress stage for everybody during the class.

Each task in the first column is linked to the documentation
that describes how to perform the task.

There are two points of contact listed, one for America and one for Europe.

The colored boxes have the following meaning:

- Grey: not ready. This means the task is not ready for you to start yet.
- Red: not started. The person has not started the task.
- Blue: in progress. The person is doing the task.
- Yellow: blocked. The person is blocked.
- Green: done. The person is done with the task.
- n/a: the task is not applicable to the person. (Certain tasks are staff-only.)

If there is a problem for a task, please add a comment, and in the comment
explain the problem. If the problem is solved, remember to remove the comment.

Students do not have (at least for now) editing access to the spreadsheet.
Therefore, it's the TAs that periodically update the spreadsheet.

At any time, if a student has a blocking problem with a task, they (or the TA) should add a comment to the corresponding cell. This is our "ticket system" - if students
put a comment, we'll make sure that their issue is resolved.




[sheets]: https://docs.google.com/spreadsheets/d/1uO1aq9zqBpLwo1qOzeBKKbB3CuAQAqM94T8B1AGpCKg/edit?usp=sharing



## Onboarding procedure {#onboarding-fall2017}

TODO: Kirsten, could you put here the onboarding procedure for the students?
Then in the welcome email, put a link to this section.
The link to this section is `http://purl.org/dth/onboarding-fall2017`.


### Slack

TODO: ...

### Github

TODO: ...


## Preparation before you start the class

### Laptop Hardware

You need a laptop with these specifications:

- Linux Ubuntu 16.04 installed natively (dual boot), not in a virtual machine.
  See [](#can-we-use-vm) below for a discussion of the virtual machine option.
- A WiFi interface that supports 5 GHz wireless networks. If you have a 2.4 GHz WiFi, you will not be able to comfortably stream images from the robot; moreover, you will need to adapt certain instructions.
- Minimum 50 GB of free disk space in addition to the OS. Ideally 250GB+. This is for storing and processing logs.

There are no requirements of having a particularly good GPU, or a particularly
good CPU.  You will be developing code that runs on a Raspberry PI. Any laptop
bought in the last 3 years should be powerful enough. However, having a good
CPU / lots of RAM makes it faster to run regression tests.


### Install Ubuntu on your laptop and related software

Install Ubuntu, ROS, Atom, Liclipse, the Duckuments, etc. on your laptop.

See: [](#setup-laptop)


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

Read the following preliminaries:

- ...
- ...
