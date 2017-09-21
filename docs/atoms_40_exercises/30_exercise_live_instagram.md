# Exercise: Live Instagram {#exercise-instagram-live status=beta}


## Skills learned

* Live image processing

## Instructions

Do the first ROS tutorial at [](#ros-python-howto).
That tutorial is about listening to text messages and writing back
text messages. Here, we apply the same principle, but to images.

Create a ROS node that takes camera images and applies a given operation,
as specified in the next section.


## Specification for the program `dt-instagram-live`

Create a program `dt-live-instagram` that takes a string argument:

    $ dt-instagram-live ![filters]

This program should do the following:

- Subscribe to the camera images, by finding
a topic that is called `![...]/compressed`. Call the name of the
topic `![topic]`

- Publish to the topic `![topic]/![filters]` a stream of images
where the filters are applied to the image.


## Useful new APIs

TODO: to write


## Check that it works

TODO: to write

<!--  -->
