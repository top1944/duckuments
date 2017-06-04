
# Features of the documentation writing system {#sec:documentation-manual}

## Embedded LaTeX

You can use $\LaTeX$ math, environment, and references. For example, take a look at

\[
    x^2 = \int_0^t f(\tau)\ \text{d}\tau
\]

or refer to [](#prop:example).

\begin{proposition}[Proposition example]\label{prop:example}
This is an example proposition: $2x = x + x$.
\end{proposition}
     
The above was written as in [](#fig:code).

<pre figure-id="fig:code" figure-caption='Use of LaTeX code.'>
You can use &#36;\LaTeX&#36; math, environment, and references.
For example, take a look at

&#92;[
    x^2 = \int_0^t f(\tau)\ \text{d}\tau
&#92;]

or refer to [](#prop:example).

&#92;begin{proposition}[Proposition example]&#92;label{prop:example}
This is an example proposition: &#36;2x = x + x&#36;.
&#92;end{proposition}
</pre>

TODO: other LaTeX features supported


## Other interesting features

TODO: to write
