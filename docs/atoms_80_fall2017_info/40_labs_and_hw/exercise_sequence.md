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

### Skills learned


* ... Talker/listener/ base `rosparam` XXX

### Instructions

Do the first ROS tutorial at [](#ros-python-howto).

<!--  -->


## Exercise: Basic image operations and testing

### Skills learned


- Command line arguments.
- Open and writing files.
- Image representations (pixels, etc.)
- OpenCV API.


### Instructions


Create a program that takes as an argument a JPG file:

    $ image-op ![file]

and creates a file called `![file].flipped.jpg`
that is flipped around the vertical axis.


### Useful APIs

TODO: add here pointers to relevant `duckietown_utils` functions.


<!--  -->

## Exercise: Specifications and testing

### Skills learned

- Dealing with exceptions.
- Meaning of exit conditions.
- Unit tests.

### Instructions

We give you a better specification of a program `image-ops` similar to the previous one.

This time, we specify exactly what should happen. This allows to do automated testing
of the script.

### `image-ops` specification {#image-ops-specification}

The program `image-ops` expects exactly two arguments: a filename (a JPG file)
and a directory name.

    $ image-ops ![file] ![outdir-dir]

If the file does not exist, the script must exit with error code `2`.

If the file cannot be decoded, the script must exit with error code `3`.

If the file exists, then the script must create:

- `![outdir]/regular.jpg`: a copy of the initial file
- `![outdir]/flip.jpg`: the file, flipped horizontally.
- `![outdir]/side-by-side.jpg`: the two files, side by side.

If any other error occurs, the script should exit with error code `99`.

<div figure-id="fig:example" figure-class="subfigs-floating">
    <img figure-id="subfig:original" src='image-ops-original.jpg'/>
    <img figure-id="subfig:flip"     src='image-ops-flip.jpg'/>
    <img figure-id="subfig:side"     src='image-ops-side.jpg'/>

    <div style='clear: both;'></div> <!-- XXX add to template -->
</div>

<figcaption id="fig:example:caption">
Example input-output for the program <code>image-ops</code>.
</figcaption>

<figcaption id="subfig:original:caption">
The original picture.
</figcaption>

<figcaption id="subfig:flip:caption">
The output <code>flip.jpg</code>
</figcaption>

<figcaption id="subfig:side:caption">
The output <code>side-by-side.jpg</code>
</figcaption>



<style>
.subfigs-floating div.generated-figure-wrap{
    display: inline-block;
    float: left;
}

.subfigs-floating figcaption { clear: both; }

#fig\:example img {
    height: 5em;
    margin-left: 2em;
    margin-right: 2em;
}
</style>

### Useful APIs

TODO: Some useful functions that you might want to use are:

### Testing it works with `image-ops-tester` {#image-ops-tester-specification}

We provide a script called `image-ops-tester` that can be used
to make sure that you wrote a conformant `image-ops`.

Use it as follows:

    $ image-ops-tester ![candidate-image-ops]

If the script cannot be found, `image-ops-tester` will return 1.

