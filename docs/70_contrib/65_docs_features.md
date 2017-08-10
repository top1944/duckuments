
# Features of the documentation writing system {#sec:documentation-manual}

The Duckiebook is written in a Markdown dialect. A subset of LaTeX is supported.

There are also some additional features that make it possible to create
publication-worthy materials.




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

TODO: Use `#[description]` for parameters in code



Make sure to quote (with 4 spaces) all command lines. Otherwise, the dollar symbol
confuses the LaTeX interpreter.

### Tables


### Shortcut for tables

The shortcuts `col2`, `col3`, `col4`, `col5`
are expanded in tables with 2, 3, 4 or 5 columns.

~~~
<col2>
    <span>A</span>
    <span>B</span>
    <span>C</span>
    <span>D</span>
</col2>
~~~


### Creating figures

For any element, adding an attribute called `figure-id`
with contents `fig:![figure ID]` or `tab:![table ID]`
will create a figure that wraps the element.


For example:

    <p figure-id="fig:code">
        I will be the content of a figure.
    </p>

It will create HMTL of the form:

    <div id='fig:code-wrap' class='generated-figure-wrap'>
        <figure id='fig:code' class='generated-figure'>
            <p figure-id="fig:code">
                I will be the content of a figure.
            </p>
        </figure>
    </div>

To add a class to the figure, use `figure-class`:

    <element figure-id="fig:code" figure-class="myclass">
        content
    </element>

This will give it to the <code>&lt;figure&gt;</code> and the containing <code>&lt;figure&gt;</code>
<!--

Useful classes:

* `float_bottom` -->

To add a caption, add an attribute `figure-caption`:

    <element figure-id="fig:code" figure-caption="This is my caption">
        content
    </element>

Alternatively, you can put anywhere an element `figcaption` with ID `![figure id]:caption`:

    <element figure-id="fig:code">
        content
    </element>

    <figcaption id='fig:code:caption'>
        This is my caption. Can contain <code>code</code>.
    </figcaption>



## Character escapes


Use the string `&#36;` to write the dollar symbol &#36;, otherwise it
gets confused with LaTeX math materials. Also notice that you should probably
use "USD" to refer to U.S. dollars

Other symbols to escape:

* use `&#96;` instead of &#96;
* use `&#36;` instead of &#36;
* use `&lt;` instead of &lt;
* use `&gt;` instead of &gt;

## Troubleshooting

Symptom: "Invalid XML"

Resolution: "Markdown" doesn't mean that you can put anything in a file. Except
for the code blocks, it must be valid XML. For example, if you use "&gt;" and
"&lt;" without quoting, it will likely cause a compile error.

Symptom: "Tabs are evil"

Resolution: Do not use tab characters. The error message in this case is quite
helpful in telling you exactly where the tabs are.


Symptom: The error message contains `ValueError: Suspicious math fragment 'KEYMATHS000ENDKEY'`

Resolution: You probably have forgotten to indent a command line by at least 4 spaces. The dollar in the command line is now being confused for a math formula.
