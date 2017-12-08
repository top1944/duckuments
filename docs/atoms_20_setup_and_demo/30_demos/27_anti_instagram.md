# Lane following {#demo-lane-following status=beta}

This is the description of anti-instagram demo.

<div class='requirements' markdown="1">

Requires: Camera calibration completed.[Camera calibration](#camera-calib)

Requires: Lane-following demo has been successfully launched.[Lane-following demo](#demo-lane-following)

</div>

## Duckietown setup notes {#demo-anti-instagram-duckietown-setup}

A duckietown with white and red solid lines, yellow dashed lines and black lane surface. No obstacles on the lane.

## Duckiebot setup notes {#demo-anti-instagram-duckiebot-setup}

Any duckiebot satisfying the basic DB17 configuration will work.

## Demo instructions {#demo-anti-instagram-run}

Here, we give step by step instructions to reproduce the demo.

Step 0: On duckiebot, change to /$DUCKIERTOWN_ROOT/ directory and checkout the lastest version of devel-anti-instagram branch.

Step 1: Run command:

    duckiebot $ make demo-lane-following
    
Wait a while so that everything has been launched. 

If you accidentally press R1 which starts autonomous lane following, press L1 to switch back to joystick control.

Step 2: On laptop, set ros master to duckiebot and run command:

    laptop $ rqt_image_view

which opens a window to preview image messages. Select the /robot name/camera_node/image/compressed to view camera image stream. Place the duckiebot somewhere in duckietown where all of the white, yellow and red lines are present to the camera.

Step 3: 

Run command:

    rosparam set /robot name/line_detector_node/verbose true

so that line_detector_node will publish the result.

Step 4:

To view the result, select in rqt_image_view the topic /robot name/line_detector_node/image_with_lines.  Now press X to start our anti-instagram. After a few seconds the corrected image will show.

## Troubleshooting {#demo-anti-instagram-troubleshooting}

Contact David Yunis - TTIC via Slack if any trouble occurs. 
