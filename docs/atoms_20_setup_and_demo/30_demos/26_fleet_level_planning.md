# Demo template {#demo-template status=beta}

This is the template for the description of a demo.

First, we describe what is needed, including:

* Robot hardware
* Number of Duckiebots
* Robot setup steps
* Duckietown hardware

<div class='requirements' markdown="1">

Requires: Duckiebot in configuration ???

Requires: Camera calibration completed.

</div>

## Video of expected results {#demo-template-expected}

First, we show a video of the expected behavior (if the demo is succesful).

## Duckietown setup notes {#demo-template-duckietown-setup}

Here, describe the assumptions about the Duckietown, including:

* Layout (tiles types)
* Instrastructure (traffic lights, wifi networks, ...) required
* Weather (lights, ...)

Do not write instructions here. The instructions should be somewhere in [the part about Duckietowns](#duckietowns). Here, merely point to them.


## Duckiebot setup notes {#demo-template-duckiebot-setup}

Duckiebots need to have all the dependencies installed use the fleet level communication setup developed by the fleet-communication team. To do this checkout the branch `devel-fleet-planning-comms` and navigate into the folder `catkin_ws/src/30-localization-and-planning/fleet_messaging/dependencies`. Now identify the name of wlan interface on by running: `ifconfig`. It is probably named `wlan0`. The next step is to run the install script as follows: 

	install_fleet_messaging <wlan_interface> <ip_address> 

Where `<wlan_interface>` is the name of the wlan interface as found with `ifconfig` and `<ip_address>` is a randomly chosen IP address of the form 192.168.x.x/24. Make sure that you run this install script with different IP adresses for each duckiebot that takes part in the demo.

## Master Laptop setup notes ¢#demo-fleet-planning-master-laptop-setup}

For the demo to run you need one laptop that is in the same network as all the duckiebots and runs the central planning node. All duckiebots report their location to that node. With that information it plans which duckiebot picks up which customer. To receive this messages, the laptop also needs the fleet level communication setup. Perform the same steps as you just did on each duckiebot on the laptop. Running of the install script should take much less time.

## Pre-flight checklist {#demo-template-pre-flight}

The pre-flight checklist describes the steps that are sufficient to
ensure that the demo will be correct:

Check: operation 1 done

Check: operation 2 done

## Demo instructions {#demo-template-run}

Here, give step by step instructions to reproduce the demo.

Step 1: XXX

Step 2: XXX


## Troubleshooting {#demo-template-troubleshooting}

Add here any troubleshooting / tips and tricks required.

## Demo failure demonstration {#demo-template-failure}

Finally, put here a video of how the demo can fail, when the assumptions are not respected.
