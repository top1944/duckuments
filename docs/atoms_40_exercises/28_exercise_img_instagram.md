# Exercise: Instagram filters  {#exercise-instagram status=beta}

## Skills learned

* Image pixel representation;
* Image manipulation;
* The idea that we can manipulate operations as objects, and refer to them. (higher-order computation);
* The idea that we can compose operations, and sometimes the operations commute,
  sometimes not.

## Instructions

Create `dt-instagram` as specified below.

## Specification for `dt-instagram`

Write a program `dt-instagram` that applies a filter to an image.

The syntax to invoke the program is:

    $ dt-instagram ![image in] ![filters] ![image out]

where:

- `![image in]` is the input image;
- `![filters]` is a string, which is a colon-separated list of filters;
- `![image out]` is the output image.

The list of filters is given in [](#instagram-filters).

For example, the result of the command:

    $ dt-instagram image.jpg flip-horizontal:grayscale out.jpg

is that `out.jpg` contains the input image, flipped and than converted to grayscale.

Because these two commute, this command gives the same output:

    $ dt-instagram image.jpg grayscale:flip-horizontal out.jpg



### List of filters {#instagram-filters}

Here is the list of possible values for the filters, and their effect:

- `flip-vertical`: flips the image vertically
- `flip-horizontal`: flips the image horizontally
- `grayscale`: Makes the image grayscale
- `sepia`: make the image sepia

TODO: add more fun filters
