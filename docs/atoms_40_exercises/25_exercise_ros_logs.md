# Exercise: Simple data analysis from a bag  {#exercise-bag-analysis status=beta}

## Skills learned

- Reading Bag files.
- Statistics functions (mean, median) in Numpy.
- Output of YAML files; a format used for many things in Duckietown.

## Instructions

Create an implementation of `dt-bag-analyze` according to the specification below.

<!-- Call the script `bag-analyze-![username]`. -->


## The `dt-bag-analyze` specification

Create a program that summarizes the statistics of data in a bag file.

    $ dt-bag-analyze ![bag file]

Compute, for each topic:

* The total number of messages.
* The minimum, maximum, average, and median period between successive messages.

Example output:

    $ bag-analyze ![bag file]
    "![topic name]":
        num_messages: 100
        period:
            min: 0.2
            max: 0.3
            average: 0.3
            median: 0.2

## Test that it works

TODO: choose a reference log and give expected output.
