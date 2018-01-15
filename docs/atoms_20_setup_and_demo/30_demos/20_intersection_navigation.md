# Intersection Navigation  {#demo-inter-navigation status=draft}

This demo allows you to test the intersection navigation functionality. Your duckiebot will be able to cross intersections all by itself, just like a big duck.

<div class='requirements' markdown="1">

Requires: Duckiebot in configuration DB17-jwd.

Requires: Camera calibration completed.

Requires: Wheel calibration completed.

Requires: Duckietown Version 2.0.

</div>

## Video of expected results {#demo-template-expected}

This video shows what you should get:

## Duckietown setup notes {#demo-template-duckietown-setup}

* Layout: Duckietown Version 2.0 with at least 1 intersection tile (4- or 3-way)
* Infrastructure: Traffic signs in the intersection tile according to D-2 3)
* Weather: Room or sunlight.

## Duckiebot setup notes {#demo-template-duckiebot-setup}




## Pre-flight checklist {#demo-template-pre-flight}

Check: Is the battery is charged enough?

Check: Is your lens cover off?

Check: Is your bot up to date with latest software by using git pull?




## Demo instructions {#demo-indefinite-navigation-run}

Follow these steps to run the intersection navigation on your Duckiebot:

For the current working version you need to checkout the branch devel-intersection_navigation , and more specifically the commit #0837ecf until a stable verson is published.  

Step 1: Place your Duckiebot at a four-way intersection just in front of the redline.

Step 2: The current version works with a gain of 0.6. To modify your gain to 0.6 run:

    &#36; rosservice call /![robot name]/inverse_kinematics_node/set_gain -- 0.60

Step 3: On the Duckiebot, navigate to the `/DUCKIETOWN_ROOT/` directory, run the command:

	  duckiebot $ source environment.sh
    
    duckiebot $ roslaunch interscetion_navigation intersection_navigation_node.launch veh:=![robot_name]

Step 4: In another terminal on the Duckiebot navigate to the following directory:

	  duckiebot $ source environment.sh
  	
    duckiebot $ cd ~/duckietown/catkin_ws/src/20-indefinite-navigation/intersection_navigation/scripts/

and run

	  duckiebot $ ./at_intersection.py

this script simulates an entry of the FSM and initializes the intersection navigation. 

If you want to visualize what happens at the intersection when the template is matched, just follow these steps simultaneously with Step 4 described previously.

Navigate to the Duckietown folder,

    laptop &#36; cd ~/duckietown

then source the environment,

    laptop &#36; source environment.sh

set the the ROS master to your vehicle,

    laptop &#36; source set_ros_master.sh ![robot name]

and finally launch 

    laptop &#36; roslaunch intersection_navigation intersection_visualizer_node.launch robot_name:=![robot name]


## Troubleshooting {#demo-template-troubleshooting}

* My duckiebot does not look like a duck.  -> Place 1 rubber duck on duckiebot.


## Demo failure demonstration {#demo-template-failure}


