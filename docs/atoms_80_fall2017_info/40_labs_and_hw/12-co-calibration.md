# Checkoff: Robot Calibration {#checkoff_calibration status=ready}

<div class='requirements' markdown='1'>

Requires: [](#checkoff_assembly_configuration)

Requires: That you have correctly cloned and followed the git procedure outline in [](#fall2017-git)

Requires: That you have correctly setup your environment variables according to [](#env-variables)


Result: You robot calibrations (wheels and camera (x2)) are merged  to git through a PR

</div>

Slack channels: [#help-wheel-calib](https://duckietown.slack.com/archives/C6ZDSGJFM), [#help-camera-calib](https://duckietown.slack.com/archives/C6YCCAV6H)


## Pull and rebuild your Software repo on robot and laptop

Some of the services have changed and this requires a rebuild.

On both laptop and robot do:

    $ cd ![DUCKIETOWN_ROOT]
    $ make build-catkin-clean
    $ make build-catkin-parallel
    

## Make a branch in the duckiefleet repo

<div class='only-montreal' markdown="1">
 Remember that the git policy has changed a bit. You are probably best to re-clone the duckiefleet repo. For details see [](#fall2017-git) and particularly the section ` For U de M students who have already submitted homework to the previus duckiefleet-2017 repo`
</div>

Don't forget that master is now protected in duckiefleet. So make a new branch right away and call it `![GIT_USERNAME]-devel`



## Kinematic calibration

Follow the procedure in [](#wheel-calibration). Once you have successfully passed the automated test, take a screen shot and post it to the slack channel [#checkoffs](https://duckietown.slack.com/archives/C7HH51Q4S) and we will all congratulate you.

## Camera calibration

Follow the procedure in [](#camera-calib) to do you intrinsic **and** extrinsic calibrations


## Visually verify the calibration is good in Duckietown

Take your robot to Duckietown. Put it in a lane.

On your robot execute

    duckiebot $ make demo-lane-following

On your laptop do (after setting ros master to your robot):

    laptop $ rqt_image_view

on your joystick you need to hit the top-right button (TODO: add picture).
On the command line you should see the output `state_verbose = True`

in the drop down menu select `![ROBOT_NAME]/line_detector_node/image_with_lines`

on the display you should see all the color-coded line detections

now open the Rviz visualizer on your laptop (after setting ros master to your robot):

    laptop $ rviz

 - click the `Add` button in the bottom left. 

 - then click the `By Topic` tab
 
 - then click the triangle next to `/segment_list_markers` underneath `/duckiebot_visualizer`
 
 - then double click on `MarkerArray` 
 
 On the display you should see the ground projected lines. Do they make sense? If not your calibration is wrong. 
 
 TODO: add a picture of what they should look like 

## Submit a PR

Don't forget at the end to submit a PR back to [duckiefleet repo](https://github.com/duckietown/duckiefleet)



