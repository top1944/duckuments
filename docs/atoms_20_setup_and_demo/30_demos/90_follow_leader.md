# Follow Leader {#demo-follow-leader status=beta}

This is the description of the follow the leader demo.

<div class='requirements' markdown="1">

Requires: Wheels calibration completed.[wheel calibration](#wheel-calibration)

Requires: Camera calibration completed.[Camera calibration](#camera-calib)

Requires: Lane following demo works.[Lane following demo](#demo-lane-following)

Requires: Circle grid tags on Duckiebots.

Requires: More than one Duckiebot

</div>

## Video of expected results {#demo-follow-leader-expected}

First, we show a video of the expected behavior (if the demo is succesful).

## Duckietown setup notes {#demo-follow-leader-duckietown-setup}

A Duckietown with white and yellow lanes. No obstacles on the lane.

## Duckiebot setup notes {#demo-follow-leader-duckiebot-setup}

Make sure the camera is heading ahead. Tighten the screws if necessary. Attach circle grid with tape at the rear.

<div figure-id="fig:DuckiebotWithCircleGrid" figure-caption="Duckiebot with Circle Grid">
     <img src="DuckiebotWithCircleGrid.jpg" style='width: 15em'/>
</div>

## Pre-flight checklist {#demo-follow-leader-pre-flight}

Check: Joystick is turned on.

Check: Sufficient battery charge of the Duckiebot.

## Demo instructions {#demo-follow-leader-run}

Run the following commands on different Duckiebots at the same time.

Step 1: On Duckiebot, in /DUCKIETOWN_ROOT/ directory, run command:

    duckiebot $ make demo-vehicle_follow_leader

Wait a while so that everything has been launched. Press R2 to start autonomous lane following with vehicle avoidance. Press L1 to switch to joystick control.
In autonomous lane following mode with vehicle avoidance the Duckiebot is keeping a distance to another Duckiebot on front of him.

Step 2: On laptop, make sure ros environment has been activated.

    laptop $ rqt_image_view

In rqt_image_view the images with circle grid: /(vehicle_name)/vehicle_detection_node/circlepattern_image.

If the circle grid is detected, the grid is drawn in the image.


## Troubleshooting {#demo-template-troubleshooting}

Add here any troubleshooting / tips and tricks required.

## Demo failure demonstration {#demo-template-failure}

Finally, put here a video of how the demo can fail, when the assumptions are not respected.