`image-ops-tester` will return 0 if the program exists and conforms
to the `image-ops` specification ([](#image-ops-specification)).

If it can establish that the program is not good, it will return 11.


### Bottom line {nonumber=1}

Things that are not tested are broken.


<!--  -->

## Exercise: Who watches the watchmen? (optional)

### Skills learned:

TODO: ...

### Instructions

A good exercise is writing `image-ops-tester` yourself.

However, we already gave you a copy of `image-ops-tester`, which you
used in the previous step, so there is not much of a challenge. So, let's go one level up, and consider...

### `image-ops-tester-tester` specification

Write a program `image-ops-tester-tester` that tests whether
a program conforms to the specification of a `image-ops-tester`
given in [](#image-ops-tester-specification).

The `image-ops-tester-tester` program is called as follows:

    $ image-ops-tester-tester ![candidate-image-ops-tester]

This must return:

- 0 if the candidate conforms to the specification;
- 1 if it doesn't;
- another error code if other errors arise.

#### Testing it works with `image-ops-tester-tester-tester`

We provide you with a helpful program called `image-ops-tester-tester-tester`
that makes sure that a candidate script conforms to the specification of
an `image-ops-tester-tester`.

Use it as follows:

    $ image-ops-tester-tester-tester ![candidate image-ops-tester-tester]

This should return 0 if everything is ok, or different than 0 otherwise.

### Bottom line {nonumber=1}

Even if things are tested, you can never be sure that the tests themselves work.

<!-- TODO: Validation and testing -->


## Exercise: Simple data analysis from a bag

### Skills learned

TODO: to write

### Instructions

Work in the folder `exercises/10_bag1/![username]/`

### Bag analysis: `bag-analyze-topic`

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


### Bag analysis complete: `bag-analyze-all`

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

### Useful APIs

* Iterating over topics in a bag.
* Serializing and deserializing YAML.

### Bag analysis

Write a unit test that uses the file `simple.bag`, and runs your program, to checks that the results are 1% between the following.


    $ bag-analyze-topic-tester ![expected.yaml] ![rosbag-info-program] ![arguments]


    topic:  jitter: ...

### Useful APIs

- How to call other programs (systems_command).

### Check that it works

XXX

<!--  -->

## Exercise: Bag in, bag out

### Skills learned

* Writing a bag.

### Instructions

In this exercise, we start processing the data from a bag, creating another output bag in the process.

### Specification for `bag-copy`

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

<!--  -->

## Exercise: Bag images

### Skills learned

* Writing images to file.


### Instructions

Write a program `bag-thumbnails` that creates thumbnails for some image topic in a bag file.

    $ bag-thumbnails ![bag] ![output]

This should create the files:

    ![output]/00000.jpg
    ![output]/00001.jpg
    ![output]/00002.jpg
    ![output]/00003.jpg
    ![output]/00004.jpg

## Exercise: Use our API for arguments

### Skills learned

- Learn about the command-line API that we have in Duckietown,

### Instructions

We have a useful API that makes it easy to create programs with command line arguments.

TODO: to write

#### Useful new API learned

* Our API for command line arguments.

<!--  -->

## Exercise: Instagram filters

### Skills learned

* Image pixel representation
* Image manipulation

### Instructions

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

<!--  -->

## Exercise: Bouncing ball

### Skills learned

* Show how to visualize data on a bag.
* Programmatic generation of images.
* Timestamps generation.

### Instructions

Create a program

    $ bag-bounce --fps ![fps] --speed ![speed]

that shows a bouncing ball on the screen, as if it were a billiard

### Useful new API learned {nonumber=1}

* Our API for command line arguments.

## Exercise: Visualizing data on image

### Skills learned

* Show how to superimpose data on an image.


### Instruction

Write an implementation of `bag-mark-spots`.

### Specification for `bag-mark-spots`

Create a program that for each image, finds the pixels that are closest
to a certain color, and creates as the output a big red, yellow white spot on them.

    $ bag-mark-spots --input ![bag in] --mark "[[255,0,0],255,0,0]," --size 5 --output [bag out]


<!--  -->

## Exercise: Make that into a node

### Learned skills

* Abstracting code in interfaces that can be reused.
* Launch files.

### Instructions

Abstract the analysis above in a way that the same analysis code can be run equally
from a bag or on the laptop.

Make a ROS node and two launch files:

* One runs everything on the Duckiebot, and the output is visualized on the laptop.
* One runs the processing on the laptop.


<!--  -->

## Exercise: Instagram with EasyAlgo interface

### Learned skills

* Use of our Duckietown API for abstracting algorithms.

### Instructions

TODO: Do the above using our API for filters.

We define the interface `InstagramFilter` and the EasyAlgo configuration files.

### See documentation

TODO: pointer to EasyAlgo

### Use in your code

Write a node using the EasyNode framework that decides which filters to run
given the configuration.

TODO: Also introduce the DUCKIETOWN_CONFIG_SEQUENCE.




## Milestone: Illumination invariance (anti-instagram)

TODO: Make them run our code, and also visualize what's going on


<!--  -->



## Exercise: Launch files basics


### Learned skills

* Launch files



<!--  -->


## Exercise: Unit tests


### Learned skills

* Write unit tests that can be integrated in our framework.

### Unit tests with nosetests

- Unit tests

### Unite tests with ROS tests

- Integration with ROS tests

### Unite tests with comptests


## Exercise: Parameters (standard ROS api)

### Learned skills

- Reading parameters
- Dynamic modification of parameters

## Exercise: Parameters (our API)

### Learned skills

- Use Duckietown API


## Exercise: Place recognition abstraction

### Learned skills

- ...


### Instructions

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


### Bottom line

TODO: to write


## Exercise: Parallel processing

### Learned skills

* Do things faster in parallel.

### Instructions

We introduce the support for parallel processing that we have in the APIs.


## Exercise: Adding new test to integration tests

TODO: to write

### Learned skills

* Do things faster in parallel.

### Instructions

TODO: to write

### Bottom line

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
