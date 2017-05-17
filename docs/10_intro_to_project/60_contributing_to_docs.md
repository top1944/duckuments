# Contributing to this documentation

## Where the documentation is

All the documentation is in the repository [duckietown/duckuments][repo].

[repo]: https://github.com/duckietown/duckuments

The documentation is written as a series of small files in Markdown format.

The output is:

- a publication-quality PDF;
- HTML (single-page);
- HTML (multiple pages).


## Editing links

The simplest way to contribute to the documentation is
to click any of the "✎" icons next to the headers.

They link to the "edit" page in Github. There, one can make and commit the edits in only a few seconds.

## Comments

In the multiple-page version, each page also includes a comment box
powered by a service called Disqus. This provides a way for people
to write comments with a very low barrier. (We would periodically remove the comments.)

## Compiling the documentation

TODO: Write instructions - it's "make all" but the dependencies
are complicated.

## Deploying the documentation

TODO: Write instructions

# Features of the documentation writing system


## Embedded LaTeX

You can use $\LaTeX$ math, environment, and references.

For example, take a look at \eqref{eq:one}

$$
    x^2 = \int_{0}^{t} f(\tau) \text{d}\tau, \label{eq:one}
$$

or refer to \prettyref{prop:example}.

\begin{proposition}[Proposition example]\label{prop:example}
This is an example proposition.
\end{proposition}

TODO: other LaTeX features supported

## Other interesting features

TODO: to write
