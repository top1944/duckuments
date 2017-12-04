#Openhouse-dp5 {#Openhouse-dp5 status=draft}  

This demo is from MIT2016.

<div class='requirements' markdown="1">

Requires: Duckiebot in configuration DB17-lc

Requires: Camera calibration and kinematic calibration completed.

</div>


## Duckietown setup notes

The Duckietown used for this demo needs to have the following characteristics:

* Three or four way intersection tiles
* The intersections must be provided with two signs that have to be clearly visible: 1) The intersection type (stop sign or traffic light), 2)intersection topology. Traffic light if needed.


## Duckiebot setup notes

No special setup is needed for the Duckiebot. If more Duckiebots are available, they should be used too since the demo is about coordination and LED emission and detection.


## Demo instructions {#demo-template-run}

Step 1: Run the following commands:
Make sure you are in the duckietown folder:

```

    &#36; cd ~/duckietown

```

Activate ROS:

    $ source environment.sh

Run the demo:

    &#36; make openhouse-dp5

Step 2: Wait for build to finish. Press 'X' to run anti-instagram. Place your Duckiebot on the lane and press 'start'

## Troubleshooting {#demo-template-troubleshooting}

Add here any troubleshooting / tips and tricks required.

## Demo failure demonstration {#demo-template-failure}

Finally, put here a video of how the demo can fail, when the assumptions are not respected.
