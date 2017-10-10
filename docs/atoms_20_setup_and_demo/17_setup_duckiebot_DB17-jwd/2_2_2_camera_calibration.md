# Camera calibration {#camera-calib status=ready}

Assigned: Dzenan Lapandic


<div class='requirements' markdown='1'>

Requires: You can see the camera image on the laptop. The procedure is documented in
[](#rc-cam-launched-remotely).

Requires: You have all the repositories (described in [](#fall2017-git)) cloned properly and you have your environment variables (described in [](#env-variables)) set properly

Results: Calibrated camera of the robot

</div>

## Intrinsic calibration

### Setup

Make sure your Duckiebot is on, and both your laptop and Duckiebot are
connected to the duckietown network. Next, download and print a PDF of the
[calibration checkerboard](github:org=duckietown,repo=Software,path=duckietown/config/baseline/calibration/camera_intrinsic/calibration_pattern.pdf).
Fix the checkerboard to a planar surface.

<div figure-id="fig:calibration_checkerboard" figure-caption="">
     <img src="calibration_checkerboard.png" style='width: 20em'/>
</div>

### Calibration

#### Step 1

Open two terminals on the laptop.

#### Step 2

In the first terminal, ssh into your robot and launch the joystick process:

    laptop $ ssh ![ROBOT_NAME]
    laptop $ cd ![DUCKIETOWN_ROOT]
    laptop $ source environment.sh
    laptop $ roslaunch duckietown camera.launch veh:=![robot name] raw:=true

#### Step 3

In the second laptop terminal run the camera calibration:

    laptop $ cd ![DUCKIETOWN_ROOT]
    laptop $ source environment.sh
    laptop $ source set_ros_master.sh ![robot name]
    laptop $ roslaunch duckietown intrinsic_calibration.launch veh:=![robot name]

You should see a display screen open on the laptop ([](#fig:intrinsic_callibration_pre)).

<div figure-id="fig:intrinsic_callibration_pre" figure-caption="">
     <img src="intrinsic_callibration_pre.png" style='width: 30em'/>
</div>

Position the checkerboard in front of the camera until you see colored lines
overlaying the checkerboard. You will only see the colored lines if the entire
checkerboard is within the field of view of the camera. You should also see
colored bars in the sidebar of the display window. These bars indicate the
current range of the checkerboard in the camera's field of view:

- X bar: the observed horizontal range (left - right)
- Y bar: the observed vertical range (top - bottom)
- Size bar: the observed range in the checkerboard size (forward - backward from the camera direction)
- Skew bar: the relative tilt between the checkerboard and the camera direction

Also, make sure to focus the image by rotating the mechanical focus ring on the lens of the camera.

Now move the checkerboard right/left, up/down, and tilt the checkerboard
through various angles of relative to the image plane. After each movement,
make sure to pause long enough for the checkerboard to become highlighted. Once
you have collected enough data, all four indicator bars will turn green. Press
the "CALIBRATE" button in the sidebar. Calibration may take a few moments. Note
that the screen may dim. Don't worry, the calibration is working.

<div figure-id="fig:intrinsic_calibration_calibratestep" figure-caption="">
 <img src="intrinsic_calibration_calibratestep.png" style='width: 30em'/>
</div>

### Save the calibration results

If you are satisfied with the calibration, you can save the results by pressing the "COMMIT" button in the side bar (You never need to click the "SAVE" button).

<div figure-id="fig:intrinsic_calibration_commit" figure-caption="">
     <img src="intrinsic_calibration_commit.png" style='width: 30em'/>
</div>

This will automatically save the calibration results on your Duckiebot:

    ![DUCKIEFLEET_ROOT]/calibrations/camera_intrinsic/![robot name].yaml

#### Step 7

Now let's push the `![robot name].yaml` file to the git repository. You can stop the `camera.launch` termincal with <kbd>Ctrl</kbd>-<kbd>C</kbd> or open a new terminal in Byobu with <kbd>F2</kbd>.

Update your local git repository:

    duckiebot $ cd ![DUCKIEFLEET_ROOT]
    duckiebot $ git pull
    duckiebot $ git status
    
You should see that your new calibration file is uncommitted. You need to commit the file to your branch.

    duckiebot $ git checkout -b ![git username]-devel
    duckiebot $ git add calibrations/camera_intrinsic/![robot name].yaml
    duckiebot $ git commit -m "add ![robot name] intrinsic calibration file"
    duckiebot $ git push origin ![git username]-devel


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
    laptop $ source set_ros_master.sh ![robot name]
    laptop $ roslaunch duckietown camera.launch raw:=1 veh:=![robot name]

#### Step 4

In the third terminal run the ground projection node:

    laptop $ cd ~/duckietown
    laptop $ source environment.sh
    laptop $ source set_ros_master.sh ![robot name]
    laptop $ roslaunch ground_projection ground_projection.launch veh:=![robot name] local:=1

#### Step 5

In the fourth terminal, check that everything is working properly.

    laptop $ cd ~/duckietown
    laptop $ source environment.sh
    laptop $ source set_ros_master.sh ![robot name]
    laptop $ rostopic list

You should see new ros topics:

    /![robot name]/camera_node/camera_info
    /![robot name]/camera_node/framerate_high_switch
    /![robot name]/camera_node/image/compressed
    /![robot name]/camera_node/image/raw
    /![robot name]/camera_node/raw_camera_info

The ground_projection node has two services. They are not used during operation. They just provide a command line interface to trigger the extrinsic calibration (and for debugging).

    laptop $ rosservice list

You should see something like this:

    ...
    /![robot name]/ground_projection/estimate_homography
    /![robot name]/ground_projection/get_ground_coordinate
    ...
If you want to check whether your camera output is similar to the one at the [](#fig:extrinsic_view) you can start `rqt_image_view`:

    laptop $ rosrun rqt_image_view rqt_image_view

In the `rqt_image_view` interface, click on the drop-down list and choose the image topic:

    /![robot name]/camera_node/image/compressed

Now you can estimate the homography by executing the following command:

    laptop $ rosservice call /![robot name]/ground_projection/estimate_homography

This will do the extrinsic calibration and automatically save the file to your laptop:

    ~/duckietown/catkin_ws/src/00-infrastructure/duckietown/config/baseline/calibration/camera_extrinsic/![robot name].yaml

As before, add this file to your local Git repository on your laptop, push the changes, and update your the local git repository on your Duckiebot.

Note: we are in the process of rewriting the configuration system, so in a
while "commit to the repository" is not going to be the right thing to do.
We will communicate when the transition will happen
