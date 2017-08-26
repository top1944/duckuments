# Duckietown Git conventions {#git-conventions}


These are the conventions for the Duckietown repositories.


## Continuous integration: tests must always succeed

The `Software` and the `duckuments` repository use "continuous integration".

This means that there are well-defined tests that must pass at all times.


For the `Software` repository, the tests involve building the repository and running unit tests.

For the `duckuments` repository, the tests involve trying to build the documentation using `make compile`.


We say that a branch is "green" if the tests pass. At all times, you can see this
as a green dot in different places on Github ([](#fig:green-dot)).

<img  figure-id="fig:green-dot" src='green-dot.png' style='width:12em'/>


The system enforces the constraint that the branch `master` is always green,
by preventing changes to the branches that make the tests fail.

This works as follows.

We use a service called CircleCI. This  service continuously looks at our
repositories. Whenever there is a change, it downloads the repositories and runs the tests.

(It was a lot of fun to set up all of this, but fortunately you do not need to know how it is done.)


At [this page](https://circleci.com/gh/duckietown) you can see the summary of the tests.
(You need to be logged in with your Github account and click "authorize Github").

Y

The `master` branch is always "green", which means that the continuous integration tests pass.


## Pushing to `master`

It is not possible to push on to the master branch directly.

What you need to do is work on your branch, push that branch, and then merge your work using a pull request.

Github will let you merge the pull request only if the tests pass.


See: [Github documentation](https://help.github.com/articles/about-pull-request-merges/).


# Continuous integration {#continuous-integration}

Assigned: Andrea

## Create a CircleCI account

TODO

## See the status of a build

[See here][build] to monitor the status of a build.


[build]: https://circleci.com/gh/duckietown

## Implementation

TODO
