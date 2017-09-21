# Exercise: Bag in, bag out {#exercise-bag-in-out status=beta}

## Skills learned

* Processing the contents of a bag to produce another bag.

## Instructions

Implement the program `bag-decimate` as in the following specification.
 

## Bag decimate

The program `dt-bag-decimate` takes as argument a bag filename, an integer value
greater than zero,
and an output bag file:

    $ dt-bag-decimate "![input bag]" ![n] "![output bag]"

The output bag contains the same topics as the input bag, however, only 1 in
`n` messages are written.  (If `n` is 1, the output is the same as the input.)


## Useful new APIs

* To open a file for writing: XXX


## Check that it works

To check that the program works, you can compute the statistics
of the data using the program `dt-bag-analyze` that you have created
in [](#exercise-bag-analysis).
You should see that the statistics have changed.

<!--  -->
