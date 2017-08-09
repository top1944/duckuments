# Software setup and RC remote control

Prerequisites:

* Created Github access [](#sec:github-access).


## Clone the Duckietown repository

Clone the repository using:

    duckiebot $ git clone git@github.com:duckietown/Software.git duckietown

### Troubleshooting

* For the above to succeed you should have a Github account already set up.

* If it fails with weird errors, probably the time is not set up correctly. Use `ntpdate` as above:


    $ sudo ntpdate -u us.pool.ntp.org

## Set up ROS environment on the Duckiebot

    duckiebot $ cd ~/duckietown

Now we are ready to make the workspace. First you need to source the baseline ROS indigo environment:

    duckiebot $ source /opt/ros/indigo/setup.bash

Then, build the workspace (you have to be under the `catkin_ws` folder to invoke `catkin_make`)

    duckiebot $ make build

## Add your vehicle to the machines file

On the robot edit the file

    ~/duckietown/catkin_ws/src/duckietown/machines

You will see something like this:

    <launch>
        <arg name="env_script_path" default="~/duckietown/environment.sh"/>
        <machine name="![robot name]" address="![robot name].local" user="ubuntu" env-loader="$(arg env_script_path)"/>
            ...
        ...
    </launch>

Now, duplicate a `&lt;machine&gt;` line between &lt;launch&gt; and &lt;/launch&gt;, and replace the name and address string with the name of your vehicle. In this example, the additional line to add is

    <machine name="duckiebot" address="duckiebot.local" user="ubuntu" env-loader="$(arg env_script_path)"/>

commit and push the new machines file.

## Run the joystick demo

Don't have a joystick? Move to (incompletE) XXX

Plug the joystick to one of the usb port on the Raspberry PI.

SSH into your PI. Go to the `duckietown` folder and invoke the following scripts:

    duckiebot $ cd ~/duckietown
    duckiebot $ source environment.sh
    duckiebot $ source set_ros_master.sh

The `environment.sh` setups the ROS environment at the terminal (so you can use commands like `rosrun` and `roslaunch`). The `set_ros_master.sh` script by default sets the PI as its own ROS master.

Now make sure the motor shield is connected.

Run the command:

    duckiebot $ roslaunch duckietown joystick.launch veh:=duckiebot

If there is no "red" output in the command line then pushing the left joystick knob controls throttle - right controls steering.

This is the expected result of the commands:

left joystick up = forward

left joystick down = backward

right joystick left = turn left (positive theta)

right joystick right = turn right (negative theta)

It is possible you will have to unplug and replug the joystick or just push lots of buttons on your joystick until it wakes up. Also make sure that the mode switch on the top of your joystick is set to "X" not "D".

XXX Is the above valid with the new joystick?

Close the program using Ctrl-C.


### Troubleshooting

**Symptom: The robot moves weirdly (forward instead of backward).**

Either the cables or the motors are inverted. Please refer to the assembly guide for pictures of the correct connections.

**Symptom: The left joystick does not work.**

If the green light on the right to the "mode" button is on, click the "mode" button to turn the light off. The "mode" button toggles between left joystick or the cross on the left.

**Symptom: The robot does not move.**

The `joy_mapper_test.launch` assumes that the joystick is at `/dev/input/js0`.

To make sure that the joystick is there, you can do

    duckiebot $ ls /dev/input/

and check if there is a `js0` on the list.

To test whether or not the joystick itself is working properly (without ROS), you can do

    duckiebot $ jstest /dev/input/js0

Move the joysticks and push the buttons and check the printouts.

**Symptom: The robot moves very weirdly.**

Check that the joystick has the switch set to the position "x".
And the mode light should be off.


## Proper shutdown procedure for the PI

Use `Ctrl-C` in the terminal of joystick.launch when you're done.

**To shutdown: DO NOT DISCONNECT THE POWER - the system might get corrupted.**

Instead, issue the following command:

    duckiebot $ sudo shutdown -h now

and then wait 30 seconds before disconnecting the power.

**Also: Disconnect the battery end of the cable,** not the one close to the PI, because you might damage it.
