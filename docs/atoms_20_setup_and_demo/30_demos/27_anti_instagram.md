# Lane following {#demo-lane-following status=beta}

This is the description of anti-instagram demo.

<div class='requirements' markdown="1">

Requires: Camera calibration completed. [Camera calibration](#camera-calib)

Requires: Lane-following demo has been successfully launched. [Lane-following demo](#demo-lane-following)

</div>

## Video of expected results {#demo-template-expected}

First, we show a [video](https://drive.google.com/open?id=1XDTNk8NgIlMEyC7R0vyqVm3TSj7Sowc8) of the expected behavior.

## Duckietown setup notes {#demo-anti-instagram-duckietown-setup}

A duckietown with white and red solid lines, yellow dashed lines and black lane surface. No obstacles on the lane.

## Duckiebot setup notes {#demo-anti-instagram-duckiebot-setup}

Any duckiebot satisfying the basic DB17 configuration will work.

## Demo instructions {#demo-anti-instagram-run}

Step 0: On duckiebot, change to /$DUCKIETOWN_ROOT/ directory and checkout the lastest version of devel-anti-instagram branch.

Step 1: Run command:
    
    duckiebot $ source environment.sh && source set_ros_master.sh && source set_vehicle_name.sh

    duckiebot $ roslaunch duckietown_demos lane_following.launch
    
Wait a while so that everything has been launched. 

If you accidentally press R1 which starts autonomous lane following, press L1 to switch back to joystick control.

Step 2: On laptop, change to /$DUCKIETOWN_ROOT/ directory and perform the following steps:

    laptop $ source environment.sh
    
    laptop $ export ROS_MASTER_URI=http://robot_name.local:11311/
    
    laptop $ rqt_image_view

which opens a window to preview image messages. Select the /robot name/camera_node/image/compressed to view camera image stream. Place the duckiebot somewhere in duckietown.

Step 3: 

Run command:

    rosparam set /robot name/line_detector_node/verbose true

so that line_detector_node will publish the result.

Step 4:

To view the result, select in rqt_image_view the topic /robot name/line_detector_node/image_with_lines.
The anti-instagram node is continually running and will determine a proper transformation.

This can be seen as well with the following topics:
*   combination of ~corrected_image and ~uncorrected_image (shows the raw correction)
*   ~geomImage (shows the preprocessed image with the mask)

## Troubleshooting {#demo-anti-instagram-troubleshooting}

Contact David Yunis - TTIC, Shengjie Lin - TTIC, Milan Schilling - ETHZ or Christoph Zuidema - ETHZ via Slack if any trouble occurs. 