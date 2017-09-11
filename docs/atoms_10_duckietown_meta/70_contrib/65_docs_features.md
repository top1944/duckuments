# Basic features of the documentation writing system {#documentation-manual status=ready}

The Duckiebook is written in a Markduck, a Markdown dialect.

It supports many features that make it possible to create
publication-worthy materials.


## Markdown

The Duckiebook is written in a Markdown dialect.

See: [A tutorial on Markdown][tutorial].

[tutorial]: https://www.markdowntutorial.com/



## Variables in command lines and command output

Use the syntax "<code><span>!</span>[name]</code>" for describing the variables in the code.

<div class="example-usage" markdown="1">

For example, to obtain:

    $ ssh ![robot name].local

Use the following:

<pre trim="1">
<code trim="1">
For example, to obtain:

    &#36; ssh <span>!</span>[robot name].local

</code>
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

<div class="example-usage" markdown="1">

For example, to obtain:

> Press <kbd>a</kbd> then <kbd>Ctrl</kbd>-<kbd>C</kbd>.

use the following:

    Press <kbd>a</kbd> then <kbd>Ctrl</kbd>-<kbd>C</kbd>.

</div>

## Figures {#figures}

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

```html
<div figure-id="fig:big">
    <figcaption>Caption of big figure</figcaption>

    <div figure-id="subfig:first" figure-caption="Caption 1">
        <p style='width:5em;height:5em;background-color:#eef'>first subfig</p>
    </div>

    <div figure-id="subfig:second" figure-caption="Caption 2">
        <p style='width:5em;height:5em;background-color:#fee'>second subfig</p>
    </div>
</div>
```

This is the result:

<div figure-id="fig:big">
    <figcaption>Caption of big figure</figcaption>

    <div figure-id="subfig:first" figure-caption="Caption 1">
        <p style='width:5em;height:5em;background-color:#eef'>first subfig</p>
    </div>

    <div figure-id="subfig:second" figure-caption="Caption 2">
        <p style='width:5em;height:5em;background-color:#fee'>second subfig</p>
    </div>
</div>

By default, the subfigures are displayed one per line.

To make them flow horizontally, add `figure-class="flow-subfigures"` to the external figure `div`. Example:

<div figure-id="fig:big2" figure-class="flow-subfigures">
    <figcaption>Caption of big figure</figcaption>

    <div figure-id="subfig:first2" figure-caption="Caption 1">
        <p style='width:5em;height:5em;background-color:#eef'>first subfig</p>
    </div>

    <div figure-id="subfig:second2" figure-caption="Caption 2">
        <p style='width:5em;height:5em;background-color:#fee'>second subfig</p>
    </div>
</div>

## Embedding Latex in Figures

To embed latex in your figures, you can add it directly to a file and save it as `![filename].svg` file and save anywhere in the `/docs` directory.
You can run:

    $ make process-svg-figs

