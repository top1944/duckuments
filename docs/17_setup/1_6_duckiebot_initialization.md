# Duckiebot Initialization

Prerequisites:

* A complete Duckiebot in configuration C0.

* A joystick.

* An SD card with image v2.0.

Result:

* Remote RC control: you can drive the Duckiebot with the joystick.


## Setting up a PI with an HDMI monitor

Put the SD card in your PI.

Attach an HDMI cable to the PI.

Note: It’s important that you connect the HDMI cable before powering up the PI.

Attach a USB keyboard.

Plug in the WiFi USB dongle.

Power up. You should see a login screen.

## Login and update base system

Login. (username: ubuntu, password: ubuntu)

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

## Camera Test with a monitor

You can test the camera right away, without setting up ROS.

Use the command:

	duckiebot $ raspistill -t 100000 -o out.jpg

You should see an image on the screen. If it’s black, remove the lens cap.

Rotate the lens until the image is in focus.

Press ‘Ctrl + c’ to exit.

## Camera Test without a monitor

If you don’t have a monitor, you can still take a picture and see it on your computer. Use this:

sudo raspistill -t 1 -o out.jpg

Then, **after all network setup is done**, download out.jpg using scp:

$ scp ubuntu@<robot name>.local:~/out.jpg out.jpg]

## Do not change the default shell

If you know what you are doing, you are welcome to install and use additional shells (such as zsh), but please** keep ****bash**** as be the default shell**. This is important for some scripts.

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

Note: When switching Wifi adapters, or putting an SD card in a different body, remove the file:

$ sudo rm /etc/udev/rules.d/70-persistent-net.rules

Just do it, just in case, if we forgot to remove it.

Then reboot:

$ sudo reboot

When you reboot, you should see your new hostname:

    Ubuntu 16.04.2 LTS 

    duckiebot login:
