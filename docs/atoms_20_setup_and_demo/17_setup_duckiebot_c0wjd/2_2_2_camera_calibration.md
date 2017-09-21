# Camera calibration {#camera-calib status=draft}

Assigned: Dzenan Lapandic


<div class='requirements' markdown='1'>


</div>

## Intrinsic calibration

### Setup

Make sure your Duckiebot is on, and both your laptop and Duckiebot are connected to the duckietown network. Next, download and print a PDF of the [calibration checkerboard](https://drive.google.com/open?id=0B1iMTx9IcQVwN2pEcXE4RUF1VVk). Fix the checkerboard to a planar surface.


<div figure-id="fig:calibration_checkerboard" figure-caption="">
     <img src="calibration_checkerboard.png" style='width: 20em'/>
</div>

### Calibration

#### Step 1

Open three terminals on the laptop.

#### Step 2

In the first terminal, remotely launch the joystick process:

    $ cd ~/duckietown
    $ source environment.sh
    $ roslaunch duckietown joystick.launch veh:=![robot name]

#### Step 3

In the second terminal run the camera calibration:

    $ cd ~/duckietown
    $ source environment.sh
    $ export ROS_MASTER_URI=http://![robot name].local:11311/
    $ roslaunch duckietown intrinsic_calibration veh:=![robot name] raw:=true

You should see a display screen open on the laptop ([](#fig:intrinsic_callibration_pre)).

<div figure-id="fig:intrinsic_callibration_pre" figure-caption="">
     <img src="intrinsic_callibration_pre.png" style='width: 30em'/>
</div>

Position the checkerboard in front of the camera until you see colored lines overlaying the checkerboard. You will only see the colored lines if the entire checkerboard is within the field of view of the camera. You should also see colored bars in the sidebar of the display window. These bars indicate the current range of the checkerboard in the camera’s field of view:

    X bar - the observed horizontal range (left - right)
    Y bar - the observed vertical range (top - bottom)
    Size bar - the observed range in the checkerboard size (forward - backward from the camera direction)
    Skew bar - the relative tilt between the checkerboard and the camera direction

Now move the checkerboard right/left, up/down, and tilt the checkerboard through various angles of relative to the image plane. After each movement, make sure to pause long enough for the checkerboard to become highlighted. Once you have collected enough data, all four indicator bars will turn green. Press the **CALIBRATE** button in the sidebar. Calibration may take a few moments. Note that the screen may dim. Don't worry, the calibration is working.

<div figure-id="fig:intrinsic_calibration_calibratestep" figure-caption="">
     <img src="intrinsic_calibration_calibratestep.png" style='width: 30em'/>
</div>

### Save the calibration results

If you are satisfied with the calibration, you can save the results by pressing the **COMMIT** button in the side bar.

<div figure-id="fig:intrinsic_calibration_commit" figure-caption="">
     <img src="intrinsic_calibration_commit.png" style='width: 30em'/>
</div>

This will automatically save the calibration results on your Duckiebot:

    ~/duckietown/catkin_ws/src/00-infrastructure/duckietown/config/baseline/calibration/camera_intrinsic/![robot name].yaml

#### Step 7

Now let’s push the `![robot name].yaml` file to the git repository. In the third terminal connect to your Duckiebot:

    laptop $ ssh ![username]@![robot name].local

Update your local git repository:

    duckiebot $ cd ~/duckietown
    duckiebot $ git pull

Update your local git repository and push the changes to github:

    duckiebot $ git add ~/duckietown/catkin_ws/src/00-infrastructure/duckietown/config/baseline/calibration/camera_intrinsic/![robot name].yaml
    duckiebot $ git commit -m "add ![robot name] intrinsic calibration file"
    duckiebot $ git push

You can obtain the intrinsic calibration results on your laptop by updating your local git repository on your laptop:

    laptop $ cd ~/duckietown
    laptop $ git pull

Before moving on to the extrinsic calibration, make sure to kill all running processes by pressing <kbd>Ctrl</kbd>-<kbd>C</kbd> in each of the terminal windows.

## Extrinsic calibration

### Setup

Arrange the Duckiebot and checkerboard according to [](#fig:extrinsic_setup). Note that the axis of the wheels should be aligned with the y-axis.

<div figure-id="fig:extrinsic_setup" figure-caption="">
     <img src="extrinsic_setup.jpg" style='width: 30em'/>
</div>

[](#fig:extrinsic_view) shows a view of the calibration checkerboard from the Duckiebot. To ensure proper calibration there should be no clutter in the background.

<div figure-id="fig:extrinsic_view" figure-caption="">
     <img src="extrinsic_view.jpg" style='width: 30em'/>
</div>

### Calibration

#### Step 1

Open four terminals terminals on the laptop.

#### Step 2

In the first terminal, remotely launch the joystick process:

    laptop $ cd ~/duckietown
    laptop $ source environment.sh
    laptop $ roslaunch duckietown joystick.launch veh:=![robot name]

#### Step 3

In the second terminal launch the camera:

    laptop $ cd ~/duckietown
    laptop $ source environment.sh
    laptop $ export ROS_MASTER_URI=http://![robot name].local:11311/
    laptop $ roslaunch duckietown camera.launch raw:=1 veh:=![robot name]

#### Step 4

In the third terminal run the ground projection node:

    laptop $ cd ~/duckietown
    laptop $ source environment.sh
    laptop $ export ROS_MASTER_URI=http://![robot name].local:11311/
    laptop $ roslaunch ground_projection ground_projection.launch veh:=![robot name] local:=1

#### Step 5

In the fourth terminal, check that everything is working properly.

    $ cd ~/duckietown
    $ source environment.sh
    $ rostopic list

You should see new ros topics:

    /![robot name]/camera_node/camera_info
    /![robot name]/camera_node/framerate_high_switch
    /![robot name]/camera_node/image/compressed
    /![robot name]/camera_node/image/raw
    /![robot name]/camera_node/raw_camera_info

The ground_projection node has two services. They are not used during operation. They just provide a command line interface to trigger the extrinsic calibration (and for debugging).

    $ rosservice list

You should see:

    ...
    /![robot name]/ground_projection/estimate_homography
    /![robot name]/ground_projection/get_ground_coordinate
    ...

Now you can estimate the homography by executing the following command:

    $ rosservice call /![robot name]/groundprojection/estimate_homography

This will do the extrinsic calibration and automatically save the file to your laptop:

    ~/duckietown/catkin_ws/src/00-infrastructure/duckietown/config/baseline/calibration/camera_extrinsic/![robot name].yaml

As before, add this file to your local git repository on your laptop, push the changes, and update your the local git repository on your Duckiebot.

Note: we are in the process of rewriting the configuration system, so in a while "commit to the repository"
is not going to be the right thing to do.