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

Now move the checkerboard right/left, up/down, and through various degrees of tilt. After each movement, make sure to pause long enough for the checkerboard to become highlighted. Once you have collected enough data, all four indicator bars will turn green. Press the **CALIBRATE** button in the sidebar. Calibration may take a few moments. Note that the screen may dim. Don't worry, the calibration is working.

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

TODO 

## Testing the calibration

TODO