# Exercise: Basic image operations, adult version  {#exercise-specifications status=beta}

Assigned: Andrea Daniele

## Skills learned

- Dealing with exceptions.
- Using exit conditions.
- Verification and unit tests.

## Instructions

Implement the program `dt-image-flip` specified in the following section.

This time, we specify exactly what should happen for various anomalous conditions.
This allows to do automated testing of the program.


## `dt-image-flip` specification {#image-ops-specification}

The program `image-ops` expects exactly two arguments: a filename (a JPG file)
and a directory name.

    $ dt-image-flip ![file] ![outdir]

If the file does not exist, the script must exit with error code `2`.

If the file cannot be decoded, the script must exit with error code `3`.

If the file exists, then the script must create:

- `![outdir]/regular.jpg`: a copy of the initial file
- `![outdir]/flip.jpg`: the file, flipped vertically.
- `![outdir]/side-by-side.jpg`: the two files, side by side.

If any other error occurs, the script should exit with error code `99`.

<div figure-id="fig:example" figure-class="flow-subfigures">
    <img figure-id="subfig:original" src='image-ops-original.jpg'/>
    <img figure-id="subfig:flip"     src='image-ops-flip.jpg'/>
    <img figure-id="subfig:side"     src='image-ops-side.jpg'/>
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
#fig\:example img {
    height: 5em;
    margin-left: 2em;
    margin-right: 2em;
}
</style>


## Useful APIs

### Images side-by-side

Comment: Good explanation, but shouldn't it go in the previous exercise? -AC

An image loaded using the OpenCV function
[`imread`](http://docs.opencv.org/2.4/modules/highgui/doc/reading_and_writing_images_and_video.html#imread)
is stored in memory as a
[NumPy array](https://docs.scipy.org/doc/numpy-1.13.0/reference/arrays.html).
For example, the image shown above ([](#subfig:original)) will be represented in
memory as a NumPy array with shape `(96, 96, 3)`. The first dimension indicates
the number of pixels along the `Y-axis`, the second indicates the number of pixels
along the `X-axis` and the third is known as *number of channels* (e.g., **R**ed,
**G**reen, and **B**lue).

Comment: Are we sure it is RGB and not BGR? -AC

NumPy provides a utility function called
[`concatenate`][concatenate]
that joins a sequence of arrays along a given axis.

[concatenate]: https://docs.scipy.org/doc/numpy/reference/generated/numpy.concatenate.html

## Testing it works with `image-ops-tester` {#image-ops-tester-specification}

We provide a script called `image-ops-tester` that can be used
to make sure that you wrote a conforming `dt-image-flip`.
The script `image-ops-tester` is in the directory
[`/exercises/dt-image-flip/image-ops-tester`](https://github.com/duckietown/duckuments/tree/master/exercises/dt-image-flip/image-ops-tester)
in the [`duckietown/duckuments`](https://github.com/duckietown/duckuments)
repository.


Use it as follows:

    $ image-ops-tester ![candidate-program]
    
    
Note: The tester script must be called from its own location. Make sure to change your working directory to
`/exercises/dt-image-flip/image-ops-tester` before launching the tester script.


If the script cannot be found, `image-ops-tester` will return 1.

`image-ops-tester` will return 0 if the program exists and conforms
to the specification ([](#image-ops-specification)).

If it can establish that the program is not good, it will return 11.


## Bottom line {nonumber=1}

Things that are not tested are broken.
