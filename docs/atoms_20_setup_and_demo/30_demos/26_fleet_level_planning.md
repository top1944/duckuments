# Demo template {#demo-template status=beta}

This is the template for the description of a demo.

First, we describe what is needed, including:

* Robot hardware
* Number of Duckiebots
* Robot setup steps
* Duckietown hardware

<div class='requirements' markdown="1">

Requires: Duckiebot in configuration DB17-jwd. DB17-jwdl if coordination at intersections desired.

Requires: Camera calibration completed.

</div>

## Video of expected results {#demo-template-expected}

First, we show a video of the expected behavior (if the demo is succesful).

## Duckietown setup notes {#demo-template-duckietown-setup}

You need at least one duckiebot, and a duckietown.

The duckiebot needs to be at least a DB17-jwd, better a DB17-jwdl.

The duckietown needs to have at least one april tag visible from every intersection to allow localization. Make sure to have a description of your map available. For more infos on this see the localization package. 

If you use this demo, you will have to install the fleet communication dependencies. This might take up to 40 minutes. For more, see below. 

## Duckiebot setup notes {#demo-template-duckiebot-setup}

Duckiebots need to have all the dependencies installed. Use the fleet level communication setup developed by the fleet-communication team. To do this checkout the branch `devel-fleet-planning-comms` and navigate into the folder `catkin_ws/src/30-localization-and-planning/fleet_messaging/dependencies`. Now identify the name of wlan interface on by running: `ifconfig`. It is probably named `wlan0`. The next step is to run the install script as follows: 

	install_fleet_messaging <wlan_interface> <ip_address> 

Where `<wlan_interface>` is the name of the wlan interface as found with `ifconfig` and `<ip_address>` is a randomly chosen IP address of the form 192.168.x.x/24. Make sure that you run this install script with different IP adresses for each duckiebot that takes part in the demo.

## Master Laptop setup notes ¢#demo-fleet-planning-master-laptop-setup}

For the demo to run you need one laptop that is in the same network as all the duckiebots and runs the central planning node. All duckiebots report their location to that node. With that information it plans which duckiebot picks up which customer. To receive this messages, the laptop also needs the fleet level communication setup. Perform the same steps as you just did on each duckiebot on the laptop. Running of the install script should take much less time.

## Pre-flight checklist {#demo-template-pre-flight}

Check: Duckiebots have communication dependencies installed (described above).
Check: Duckiebots and laptop are connected to the same network
Check: All duckeibots can be ssh'ed from your laptop
Check: You got popcorn and refreshments for the taxi customers

## Demo instructions {#demo-template-run}


### Step 1:
 Pick a duckiebot, log in via ssh. 

### Step 2: checkout branch
From duckietown root folder:
	
	git checkout devel-fleet-planning

### Step 3: rebuild catkin

	make build-catkin

### Step 4: Environment
 Prepare environment:

	source environment.sh
	source set_veh_name.sh <robot_name>

### Step 5: Run the demo!

	roslaunch fleet_planning master.launch

Wait until all nodes have successfully been initialized. Then proceed with step 6.

Option: Set `joystick_demo:=true` if lane following or intersection control does not work well for some reason. This way you can manually steer the duckiebot through duckietown and still see how the fleet planning software works. Pay attention to the terminal output of your duckiebot to see which exit to take at an intersection. Give the duckiebot time to localize at intersections. 

### Step 6: Environment laptop
On the laptop, checkout the same branch, rebuild catkin and in the duckietown root folder:

	source environment.sh
	source set_ros_master.sh

Take care, NO argument to the set_ros_master.sh! We want the master to be on your laptop.

### Step 7: Taxi central:
Run on the taxi central your laptop:
	roslaunch fleet_planning master.laptop.sh

### Step 8: Start the GUI

	rqt --force-discover

If you don't see nothing meaningful, start the fleet planning plugin via Plugins->Fleet Planning.

### Step 9: Have fun!
Place your duckiebot at an intersection and it will localize and appear on the map in rqt. The taxi central will automatically assign a mission to the duckiebot, random, to keep him moving and not blocking the streets. Hit R1 on the joystick to go into auto pilot mode. The duckiebot will now follow the instructions from the taxi central. 

Create a new customer request by clicking on the start node and then on the target node of your journey. Hit 'Find Plan'. The taxi central will assign the customer to the closest duckiebot and recalculate its path once it localizes again. The new path will be displayed on the map. You will see how the customer moves with its taxi once he was picked up. 

If a duckiebot does not localize within a certain time window it will be removed from the map. 

### Step 10: More duckiebots! 
Once you get bored with only one duckiebot on the map, or want to expand your business, add a another duckiebot to your fleet by repeating steps 1-5. You may add a few more duckiebots like this.  

## Troubleshooting {#demo-template-troubleshooting}

The fleet planning demo depends on many other packages to work well. You may take the lane following and intersection control packages out of the loop by activating the joystick demo. More details at step 5. 
