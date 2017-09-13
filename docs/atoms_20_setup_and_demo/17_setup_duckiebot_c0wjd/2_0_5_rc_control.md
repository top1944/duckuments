# Software setup and RC remote control {#rc-control status=beta}

Assigned: Andrea

<div class='requirements' markdown='1'>

Requires: Laptop configured, according to [](#setup-laptop).

Requires: You have configured the Duckiebot. The procedure is documented in [](#setup-duckiebot).

Requires: You have created a Github account and configured public keys,
both for the laptop and for the Duckiebot. The procedure is documented in [](#github-access).

Results: You can run the joystick demo.

</div>


## Clone the Duckietown repository {#clone-software-repo}

Clone the repository in the directory `~/duckietown`:

    duckiebot $ git clone git@github.com:duckietown/Software.git ~/duckietown

For the above to succeed you should have a Github account already set up.

It should not ask for a password.

### Troubleshooting

Symptom: It asks for a password.

Resolution: You missed some of the steps described in [](#github-access).

Symptom: Other weird errors.

Resolution: Probably the time is not set up correctly. Use `ntpdate` as above:

    $ sudo ntpdate -u us.pool.ntp.org

Or see the hints in the troubleshooting section on the previous page.


## Update the system

If you installed the Operating System on the Duckiebot as described in [](#duckiebot-ubuntu-image),
you can skip this section and jump to [](#build-repo).
If you installed the Operating System on the Duckiebot by burning the image as described in
[](#setup-duckiebot-burn-image), then you need to install the new dependencies by running the command:

    duckiebot $ cd ~/duckietown
    duckiebot $ /bin/bash ./dependencies_since_image.sh

This command will install all the dependencies that are not in the image that you burned on the SD card.


## Set up the ROS environment on the Duckiebot {#build-repo}

All the following commands should be run in the `~/duckietown` directory:

    duckiebot $ cd ~/duckietown

Now we are ready to make the workspace. First you need to source the baseline ROS environment:

    duckiebot $ source /opt/ros/kinetic/setup.bash

Comment: If you are using ZSH then instead of this, you should call `source /opt/ros/kinetic/setup.bash`.

Then, build the workspace using:

    duckiebot $ catkin_make -C catkin_ws/

See also: For more information about `catkin_make`, see [](#catkin_make).

Note: there is a known bug, for which it fails the first time on the Raspberry Pi. Try again; it will work.


<!-- (you have to be under the `catkin_ws` folder to invoke `catkin_make`) -->


## Clone the duckiefleet repository (updated Sep 12) {#clone-duckiefleet status=recently-updated}

Clone the relevant `duckiefleet` repository into `~/duckiefleet`.

See see [](#duckiefleet-directory) to find the right `duckiefleet` repository.

In `~/.bashrc` set `DUCKIEFLEET_ROOT` to point to the directory:

    export DUCKIEFLEET_ROOT=~/duckiefleet


## Add your vehicle data to the robot database (updated Sep 12) {#edit-machines-file status=recently-updated}

Next, you need to add your robot to the vehicles database.  This is not optional and required in order to launch any ROS scripts.

You have already a copy of the vehicles database in the folder `robots` of `DUCKIEFLEET_ROOT`.

Copy the file `emma.robot.yaml` to `![robotname].robot.yaml`, where `![robotname]`
is your robot's hostname. Then edit the copied file to represent your Duckiebot.

See: For information about the format, see [](#scuderia).

Finally, generate the machines file.

See: The procedure is listed here: [](#machines).

## Test that the joystick is detected {#test-joystick}


Plug the joystick receiver in one of the USB port on the Raspberry Pi.

To make sure that the joystick is detected, run:

    duckiebot $ ls /dev/input/

and check if there is a device called `js0` on the list.

<div class='check' markdown="1">

Make sure that your user is in the group `input` and `i2c`:

    duckiebot $ groups
    ![username] sudo input i2c

If `input` and `i2c` are not in the list, you missed a step. Ohi ohi!
You are not following the instructions carefully!

See: Consult again [](#create-user-on-duckiebot).

</div>

To test whether or not the joystick itself is working properly, run:

    duckiebot $ jstest /dev/input/js0

Move the joysticks and push the buttons. You should see the data displayed change
according to your actions.

## Run the joystick demo

SSH into the Raspberry Pi and run the following from the `duckietown` directory:

    duckiebot $ cd ~/duckietown
    duckiebot $ source environment.sh

<!-- duckiebot $ source set_ros_master.sh -->

The `environment.sh` setups the ROS environment at the terminal (so you can use
commands like `rosrun` and `roslaunch`).

<!-- The `set_ros_master.sh` script by default sets the Raspberry Pi as its own ROS master. -->

Now make sure the motor shield is connected.

Run the command:

    duckiebot $ roslaunch duckietown joystick.launch veh:=![robot name]

If there is no "red" output in the command line then pushing the left joystick
knob controls throttle - right controls steering.

This is the expected result of the commands:

<col2>
    <s>left joystick up</s>     <s>forward</s>
    <s>left joystick down</s>   <s>backward</s>
    <s>right joystick left</s>  <s>turn left (positive yaw)</s>
    <s>right joystick right</s> <s>turn right (negative yaw)</s>
</col2>

It is possible you will have to unplug and replug the joystick or just push lots of buttons on your joystick until it wakes up. Also make sure that the mode switch on the top of your joystick is set to "X", not "D".

XXX Is all of the above valid with the new joystick?

Close the program using <kbd>Ctrl</kbd>-<kbd>C</kbd>.

### Troubleshooting

Symptom: The robot moves weirdly (e.g. forward instead of backward).

Resolution: The cables are not correctly inserted.
Please refer to the assembly guide for pictures of the correct connections.
Try swapping cables until you obtain the expected behavior.

Resolution: Check that the joystick has the switch set to the position "x".And the mode light should be off.

Symptom: The left joystick does not work.

Resolution: If the green light on the right to the "mode" button is on, click the "mode" button to turn the light off. The "mode" button toggles between left joystick or the cross on the left.

Symptom: The robot does not move at all.

Resolution: The cables are disconnected.

Resolution: The program assumes that the joystick is at `/dev/input/js0`.
In doubt, see [](#test-joystick).


## The proper shutdown procedure for the Raspberry Pi

Generally speaking, you can terminate any `roslaunch` command with <kbd>Ctrl</kbd>-<kbd>C</kbd>.

To completely shutdown the robot, issue the following command:

    duckiebot $ sudo shutdown -h now

Then wait 30 seconds.

Warning: If you disconnect the power before shutting down properly using `shutdown`,
the system might get corrupted.

Then, disconnect the power cable, at the **battery end**.

Warning: If you disconnect frequently the cable at the Raspberry Pi's end, you might damage the port.
