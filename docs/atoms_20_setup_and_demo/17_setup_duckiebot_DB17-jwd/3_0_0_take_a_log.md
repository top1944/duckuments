# Taking a log {#take-a-log status=draft}

<div class='requirements' markdown='1'>

Requires: [](#read-camera-data)

Requires: [](#sec:rc-control)

Result: A log 

</div>


Note: it is recommended that you log to your USB and not to your SD card. To mount your USB see [](#mounting-usb)

run on duckiebot:

    duckiebot $ make demo-joystick-camera

run on laptop:

    laptop $ cd ![DUCKIETOWN_ROOT]
    laptop $ source set_ros_master.sh ![ROBOT_NAME]
    laptop $ rqt_image_view
    
and verify that indeed your camera is streaming imagery.

on your duckiebot in a new tab (F2 in byobu)

    duckiebot $ rosbag record -a -o /media/logs/![ROBOT_NAME]

where here we are assuming that you are logging to the USB and have following [](#mounting-usb).

# Verify a log {#verify-a-log status=draft}


On your robot run:

    duckiebot $ rosbag info ![FULL_PATH_TO_BAG] --freq

- verify that the "duration" of the log seems "reasonable" - it's about as long as you ran the log command for

- verify that the "size" of the log seems "reasonable" - the log size should grow at about 220MB/min

- verify in the output that your camera was publishing very close to **30.0Hz** and verify that you joysick was publishing at very close to **2.0Hz**

TODO: More complex log verification methods 
