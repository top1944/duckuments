# Exercise: Live Instagram {#exercise-instagram-live status=beta}

Assigned: Andrea Daniele

## Skills learned

* Live image processing

## Instructions

You may find useful: [](#ros-python-howto).
That tutorial is about listening to text messages and writing back
text messages. Here, we apply the same principle, but to images.

Create a ROS node that takes camera images and applies a given operation,
as specified in the next section, and then publishes it.


## Specification for the node `dt-live-instagram-![ROBOT_NAME]_node`

Create a ROS node `dt-live-instagram-![ROBOT_NAME]_node` that takes reads a parameter called `filter`, where the filter is something from the list [](#instagram-filters).

You should launch your camera and joystick with

    duckiebot $ make demo-joystick-camera

Then launch your node with 

    duckiebot $ roslaunch dt-live-instagram_![ROBOT_NAME] dt_live-instagram_![ROBOT_NAME]_node filter:=![filter]

This program should do the following:

- Subscribe to the camera images, by finding
a topic that is called `![...]/compressed`. Call the name of the
topic `![topic]`.

- Publish to the topic `![topic]/![filters]/compressed` a stream of images
where the filter are applied to the image.


## Check that it works

    $ rqt_image_view

and look at `![topic]/![filters]/compressed`
