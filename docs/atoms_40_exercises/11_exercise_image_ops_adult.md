# Exercise: Basic image operations, adult version  {#exercise-specifications status=beta}

## Skills learned

- Dealing with exceptions.
- Conventions of exit conditions.
- Unit tests.

## Instructions

Implement the program specified in the following section.

This time, we specify exactly what should happen for various conditions. This allows to do automated testing of the script.


## `image-ops` specification {#image-ops-specification}

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

TODO: Some useful functions that you might want to use are:

- ...

## Testing it works with `image-ops-tester` {#image-ops-tester-specification}

We provide a script called `image-ops-tester` that can be used
to make sure that you wrote a conformant `image-ops`.

Use it as follows:

    $ image-ops-tester ![candidate-image-ops]

If the script cannot be found, `image-ops-tester` will return 1.

`image-ops-tester` will return 0 if the program exists and conforms
to the `image-ops` specification ([](#image-ops-specification)).

If it can establish that the program is not good, it will return 11.


## Bottom line {nonumber=1}

Things that are not tested are broken.
