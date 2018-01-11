# Lane following {#demo-lane-following status=beta}

This is the description of lane following demo.

<div class='requirements' markdown="1">

Requires: Wheels calibration completed.[wheel calibration](#wheel-calibration)

Requires: Camera calibration completed.[Camera calibration](#camera-calib)

Requires: Joystick demo has been successfully launched.[Joystick demo](#rc-control)

Requires: Duckiebot in configuration [DB17-jwd](#duckiebot-configurations)

Requires: [Calibrating](#wheel-calibration) the gain parameter to **0.6**.

## Video of expected results {#demo-template-expected}

[Video of demo lane following and expected results](https://drive.google.com/file/d/198iythQkovbQkzY3pPeTXWC8tTCRgDwB/view?usp=sharing)

## Duckietown setup notes {#demo-template-duckietown-setup}

Assumption about Duckietown:

* A duckietown with white and yellow lanes. No obstacles on the lane.
* Layout conform to Duckietown Appearance [Specifications](#duckietown_parts)
* Required tiles types: straight tile, turn tile
* Additional tile types:3-way/4-way intersection
* Configurated Wifi network or Duckietown Wifi network

Environment of demo:
* Good lightning

## Duckiebot setup notes {#demo-template-duckiebot-setup}

* Make sure the camera is heading ahead.
* Duckiebot in configuration [DB17-jwd](#duckiebot-configurations)


## Pre-flight checklist {#demo-template-pre-flight}

Check: Turn on joystick.
Check: Turn on battery of the duckiebot.
Check: Duckiebot drives correctly with joystick.

## Demo instructions {#demo-template-run}

Here, give step by step instructions to reproduce the demo.

Step 1: On duckiebot, in /DUCKIERTOWN_ROOT/ directory, run command:

    duckiebot $ make demo-lane-following

Wait a while so that everything has been launched.
Drive around with joystick to check if connection is working.

Step 2: Press X to start anti-instagram.

Step 3: Start the autonomous lane following by pressing the **R1** button on joystick. to start autonomous.

Step 4: Enjoy the demo.


Press L1 to switch to joystick control. 


Step 2: On laptop, make sure ros enviroment has been activated, run command:

    laptop $ rviz

In rviz, two markerarrays /(vehicle_name)/duckiebot_visualizer/segment_list_markers and /(vehicle_name)/lane_pose_visualizer_node/lane_pose_markers can be visualized. The green arrow shall be in a reasonable direction.

Step 3: On laptop, make sure ros enviroment has been activated, run command:

    laptop $ rqt

In rqt, the images can be visualized are /(vehicle_name)/camera_node/image/compressed, /(vehicle_name)/line_detector_node/image_with_lines, /(vehicle_name)/lane_filter_node/belief_img.


## Troubleshooting {#demo-template-troubleshooting}
Problem:
* The Duckiebot does not drive nicely in the lane.
Solution:
* 
* Check the extrinsic and intrinsic [calibration](#camera-calib)

Problem:
* Demo does not compile.
Solution:
* Run [what-the-duck](#subsub:what-the-duck) and follow instructions .


Problem:
* Duckiebot drives not with joystick.
Solution:
* Turn joystick on and off multiple times.
* Check if battery is powered on.

