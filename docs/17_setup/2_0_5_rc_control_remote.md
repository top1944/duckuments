# Software setup and RC remote control

## Clone the Duckietown repository

You should have already followed the steps in [Setup Step 1.9 - Github basics](http://drive.google.com/open?id=1inbwS7PNHY_-Vl0iLWQZi5AKT4xT7YVtPLcQ2hTOmI8).

    duckiebot $ git@github.com:duckietown/Software.git duckietown

*Troubleshooting:*

* *For this to succeed you should have a Github account sudo ntpdate -u us.pool.ntp.org already set up.*

* *if it fails with weird errors, probably the time is not set up correctly. Use ntpdate as above.*

## Set up ROS environment on the Duckiebot

    duckiebot $ cd ~/duckietown

Now we are ready to make the workspace. First you need to source the baseline ROS indigo environment:

    duckiebot $ source /opt/ros/kinetic/setup.bash

Then, build the workspace (you have to be under the catkin_ws folder to invoke catkin_make)

    duckiebot $ make build

**Note**: *the catkin_make command might fail* with a message about "exhausted virtual memory" and invoking "do make -j4 -l4" failed. The output output is similar to this:

```
[  2%] [  4%] [  4%] Building CXX object slam/CMakeFiles/sum_and_average_node.dir/src/sum_and_average_node.cpp.o
Building CXX object slam/CMakeFiles/slamNode.dir/src/slamNode.cpp.o
Building CXX object slam/CMakeFiles/listener.dir/src/listener.cpp.o
virtual memory exhausted: Cannot allocate memory
make[2]: *** [slam/CMakeFiles/listener.dir/src/listener.cpp.o] Error 1
make[1]: *** [slam/CMakeFiles/listener.dir/all] Error 2
make[1]: *** Waiting for unfinished jobs....
Invoking "make -j4 -l4" failed
```

Do the following:

Create an empty file using the dd (device-to-device copy) command:

    duckiebot $ sudo dd if=/dev/zero of=/swap0 bs=1M count=512 # This is for a 512 MB swap space.

Format the file for use as swap:

    duckiebot $ sudo mkswap /swap0

Add the swap file to the system configuration:

    duckiebot $ sudo emacs  /etc/fstab and add "/swap0 swap swap" at the bottom

Activate the swap space:

    duckiebot $ sudo swapon -a

## Add your vehicle to the machines file

On the robot edit the file

    duckiebot $ nano ~/duckietown/catkin_ws/src/duckietown/machines

    <launch>
        <arg name="env_script_path" default="~/duckietown/environment.sh"/>
        <arg name="env_script_path" default="~/duckietown/environment.sh"/>
            <machine name="megaman" address="megaman.local" user="ubuntu" env-loader="$(arg env_script_path)"/>
        <machine name="megaman" address="megaman.local" user="ubuntu" env-loader="$(arg env_script_path)"/>
            ...
        ...
    </launch>

Now, duplicate a &lt;machine ... /&rt; line between &lt;launch&rt; and &lt;/launch&rt;, and replace the name and address string with the name of your vehicle. In this example, the additional line to add is

    <machine name="duckiebot" address="duckiebot.local" user="ubuntu" env-loader="$(arg env_script_path)"/>

commit and push the new machines file.

## Run the joystick demo

don’t have a joystick? Move to

Plug the joystick to one of the usb port on the RasPi.

SSH into your PI. Go to the duckietown folder and invoke the following scripts:

    duckiebot:~/duckietown$ source environment.sh

    duckiebot:~/duckietown$ source set_ros_master.sh

The environment.sh setup the ROS environment at the terminal (so you can use commands like rosrun and roslaunch). The set_ros_master.sh by default sets the PI as its own rosmaster.

Now make sure the motor shield is connected.

Run the command:

    duckiebot $ roslaunch duckietown joystick.launch veh:=duckiebot

If there is no "red" output in the command line then pushing the left joystick knob controls throttle - right controls steering.

This is the expected result of the commands:

left joystick up = forward

left joystick down = backward

right joystick left = turn left (positive theta)

right joystick right = turn right (negative theta)

It is possible you will have to unplug and replug the joystick or just push lots of buttons on your joystick until it wakes up. Also make sure that the mode switch on the top of your joystick is set to "X" not “D”.

Close the program using Ctrl-C.

**Troubleshooting - robot moves weirdly (forward instead of backward):** Either the cables or the motors are inverted. Please refer to the assembly guide for pictures of the correct connections.

**Troubleshooting - left joystick does not work: **If the green light on the right to the "mode" button is on, click the “mode” button to turn the light off. The “mode” button toggles between left joystick or the cross on the left.

**Troubleshooting - robot does not move**: The joy_mapper_test.launch assumes that the joystick is at /dev/input/js0. To make sure that the joystick is there, you can do

    $ ls /dev/input/

and check if there is a js0 on the list.

To test whether or not the joystick itself is working properly (without ROS), you can do

    $ jstest /dev/input/js0

Move the joysticks and push the buttons and check the printouts.

**Troubleshooting - robot moves very weirdly:** Check that the joystick has the switch set to the position "x".  And the mode light should be off.

shutting down the robot:

    sudo shutdown -h now

then physically disconnect power cables

# Proper shutdown procedure for the PI

Ctrl-C in the terminal of joystick.launch when you’re done.

**To shutdown: DO NOT DISCONNECT THE POWER - the system might get corrupted. **Instead, issue the following command:

    duckiebot $ sudo shutdown -h now

and then wait 30 seconds before disconnecting the power.

**Also: Disconnect the battery end of the cable,** not the one close to the PI, because you might damage it.
