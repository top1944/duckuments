# Taking and verifying a log {#take-a-log status=beta}

<div class='requirements' markdown='1'>

Requires: [](#read-camera-data)

Requires: [](#sec:rc-control)

Result: A verified log.

</div>

## Preparation

Note: it is recommended that you log to your USB and not to your SD card.

See: To mount your USB see [](#mounting-usb).

## Run the joystick-camera

Run on the Duckiebot:

    duckiebot $ make demo-joystick-camera

## View images on the laptop

Run on the laptop:

    laptop $ cd ![Duckietown root]
    laptop $ source set_ros_master.sh ![robot name]
    laptop $ rqt_image_view

and verify that indeed your camera is streaming imagery.

## Record the log

Run on the Duckiebot in a new terminal (See [](#byobu)):

    duckiebot $ rosbag record -a -o /media/logs/![robot name]

where here we are assuming that you are logging to the USB and have followed [](#mounting-usb).

## Verify a log {#verify-a-log status=beta}


On the Duckiebot run:

    duckiebot $ rosbag info ![FULL_PATH_TO_BAG] --freq

Then:

- verify that the "duration" of the log seems "reasonable" - it's about as long as you ran the log command for

- verify that the "size" of the log seems "reasonable" - the log size should grow at about 220MB/min

- verify in the output that your camera was publishing very close to **30.0Hz** and verify that you joysick was publishing at very close to **2.0Hz**.

TODO: More complex log verification methods.
