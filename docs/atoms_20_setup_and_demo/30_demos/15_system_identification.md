# Demo system ID {#sysid status=beta}

This is the description of the wheels calibration procedure. In order to complete the procedure, you need the same chessboard as for the camera calibration.

First, we describe what is needed, including:

* Robot hardware
* Number of Duckiebots
* Robot setup steps
* Duckietown hardware

<div class='requirements' markdown="1">

Requires: Duckiebot in configuration DB17-lc

Requires: Camera calibration completed

</div>

## Video of expected results {#demo-template-expected}

First, we show a video of the expected behavior (if the demo is succesful).

## Duckietown setup notes {#demo-template-duckietown-setup}

The Duckietown is not needed for the wheels calibration. 


## Duckiebot setup notes {#demo-template-duckiebot-setup}

Mount the USB drive.

See: The procedure is documented in [](#mounting-usb).


## Pre-flight checklist {#demo-template-pre-flight}

Check: the Duckiebot has sufficient battery

Check: the USB drive is mounted 

Check: the camera is calibrated, and the calibration file of your robot is in the folder 


    ![DUCKIETOWN_ROOT]/catkin_ws/src/00-infrastructure/duckietown/config/baseline/calibration/camera_intrinsic/


Check: the chessboard has the good dimensions


## Demo instructions {#demo-template-run}


Everything should be run from branch: devel-sysid. When your are on the devel-sysid branch, rebuild the Workspace  using:

    duckiebot $ catkin_make -C catkin_ws/

Step 1: Run the following commands:

Make sure you are in the Duckietown folder:

    duckiebot $ cd ~/duckietown

Activate ROS:

    duckiebot $ source environment.sh


Step 2: Place the Duckiebot in front of the chessboard at a distance of approximately 2 meters, as shown in the image.

Step 3: Run the calibration procedure

    duckiebot $ roslaunch calibration commands.launch veh:=robot name

The Duckietown should go forward and then stop. 

Step 4: When the Duckiebot has stopped, you have 10 seconds to replace it again at a distance of approximately 2 meters of the chessboard. Wait for the Duckiebot to move forward again.

Step 5: When the Duckiebot stops, and the node shuts down, unmount the USB drive :

    duckiebot $ sudo umount /media/logs

And put the USB drive in your computer. 

Step 6: On your computer, go in the Duckietown folder:

    laptop $ cd ~/duckietown

Activate ROS:

    laptop $ source environment.sh

Step 7: Run the calibration process with 

    laptop $ roslaunch calibration calibration.launch veh:=robot name  path:=/absolute/path/to/the/rosbag/folder/

Do not forget the backslash at the end of the path. 

Step 8: Once the command has finished, the parameters of your Duckiebot are stored in the folder


    ![DUCKIEFLEET_ROOT]/calibrations/kinematics/![robot name].yaml


## Troubleshooting {#demo-template-troubleshooting}

Symptom: No log have been recorded.

Resolution: Try to mount the USB drive.

Symptom: Error with the calibration file. 

Resolution: Place the calibration file of your robot in the folder 


    ![DUCKIETOWN_ROOT]/catkin_ws/src/00-infrastructure/duckietown/config/baseline/calibration/camera_intrinsic/


Symptom: The Duckiebot deviates from the trajectory, so that the chessboard goes out of the camera’s field of view.

Resolution: You can adjust the parameters of the commands by passing arguments to the launch file. 

## Demo failure demonstration {#demo-template-failure}

Finally, put here a video of how the demo can fail, when the assumptions are not respected.
