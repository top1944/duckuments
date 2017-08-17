
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

The above was written as in [](#code:latex-code).

<pre figure-id="code:latex-code" figure-caption='Use of LaTeX code.'>
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


## LaTeX symbols

The LaTeX symbols definitions are in a file called [`docs/symbols.tex`][symbols].


[symbols]: https://github.com/duckietown/duckuments/blob/master/docs/symbols.tex


Put all definitions there; if they are centralized it is easier to check
that they are coherent.

## Variables in command lines and command output

Use the syntax "<code><span>!</span>[name]</code>" for describing the variables in the code.

<div class="example" markdown="1">

For example, to obtain:

    $ ssh ![robot name].local

Use the following:

<pre><code>
For example, to obtain:

    &#36; ssh <span>!</span>[robot name].local</code>
</pre>

</div>

Make sure to quote (with 4 spaces) all command lines.
Otherwise, the dollar symbol
confuses the LaTeX interpreter.



## Character escapes

Use the string <q><code>&amp;#36;</code></q> to write the dollar symbol <q><code>&#36;</code></q>, otherwise it
gets confused with LaTeX math materials. Also notice that you should probably
use "USD" to refer to U.S. dollars.

Other symbols to escape are shown in [](#tab:escapes).

<col2 figure-id="tab:escapes" figure-caption="Symbols to escape">
    <s>use <code>&amp;#36;</code> </s> <s>instead of <code>&#36;</code></s>
    <s>use <code>&amp;#96;</code> </s> <s>instead of <code>&#96;</code></s>
    <s>use <code>&amp;#lt;</code> </s> <s>instead of <code>&lt;</code></s>
    <s>use <code>&amp;#gt;</code> </s> <s>instead of <code>&gt;</code></s>
</col2>


## Keyboard keys

Use the `kbd` element for keystrokes.

<div class="example" markdown="1">

For example, to obtain:

> Press <kbd>a</kbd> then <kbd>Ctrl</kbd>-<kbd>C</kbd>.

use the following:

    Press <kbd>a</kbd> then <kbd>Ctrl</kbd>-<kbd>C</kbd>.

</div>

## Figures

For any element, adding an attribute called `figure-id`
with value `fig:![figure ID]` or `tab:![table ID]`
will create a figure that wraps the element.


For example:

    <div figure-id="fig:![figure ID]">
        ![figure content]
    </div>

It will create HMTL of the form:

    <div id='fig:code-wrap' class='generated-figure-wrap'>
        <figure id='fig:![figure ID]' class='generated-figure'>
            <div>
                ![figure content]
            </div>
        </figure>
    </div>

<!--
To add a class to the figure, use `figure-class`:

    <div figure-id="fig:code" figure-class="myclass">
        ![figure content]
    </div>

This will give it to the <code>&lt;figure&gt;</code> and the containing <code>&lt;figure&gt;</code>


Useful classes:

* `float_bottom`

-->

To add a caption, add an attribute `figure-caption`:

    <div figure-id="fig:![figure ID]" figure-caption="This is my caption">
        ![figure content]
    </div>

Alternatively, you can put anywhere an element `figcaption` with ID `![figure id]:caption`:

    <element figure-id="fig:![figure ID]">
        ![figure content]
    </element>

    <figcaption id='fig:![figure ID]:caption'>
        This the caption figure.
    </figcaption>

To refer to the figure, use an empty link:

    Please see [](#fig:![figure ID]).

The code will put a reference to "Figure XX".


## Subfigures

You can also create subfigures, using the following syntax.

``` .html
<div figure-id="fig:big">
    <figcaption>Caption of big figure</figcaption>

    <div figure-id="subfig:first">
        <figcaption>Caption 1</figcaption>
        <p>Content of first subfig</p>
    </div>

    <div figure-id="subfig:second">
        <figcaption>Caption 2</figcaption>
        <p>Content of second subfig</p>
    </div>
</div>
```

<div figure-id="fig:big">
    <figcaption>Caption of big figure</figcaption>

    <div figure-id="subfig:first">
        <figcaption>Caption 1</figcaption>
        <p>Content of first subfig</p>
    </div>

    <div figure-id="subfig:second">
        <figcaption>Caption 2</figcaption>
        <p>Content of second subfig</p>
    </div>
</div>

## Shortcut for tables

The shortcuts `col2`, `col3`, `col4`, `col5`
are expanded in tables with 2, 3, 4 or 5 columns.

The following code:

<pre>
<code>
&lt;col2 figure-id="tab:mytable" figure-caption="My table"&gt;
    &lt;span&gt;A&lt;/span&gt;
    &lt;span&gt;B&lt;/span&gt;
    &lt;span&gt;C&lt;/span&gt;
    &lt;span&gt;D&lt;/span&gt;
&lt;/col2&gt;
</code>
</pre>

gives the following result:

<col2 figure-id="tab:mytable" figure-caption="My table">
    <span>A</span>
    <span>B</span>
    <span>C</span>
    <span>D</span>
</col2>

### `labels-row1`  and `labels-row1`

Use the classes `labels-row1`  and `labels-row1` to make pretty tables like the following.

`labels-row1`: the first row is the headers.

`labels-col1`: the first column is the headers.

<col4 figure-id="tab:mytable-col1" class="labels-col1">
    <figcaption>Using <code>class="labels-col1"</code></figcaption>
    <span>header A </span>
    <span>B</span>
    <span>C</span>
    <span>1</span>
    <span>header D</span>
    <span>E</span>
    <span>F</span>
    <span>2</span>
    <span>header G</span>
    <span>H</span>
    <span>I</span>
    <span>3</span>
</col4>

<col3 figure-id="tab:mytable-row1" class="labels-row1">
    <figcaption>Using <code>class="labels-row1"</code></figcaption>
    <span>header A</span>
    <span>header B</span>
    <span>header C</span>
    <span>D</span>
    <span>E</span>
    <span>F</span>
    <span>G</span>
    <span>H</span>
    <span>I</span>
    <span>1</span>
    <span>2</span>
    <span>3</span>
</col3>

## Linking to documentation from inside and outside the documentation

### Establishing names of headers {#establishing}

You give IDs to headers using the format:

    ### ![header title] {#![topic ID]}

For example, for this subsection, we have used:

    ### Establishing names of headers {#establishing}

With this, we have given this header the ID "`establishing`".

### Linking from the documentation to the documentation

You can use the syntax:

    [](#![topic ID])

to refer to the header.

You can also use some slightly more complex syntax that also allows
to link to only the name, only the number or both ([](#tab:link-examples)).

<col1 figure-id="tab:link-examples" figure-caption="Syntax for referring to sections.">
    <s><code>See [](#establishing).</code></s>
    <s>See <a href="#establishing"></a></s>
    <code>See &lt;a class="only_name" href="#establishing"&gt;&lt;/a&gt;.</code>
    <s>See <a class="only_name" href="#establishing"></a>.</s>
    <code>See &lt;a class="only_number" href="#establishing"&gt;&lt;/a&gt;.</code>
    <s>See <a class="only_number" href="#establishing"></a>.</s>
    <code>See &lt;a class="number_name" href="#establishing"&gt;&lt;/a&gt;.</code>
    <s>See <a class="number_name" href="#establishing"></a>.</s>
</col1>





<style>
#tab\:link-examples td {
    text-align: left;
}
</style>

### Linking to the documentation from outside the documentation

You are encouraged to put links to the documentation from the code or scripts.

To do so, use links of the form:

    http://purl.org/dth/![topic ID]

Here "`dth`" stands for "Duckietown Help". This link will get redirected to
the corresponding document on the website.

For example, you might have a script whose output is:

    $ rosrun mypackage myscript
    Error. I cannot find the scuderia file.
    See: http://purl.org/dth/scuderia

When the user clicks on the link, they will be redirected to [](#scuderia).