And your svg The file will be compiled into a PDF figure with the LaTeX commands properly interpreted.
You can then include the pdf file as normal way (See [](#figures)) using the `![filename].pdf` as the filename in the `img` tag.


<div figure-id="fig:inkscape">
    <figcaption>Embedding LaTeX in images</figcaption>

    <div figure-id="subfig:1">
        <figcaption>Image saved as svg</figcaption>
          <img src="sample-no-process.converted.png" style='width: 20em'/>
    </div>
    <div figure-id="subfig:2">
        <figcaption>Image as PDF after processing</figcaption>
          <img src="sample.pdf" style='width: 20em'/>
    </div>
</div>


Note: in order to compile the figures into pdfs you need to have Inkscape installed. Instructions to download and install are [here](https://inkscape.org/en/release/0.92.2/).

It can take a bit of work to get the positioning of the code to appear properly on the figure.

## Shortcut for tables

The shortcuts `col2`, `col3`, `col4`, `col5`
are expanded in tables with 2, 3, 4 or 5 columns.

The following code:

<pre trim="1">
<code trim="1">
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

## Linking to documentation {#linking-to-documentation}

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
    <pre><code>See [](#establishing).</code></pre>
    <s>See <a href="#establishing"></a></s>
    <pre><code>See &lt;a class="only_name" href="#establishing"&gt;&lt;/a&gt;.</code></pre>
    <s>See <a class="only_name" href="#establishing"></a>.</s>
    <pre><code>See &lt;a class="only_number" href="#establishing"&gt;&lt;/a&gt;.</code></pre>
    <s>See <a class="only_number" href="#establishing"></a>.</s>
    <pre><code>See &lt;a class="number_name" href="#establishing"&gt;&lt;/a&gt;.</code></pre>
    <s>See <a class="number_name" href="#establishing"></a>.</s>
</col1>

<style>
#tab\:link-examples td {
    text-align: left;
    display: block;
    margin-bottom: 5pt;
}

#tab\:link-examples tr:nth-child(2n+1) td {
    margin-bottom: 5pt;
}
#tab\:link-examples tr:nth-child(2n) td {
    margin-bottom: 15pt;
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

## Embedding videos {#embedding-videos}

It is possible to embed Vimeo videos in the documentation.

Note: Do not upload the videos to your personal Vimeo account; they must all be
posted to the Duckietown Engineering account.

This is the syntax:

    <dtvideo src="vimeo:![vimeo ID]"/>

<div class="example-usage" markdown="1">

For example, this code:

    <div figure-id="fig:example-embed">
        <figcaption>Cool Duckietown by night</figcaption>
        <dtvideo src="vimeo:152825632"/>
    </div>

produces this result:

 <div figure-id="fig:example-embed">
    <figcaption>Cool Duckietown by night</figcaption>
    <dtvideo src="vimeo:152825632"/>
 </div>

</div>


Depending on the output media, the result will change:

* On the online book, the result is that a player is embedded.
* On the e-book version, the result is that a thumbnail is produced, with a link to the video;
* On the dead-tree version, a thumbnail is produced with a QR code linking to the video (TODO).



## `move-here` tag {#move-here}

If a file contains the tag `move-here`, the fragment pointed
by the `src` attribute is moved at the place of the tag.

This is used for autogenerated documentation.

Syntax:

    # Node `node`

    <move-here src='#package-node-autogenerated'/>

## Comments

You can insert comments using the HTML syntax for comments:
any text between "<code>&lt;!--</code>" and "<code>--&gt;</code>" is ignored.

<pre trim="1">
<code trim="1">
# My section

&lt;!-- this text is ignored --&gt;

Let's start by...
</code>
</pre>






## Referring to Github files


You can refer to files in the repository by using:

    See [this file](github:org=![org],repo=![repo],path=![path],branch=![branch]).

The available keys are:

- `org` (required): organization name (e.g. `duckietown`);
- `repo` (required): repository name (e.g. `Software`);
- `path` (required): the filename. Can be just the file name or also include directories;
- `branch` (optional) the repository branch; defaults to `master`;


For example, you can refer to [the file `pkg_name/src/subscriber_node.py`][link1] by using the following syntax:

[link1]: github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py

    See [this file](github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py)

You can also refer to a particular line:

This is done using the following parameters:

- `from_text` (optional): reference the first line containing the text;
- `from_line` (optional): reference the line by number;


For example, you can refer to [the line containing "Initialize"][link2]
of `pkg_name/src/subscriber_node.py` by using the following syntax:

[link2]: github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py,from_text=Initialize


    For example, you can refer to [the line containing "Initialize"][link2]
    of `pkg_name/src/subscriber_node.py` by using the following syntax:

    [link2]: github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py,from_text=Initialize


You can also reference a range of lines, using the parameters:

- `to_text` (optional): references the final line, by text;
- `to_line` (optional): references the final line, by number.

You cannot give `from_text` and `from_line` at the same time.
You cannot give a `to_...` without the `from_...`.

For example, [this link refers to a range of lines][interval]: click it to see how Github highlights the lines from "Initialize" to "spin".

[interval]: github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py,from_text=Initialize,to_text=spin

This is the source of the previous paragraph:

    For example, [this link refers to a range of lines][interval]: click it to see how Github highlights the lines from "Initialize" to "spin".

    [interval]: github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py,from_text=Initialize,to_text=spin


## Putting code from the repository in line

In addition to referencing the files, you can also copy the contents of a file inside the documentation.

This is done by using the tag `display-file`.

For example, you can put a copy of `pkg_name/src/subscriber_node.py` using:

    <display-file src="
        github:org=duckietown,
        repo=Software,
        path=pkg_name/src/subscriber_node.py
    "/>

and the result is the following automatically generated listing:

<display-file src="github:
    org=duckietown,
    repo=Software,
    path=pkg_name/src/subscriber_node.py
"/>

If you use the `from_text` and `to_text` (or `from_line` and `to_line`), you can actually display part of a file. For example:

    <display-file src="
        github:org=duckietown,
        repo=Software,
        path=pkg_name/src/subscriber_node.py,
        from_text=Initialize,
        to_text=spin
        "/>

creates the following automatically generated listing:

<display-file src="github:org=duckietown,
repo=Software,
path=pkg_name/src/subscriber_node.py,
from_text=Initialize,
to_text=spin"/>


## Reporting problems

Please report problems with the duckuments using [the `duckuments` issue tracker][tracker].
If it is urgent, please tag people (Andrea); otherwise these are processed in batch mode every few days.

[tracker]: https://github.com/duckietown/duckuments/issues


If you have a problem with a generated PDF, please attach the offending PDF.

If you say something like "This happens for Figure 3", then it is hard
to know which figure you are referencing exactly, because numbering changes
from commit to commit.

If you want to refer to specific parts of the text, please commit all your work on your branch,
and obtain the name of the commit using the following commands:

    $ git -C ~/duckuments rev-parse HEAD      # commit for duckuments
    $ git -C ~/duckuments/mcdp rev-parse HEAD # commit for mcdp



## Common mistakes with Markdown {#common-markdown-mistakes}

Here are some common mistakes encountered.

### Not properly starting a list {#invalid-list}

There must be an empty line before the list starts.

This is correct:

    I want to learn:

    - robotics
    - computer vision
    - underwater basket weaving

This is incorrect:

    I want to learn:
    - robotics
    - computer vision
    - underwater basket weaving

and it will be rendered as follows:

I want to learn:
- robotics
- computer vision
- underwater basket weaving
