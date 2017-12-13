# Indefinite Navigation {#demo-indefinite-navigation status=beta}

This is the description of the indefinite navigation demo.

<div class='requirements' markdown="1">

Requires: Wheels calibration completed.[wheel calibration](#wheel-calibration)

Requires: Camera calibration completed.[Camera calibration](#camera-calib)

Requires: Joystick demo has been successfully launched.[Joystick demo](#rc-control)

Requires: Fully set up Duckietown (including April tags for intersections)

Requeres: A motor gain of approximately 0.65 (strong influence in open-loop intersections)
</div>

## Video of expected results {#demo-indefinite-navigation-expected}

[link 1 of lane following](https://photos.google.com/share/AF1QipMEwYvBW5hl3_l4M0f9on3RSKJmYftbWxo0nSyW7EMTBWs7iXRc_fHEc5mouSMSxA/photo/AF1QipPOmXr0yu__d_J0Wefp1Gm6sNTtptUk57FvS6Fo?key=M1ZWc2k0Nnl4ckFjd3dwRmV0WmdMSzFWU0xmOXh3)

## Duckietown setup notes {#demo-indefinite-navigation-duckietown-setup}

A duckietown with white and yellow lanes. No obstacles on the lane.

## Duckiebot setup notes {#demo-indefinite-navigation-duckiebot-setup}

Make sure the camera is heading ahead. Tighten the screws if necessary. 

## Pre-flight checklist {#demo-indefinite-navigation-pre-flight}

Check: turn on joystick. 

Check: Enough battery of the duckiebot. 

Check: Gain is approx. 0.65

## Demo instructions {#demo-indefinite-navigation-run}

Follow these steps to run the indefinite navigation demo on your Duckiebot:

Step 1: On duckiebot, in /DUCKIERTOWN_ROOT/ directory, run command:

    duckiebot $ make indefinite-navigation
    
Wait a while so that everything has been launched. Press R1 to start autonomous lane following. Press L1 to switch to joystick control. Press X to start anti-instagram. 
Empirically speaking, no duckiebot will successfully run the demo for its first time. Parameter tuning is a must. The only two parameters that you can modify is the gain and trim. The parameter pair which makes your bot go straight will unlikely work for the lane following due to the current controller design. Start with your parameter pair obtained from wheel calibration. If your Duckiebot stays too long on a curve during crossing an intersection, decrease your gain in steps of 0.05. If the Duckiebot doesn't make the turn enough long, increase your gain in steps of 0.05. 

Command to modify your gain (in this example to 0.65)

     rosservice call /<robot-name>/inverse_kinematics_node/set_gain -- 0.65
     
Everything below is optional but helpful for debugging if your robot does not follow the lane at all.
Step 2: On laptop, make sure ros enviroment has been activated, run command:

    laptop $ rviz

In rviz, two markerarrays /(vehicle_name)/duckiebot_visualizer/segment_list_markers and /(vehicle_name)/lane_pose_visualizer_node/lane_pose_markers can be visualized. The green arrow shall be in a reasonable direction. 

Step 3: On laptop, make sure ros enviroment has been activated, run command:

    laptop $ rqt
    
In rqt, the images can be visualized are /(vehicle_name)/camera_node/image/compressed, /(vehicle_name)/line_detector_node/image_with_lines, /(vehicle_name)/lane_filter_node/belief_img.


## Troubleshooting {#demo-template-troubleshooting}

Contact Julien Kindle(ETHZ) via Slack if any trouble occurs. 


