# Contributing to this documentation

## Where the documentation is

All the documentation is in the repository [duckietown/duckuments][repo].

[repo]: https://github.com/duckietown/duckuments

It is written in a series of small files in Markdown format.

Some magic code reads them and assembles them into this book.

## Editing links

The simplest way to contribute to the documentation is
to click any of the "✎" icons next to the headers.

They link to the "edit" page in Github. There, one
can make and commit the edits in only a few seconds.

## Compiling the new version

TODO: Write instructions - it's "make all" but the dependencies
are complicated.

## Feature: embedded LaTeX

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
