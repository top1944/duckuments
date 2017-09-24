# Exercise: Live Instagram {#exercise-instagram-live status=beta}

Assigned: Andrea Daniele

## Skills learned

* Live image processing

## Instructions

Do the first ROS tutorial at [](#ros-python-howto).
That tutorial is about listening to text messages and writing back
text messages. Here, we apply the same principle, but to images.

Create a ROS node that takes camera images and applies a given operation,
as specified in the next section.


## Specification for the program `dt-live-instagram`

Create a program `dt-live-instagram` that takes a string argument:

    $ dt-live-instagram ![filters]

This program should do the following:

- Subscribe to the camera images, by finding
a topic that is called `![...]/compressed`. Call the name of the
topic `![topic]`.

- Publish to the topic `![topic]/![filters]` a stream of images
where the filters are applied to the image.


## Check that it works

Run your program

    $ dt-live-instagram ![filters]

It might be a good idea to print out the topic selected by your program. Let's
call it `![topic]`. Run the following command to make sure that your program is working.

    $ rosrun image_view image_view image:="![topic]/![filters]" _image_transport:=compressed
