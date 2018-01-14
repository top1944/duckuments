# Demo system ID {#demo-sysid status=beta}

This is the description of the wheels calibration procedure. In order to complete the procedure, you need your Duckiebot in configuration DB17-lc with its camera calibrated and the same chessboard as for the camera calibration. 
In the first step, you will put your Duckibebot in front of the chessboard and send specific commands to the wheels. By recording the chessboard, the Duckiebot will know its position at any time. On your computer, you will then use this informations to calculate the parameters of the kinematics of you Duckiebot. These parameters will be stored on a yaml file. 

<div class='requirements' markdown="1">

Requires: Duckiebot in configuration DB17-lc

Requires: Camera calibration completed

</div>

## Video of expected results {#demo-sysid-expected}

<div figure-id="fig:demo_succeeded-sysid">
    <figcaption>Demo of the calibration procedure
    </figcaption>
    <dtvideo src='vimeo:251027149'/>
</div>



## Duckietown setup notes {#demo-sysid-duckietown-setup}

The Duckietown is not needed for the wheels calibration. 


## Duckiebot setup notes {#demo-sysid-duckiebot-setup}

Mount the USB drive.

See: The procedure is documented in [](#mounting-usb).


## Pre-flight checklist {#demo-sysid-pre-flight}

Check: the Duckiebot has sufficient battery

Check: the USB drive is mounted 

Check: the camera is calibrated

Check: the chessboard has the good dimensions


## Demo instructions {#demo-sysid-run}


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


## Troubleshooting {#demo-sysid-troubleshooting}

Symptom: No log have been recorded.

Resolution: Try to mount the USB drive.

Symptom: The Duckiebot deviates from the trajectory, so that the chessboard goes out of the camera’s field of view.

Resolution: You can adjust the parameters of the voltage commands by passing arguments when launching the commands. You can change the parameter vFin and Nstep for the straight line, and the parameter k1, k2, omega and duration for the sinewave.


## Demo failure demonstration {#demo-sysid-failure}

<div figure-id="fig:demo_failed-sysid">
    <figcaption>Failed demo
    </figcaption>
    <dtvideo src='vimeo:251027122'/>
</div>

