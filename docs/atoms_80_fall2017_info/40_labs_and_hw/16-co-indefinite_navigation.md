# Checkoff: Navigation {#checkoff_navigation status=ready}

<div class='requirements' markdown='1'>

Requires: [](#checkoff_calibration)

Requires: [](#checkoff_take_a_log)

Result: 2 logs of your robot autonomously navigating Duckietown

</div>

<div class="only-montreal" markdown="1">
Montreal Deadline: Nov 14, 11pm
</div>


## Pull from master

As always - it's a good idea to pull from `master` often.

## Lane Following

Place your robot on the Duckietown map somewhere on the "outer loop" (right hand lane so that it will follow the exterior of the map).

Launch the robot with the command from `![DUCKIETOWN_ROOT]`:

    duckiebot $ make demo-lane-following
    
Open a terminal on your laptop and set the ros master to your robot.

Toggle the `VERBOSE` flag by writing:

    $ rosparam set /![robot_name]/line_detector_node/verbose true

Then open `rqt_image_view`. Look at the `.../image_with_lines` image output. Apply the **anti-instagram callibration** by pushing the `Y` button on the joystick (TODO: is it the same for the new joysticks?). You should see your image get corrected and the line detections become more correct. If nothing happens and your robot output complains of bad health, move the robot a little bit and try again.

You may also be interested to look at the `../belief_img` to see the output of the histogram filter. It should be quite stable if your robot is not moving. You can move the robot around to see how the posterior is updating. 

If everything is looking good then push the `START` button on the joystick and your robot should start to drive. 

The robot operation should like like [this](#https://photos.app.goo.gl/AirDLHRXUiImuX7x1)

Follow the instructions [here](#record-log) to take a **minimal** log of at least 5 mins of uninterrupted robot autonomous function. Upload [here](https://www.dropbox.com/request/eMEScDXEhB7KI1TqOGjg).

### Bonus

The student who uploads the longest log of uninterupted robot autonomous lane following from any institution will get a great bonus.

## Indefinite Navigation

Follow the exact same procedure above but instead of running the lane following demo run the "indefinite navigation" demo:

    duckiebot $ make indefinite-navigation

Your robot will now stop at the stop lines and then make a random turn through the intersection. If it is crashing a lot you may need to turn the trajectories it takes through the intersection. To do so you may need to edit the file [here](https://github.com/duckietown/Software/blob/master/catkin_ws/src/00-infrastructure/duckietown/config/baseline/intersection_control/open_loop_intersection_node/default.yaml):

```
turn_left: #time, velocity, angular vel
  - [0.8, 0.43, 0]
  - [1.8, 0.43, 2.896]
  - [0.8, 0.43, 0.0]
turn_right:
  - [0.6, 0.43, 0]
  - [1.2, 0.3, -4.506]
  - [1.0, 0.43, 0.0]
turn_forward:
  - [0.8, 0.43, 0.4]
  - [1.0, 0.43, 0.0]
  - [1.0, 0.43, 0.0]
```

to make it more reliably traverse the intersections.

Follow the instructions [here](#record-log) to take a **minimal**. You may use the `BACK` button to stop it from crashing and then return it to autonomous mode with the `START` button. 
Upload [here](https://www.dropbox.com/request/eMEScDXEhB7KI1TqOGjg).

### Bonus

The student who uploads the longest log of uninterupted robot autonomous indefinite navigation from any institution will get a great bonus.
