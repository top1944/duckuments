# Exercise: Bag thumbnails  {#exercise-bag-images status=draft}

Assigned: Andrea Daniele

## Skills learned

* Read images from images topics.


## Instructions

Write a program `dt-bag-thumbnails` that creates thumbnails for some image stream
topic in a bag file.

    $ dt-bag-thumbnails ![bag] ![topic] ![output dir]

This should create the files:

    ![output dir]/00000.jpg
    ![output dir]/00001.jpg
    ![output dir]/00002.jpg
    ![output dir]/00003.jpg
    ![output dir]/00004.jpg
    ...

where the progressive number is an incremental counter for the frames.


## Test data

If you don't have a ROS bag to work on, you can download the test bag
[`example_rosbag_H5.bag`](https://www.dropbox.com/s/4259oqxnyb9c3ws/example_rosbag_H5.bag?dl=1).
You should be able to get a total of 653 frames out of it.

## Useful APIs

### Read image from a topic

The [`duckietown_utils`](http://purl.org/dth/duckietown-utils-library)
package provides the utility function [`rgb_from_ros()`](#duckietown_utils-rgb_from_ros)
that processes a ROS message and returns the RGB image it contains (if any).
