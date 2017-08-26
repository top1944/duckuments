# Duckietown Git conventions {#git-conventions}


These are the conventions for the Duckietown repositories.


## Never break the build

The `Software` and the `duckuments` repository use "continuous integration".

This means that there are well-defined tests that must pass at all times.

For the `Software` repository, the tests involve building the repository and running unit tests.

For the `duckuments` repository, the tests involve trying to build the documentation using `make compile`.

If the tests do not pass, then we say that we have "broken the build".

We also say that a branch is "green" if the tests pass, or "red" otherwise.

At all times, you can see this
as a green dot in different places on Github ([](#fig:green-dot)).

<img  figure-id="fig:green-dot" src='green-dot.png' style='width:12em'/>

## How to stay in the green

The system enforces the constraint that the branch `master` is always green,
by preventing changes to the branches that make the tests fail.

We use a service called CircleCI. This service continuously looks at our
repositories. Whenever there is a change, it downloads the repositories and runs the tests.

(It was a lot of fun to set up all of this, but fortunately you do not need to know how it is done.)

At [this page](https://circleci.com/gh/duckietown) you can see the summary of the tests.
(You need to be logged in with your Github account and click "authorize Github").

<img figure-id="fig:circleci" figure-caption="The CircleCI service" src='circleci-screenshot.png' style='width: 70%'/>

## How to make changes to `master`

It is not possible to push on to the master branch directly.

The workflow is as follows:

1. You have a private branch, say `andrea-devel`.
2. You work on your branch.
3. Push often to your branch. Every time you push, CircleCI will run the tests and let you know if the tests are passing.
4. When the tests pass, you create a "pull request". You can do this by going to the Github page for your branch and click 

 push that branch, and then merge your work using a pull request.

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
