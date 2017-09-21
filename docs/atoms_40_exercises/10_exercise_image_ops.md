# Exercise: Basic image operations {#exercise-basic-image status=beta}


## Skills learned

- Command line arguments.
- Read and write files.
- Image representations (pixels, etc.)
- OpenCV/`duckietown_utils` API for reading/writing images.


## Instructions

Create an implementation of the program `dt-image-flip` described below.

If this exercise is too easy for you, skip to [](#exercise-specifications).


## Definition

Create a program `dt-image-flip` that takes as an argument a JPG file:

    $ dt-image-flip ![file]

and creates a file called `![file].flipped.jpg` that is flipped around the vertical axis.


<div figure-id="fig:example1" figure-class="flow-subfigures">
    <img figure-id="subfig:original1" src='image-ops-original.jpg'/>
    <img figure-id="subfig:flip1"     src='image-ops-flip.jpg'/>
</div>

<figcaption id="fig:example:caption">
Example input-output for the program <code>dt-image-flip</code>.
</figcaption>

<figcaption id="subfig:original1:caption">
The original picture.
</figcaption>

<figcaption id="subfig:flip1:caption">
The flipped output
</figcaption>




## Useful APIs

TODO: add here pointers to relevant `duckietown_utils` functions
