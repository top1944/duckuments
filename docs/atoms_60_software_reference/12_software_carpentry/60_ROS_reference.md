# ROS installation and reference {#introduction_to_ros status=ready}

Assigned: Liam


## Install ROS {#install-ROS}

This part installs ROS. You will run this twice, once on the laptop, once on the robot.

The first commands are copied from [this page][ros-ubuntu].

[ros-ubuntu]: http://wiki.ros.org/kinetic/Installation/Ubuntu

Tell Ubuntu where to find ROS:

    $ sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

Tell Ubuntu that you trust the ROS people (they are nice folks):

    $ sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

Fetch the ROS repo:

    $ sudo apt update

Now install the mega-package `ros-kinetic-desktop-full`.

    $ sudo apt install ros-kinetic-desktop-full

There's more to install:

    $ sudo apt install ros-kinetic-{tf-conversions,cv-bridge,image-transport,camera-info-manager,theora-image-transport,joy,image-proc,compressed-image-transport,phidgets-drivers,imu-complementary-filter,imu-filter-madgwick}

Note: Do not install packages by the name of `ros-X`, only those by
the name of `ros-kinetic-X`. The packages `ros-X` are from another version of ROS.

XXX: not done in aug20 image:

Initialize ROS:

    $ sudo rosdep init
    $ rosdep update


## `rqt_console` {#rqt_console status=draft}

TODO: to write


## `roslaunch` {#roslaunch status=draft}

TODO: to write

## `rviz` {#rviz status=draft}

TODO: to write

## `rostopic` {#rostopic status=draft}

TODO: to write

### `rostopic hz`

TODO: to write

### `rostopic echo`

TODO: to write

## `catkin_make` {#catkin_make status=draft}

TODO: to write

## `rosrun` {#rosrun status=draft}

TODO: to write

## `rostest` {#rostest status=draft}

TODO: to write

## `rospack` {#rospack status=draft}

TODO: to write

## `rosparam` {#rosparam status=draft}

TODO: to write

## `rosdep` {#rosdep status=draft}

TODO: to write

## `roswtf` {#roswtf status=draft}

TODO: to write

## `rosbag` {#rosbag status=draft}


    $ rosbag reindex ![bag file]

## `roscore` {#roscore status=draft}

TODO: to write


## Troubleshooting ROS {#troubleshooting-ROS}

Symptom: `![computer] is not in your SSH known_hosts file`

See [this thread][known_host]. Remove the `known_hosts` file and make sure you
have followed the instructions in [](#ssh-local-configuration).

[known_host]: https://answers.ros.org/question/41446/a-is-not-in-your-ssh-known_hosts-file/


## Other materials about ROS.

See also: [A gentle introduction to ROS](https://cse.sc.edu/~jokane/agitr/)
