# Duckiebot Initialization

Prerequisites:

* A complete Duckiebot in configuration C0.

* An SD card with image v2.0.

Result:

* A Duckiebot that is ready to use


## Login and update base system

at this stage you can ssh into your robot with 

	laptop$ ssh ubuntu@duckiebot.local
pwd ubuntu

## Learn to love Byobu

Run "byobu":

	duckiebot $ byobu

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

## Update basic system

Use:

	duckiebot $ sudo apt-get update
	duckiebot $ sudo apt-get dist-upgrade

## Camera Test

You can test the camera right away, without setting up ROS.

Use the command:

	duckiebot $ raspistill -t 1 -o out.jpg


Then download out.jpg using scp:

	laptop$ scp ubuntu@duckiebot.local:~/out.jpg out.jpg]

## Do not change the default shell

If you know what you are doing, you are welcome to install and use additional shells (such as zsh), but please keep **bash** as be the default shell. This is important for some scripts.

(For the record, our favorite shell is zsh with oh-my-zsh.)

## Set hostname

Choose a name for your robot. This is a simple string that will always appear lowercase.

Suppose that the name is "duckiebot".

Edit /etc/hostname and put "duckiebot" instead of “ubuntu”.

	duckiebot $ sudo nano /etc/hostname 

Also edit /etc/hosts and replace "ubuntu" with “duckiebot”:

duckiebot $ sudo nano /etc/hosts

**Note: the command "sudo hostname duckiebot" is not enough. The change will not persist. You need to go through the steps above.**

**NEVER ADD HOSTNAMES IN /etc/hosts (e.g. duckiebot.local)**

Then reboot:

$ sudo reboot

When you reboot, you should see your new hostname:

    Ubuntu 16.04.2 LTS 
    $duckiebot$ login:
