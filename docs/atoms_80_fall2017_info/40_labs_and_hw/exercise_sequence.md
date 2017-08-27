# Sequence progression of milestone, lab, and, homework

Note: I am rewriting here all the work-related.

## Milestone: (setup step)

TODO: to write

## Milestone: (setup step)

TODO: to write

## Milestone: (setup step)

TODO: to write

## Milestone: (setup step)

TODO: to write

## Milestone: Take a log with robot

TODO: to write

## Milestone: Calibrated robot wheels

TODO: to write

## Milestone: Camera calibrated

TODO: to write


## Exercise: ROS node tutorial

Do the first ROS tutorial at [](#ros-python-howto). Talker/listener/ base `rosparam`.

## Exercise: Basic image operations

Skills learned:

- Arguments.
- Open and writing files.
- Image representations (pixels, etc.)
- OpenCV API.
- Dealing with exceptions.
- Meaning of exit conditions.
- Unit tests.

### `image-ops` specification {#image-ops-specification}

Create a program that takes as an argument a JPG file:

    $ image-ops ![file] ![outdir]

If the file does not exist, the script must exit with error code `1`.

If the file exists, then it should be read in memory. Then
the script should create:

- `![outdir]/regular.jpg`: a copy of the initial file
- `![outdir]/flip-h.jpg`: the file, flipped horizontally.

If any other error occurs, the script should exit with error code `3`/

#### Testing it works {#image-ops-tester-specification}

We provide a script called `image-ops-tester` that can be used
to make sure that you wrote a good `image-ops`.

Use it as follows:

    $ image-ops-tester ![candidate image-ops]

The program `image-ops-tests` will return 0 if the script conforms
to the `image-ops` specification ([](#image-ops-specification})).

### `image-ops-tester`

A good exercise is writing `image-ops-tester` yourself.

However, we already gave you a copy of `image-ops-tester`, which you used in the previous step, so there is not much of a challenge. So...

### `image-ops-tester-tester`

Write a program `image-ops-tester-tester` that tests whether
a program conforms to the specification of a `image-ops-tester`.

    $ image-ops-tester-tester ![candidate image-ops-tester]

This should return 0 if everything is ok, or different than 0 otherwise.

#### Testing it works

We provide you with a helpful program called `image-ops-tester-tester-tester`
that makes sure that a candidate script conforms to the specification of
an `image-ops-tester-tester`.

Use it as follows:

    $ image-ops-tester-tester-tester ![candidate image-ops-tester-tester]

This should return 0 if everything is ok, or different than 0 otherwise.

### Bottom line

Things that are not tested are broken.



## Exercise: Simple data analysis from a bag

Work in the folder `exercises/10_bag1/![username]/`

### Bag analysis

Create a program that summarizes the statistics of data in a bag file.

    $ bag-analyze-topic  ![bag file] ![topic]

See the `rosbag` API.

Compute, for each topic:

* The total number of messages.
* The min, max, average period
* The jitter.

Example output:

    $ bag-analyze-topic ![bag file] ![topic]
    /topic1   n=10
    /topic2   n=3


### Bag analysis, complete

Create a program `bag-analyze-all` that analyzes all the topics in a bag file,
and outpus the data in YAML format.

    $ bag-analyze-all ![bag file]



Output in YAML in this format:

    topic:
        num: ... # number of messages
        period:
            min:
            max:
            avg:
            med:

#### Useful APIs

* Iterating over topics in a bag.
* Serializing and deserializing YAML.

### Bag analysis

Write a unit test that uses the file `simple.bag`, and runs your program, to checks that the results are 1% between the following.


    $ bag-analyze-topic-tester ![expected.yaml] ![rosbag-info-program] ![arguments]


    topic:  jitter: ...

#### Useful new API learned

- How to call other programs (systems_command).

#### Check that it works

XXX

## Exercise: Bag in, bag out

In this exercise, we start processing the data from a bag, creating another output bag in the process.


### Bag copy

Write a program `bag-copy` that reads a bag, and writes a copy of the same bag.

    $  bag-copy ![in.bag] ![out.bag].bag

#### Useful new API learned

- Writing to a bag file.

### Bag decimate

Write a program `bag-decimate` that reads a bag, and only writes a subset
of the messagess.

    $ bag-decimate ![n]

This only writes 1/n messages in the output. (If `n` is 1, the output is the same as `bag-copy`.)


#### Useful new API learned

* None

#### Check that it works

Now process the data with `bag-analyze-topic`: you should see that the statistics have changed.

## Exercise: Bag images

Purpose: Read image files from a bag.

Write a program `bag-thumbnails` that creates thumbnails for some image topic in a bag file.

    $ bag-thumbnails ![bag] ![output]

This should create the files:

    ![output]/00000.jpg
    ![output]/00001.jpg
    ![output]/00002.jpg
    ![output]/00003.jpg
    ![output]/00004.jpg

## Exercise: Use our API for arguments

Purpose: We want to learn about the command-line API that we have in Duckietown,
which makes it easy to create programs with command line arguments.

TODO: to write

#### Useful new API learned

* Our API for command line arguments.


## Exercise: Instagram filters

Learn about:

* Image pixel representation
* Image manipulation


Write a program `bag-instagram` that applier thumbnails for some image topic in a bag file.

    $ bag-instagram --input ![bag] --topic ![topic] --filters ![filter names]  ![bag output]

where:

- `![topic]` is a topic name. Example: `/topic/name`
- `![filter names]` is a colon-separated list of strings. Example: `flip-h:grayscale`.

Define the following filters:

- `flip-h`: flips the image horizontally;
- `flip-v`: flips the image vertically;
- `grayscale`: make the image grayscale
- `sepia`: make the image sepia
- ...

The filters should be applied in order to the image.

For example:

    $ bag-instagram --filters flip-h:grayscale  ![...]

means that you first have to apply the filter `flip-h`, then the filter `gray-scale`.


## Exercise: Bouncing ball

Learned skills:

* Show how to visualize data on a bag.
* Programmatic generation of images.
* Timestamps generation.

### `bag-bounce`

Create a program

    $ bag-bounce --fps ![fps] --speed ![speed]

that shows a bouncing ball on the screen, as if it were a billiard

#### Useful new API learned {nonumber=1}

* Our API for command line arguments.

## Exercise: Visualizing data on image

Learned skills:

* Show how to superimpose data on an image.

### `bag-mark-spots`

Create a program that for each image, finds the pixels that are closest
to a certain color, and creates as the output a big red, yellow white spot on them.

    $ bag-mark-spots --input ![bag in] --mark "[[255,0,0],255,0,0]," --size 5 --output [bag out]


## Exercise: Make that into a node

Learned skills:

* Abstracting code in interfaces that can be reused.
* Launch files.

Abstract the analysis above in a way that the same analysis code can be run equally
from a bag or on the laptop.

Make a ROS node and two launch files:

* One runs everything on the Duckiebot, and the output is visualized on the laptop.
* One runs the processing on the laptop.

## Exercise: Instagram with EasyAlgo interface

(Do the above using our API for filters.)

We define the interface `InstagramFilter` and the EasyAlgo configuration files.

### EasyAlgo tutorial

...

### Use in your code

Write a node using the EasyNode framework that decides which filters to run
given the configuration.

TODO: Also introduce the DUCKIETOWN_CONFIG_SEQUENCE.

## Exercise: Instagram with EasyAlgo interface

## Milestone: Illumination invariance (anti-instagram)

TODO: Make them run our code, and also visualize what's going on


<!-- nuisance -->



## Exercise: Launch files basics

## Exercise: Unit tests

- Unit tests

## Exercise: ROS tests

- Integration with ROS tests

## Exercise: Processing: Analytics

- Measure the latency and frequency of the node

- Measure the latency of another node

## Exercise: Parameters (standard ROS api)

- Reading parameters
- Dynamic modification of parameters

## Exercise: Parameters (our API)

- Reading parameters
- Dynamic modification of parameters



## Exercise: Place recognition abstraction

Skills learned:

- ...

We use the following interface:

    class FeatureDescription():

        def feature(self, image):
            """ returns a "feature description" """

        def feature_compare(feature1, feature2):
            pass

We also provide a basic skeleton.

### Try a basic feature:

Simplest feature: average color.

    class AverageColor(FeatureDescription):

        def feature(self, image):
            return np.mean(image)

        def feature_mismatch(f1, f2)
            return np.abs(f1-f2)

Compute the similarity matrix for the

    $ similarity --feature average_color --input ![input.bag]  --output ![dirname]



## Parallel processing

We introduce the support for parallel processing that we have in the APIs.



## Exercise: Place recognition

TODO: to write

## Milestone: Lane following

TODO: to write

## Exercise: localization

TODO: to write

## Milestone: Navigation

TODO: to write

## Exercise: group forming

TODO: to write

## Milestone: Ducks in a row

TODO: to write

## Exercise: Comparison of PID

TODO: to write

## Exercise: RRT

TODO: to write

## Caffe tutorial

TODO: to write

## Milestone: Object Detection

TODO: to write


## Exercise: Object Detection

TODO: to write

## Milestone: Semantic perception

TODO: to write


## Exercise: Semantic perception

TODO: to write

## Milestone: Reacting to obstacles

TODO: to write

## Exercise: Reacting to obstacles

TODO: to write

## Milestone: SLAM demo

TODO: to write

## Exercise: SLAM

TODO: to write

## Milestone: fleet demo

TODO: to write

## Exercise: fleet

TODO: to write

## Project proposals

TODO: to write
