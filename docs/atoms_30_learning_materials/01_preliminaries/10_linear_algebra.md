# Linear algebra {#linear_algebra}

TODO: This Section is work in progress.

Assigned: Jacopo

<!--Start with a brief introduction of the discussed topic, describing its place in the bigger picture, justifying the reading constraints/guidelines below. Write it as if the reader knew the relevant terminology. -->

Linear algebra provides the set of mathematical tools to (a) study linear relationships and (b) describe linear spaces. It is a field of mathematics with important ramifications.

Linearity is an important concept because it is powerful in describing the input-output behaviour of many natural phenomena (or _systems_). As a matter of fact, all those systems that cannot be modeled as linear, still can be approximated as linear to gain an intuition, and sometimes much more, of what is going on.

So, in a way or the other, linear algebra is a starting point for investigating the world around us, and Duckietown is no exception.

Note: This chapter is not intended to be a comprehensive compendium of linear algebra.

See: this reference

See also: this other reference

TODO: add references

<!--(Dear Santa, I would like class='required-preliminaries' here) -->
<div class='requirements' markdown="1">

Knowledge necessary:

<!--Required Reading: Insert here a list of topics and suggested resources related to _necessary_ knowledge in order to understand the content presented. Example: -->

Requires: Real numbers are complex for you?: Number theory [addref]()

Requires: $\forall$ is a typo for A and $\in$ are Euros? [Mathematical symbolic language](k:basic-math-notation).

</div>
TODO: find appropriate references and fill in above

<!--(Dear Santa, I would like class='recommended-preliminaries' here)
<div class="requirements" markdown="1">

Suggested Reading: Insert here a list of topics and suggested resources related to _recommended_ knowledge in order to better understand the content presented. Example:

Recommended: Definitions of Stability, Performances and Robustness: [](#bib:placeholder), ...

</div>
-->

## Problem Definition {#theory-chapter-template-problem-def}

Comment: Is it really a "problem" definition?

In this section we discuss vectors, matrices and linear spaces along with their properties.

Before introducing the these arguments, we need to formally define what we mean by linearity. The word _linear_ comes from the latin _linearis_, which means _pertaining to or resembling a line_. You should recall that a line can be represented by an equation like $y = mx + q$, but here we intend linearity as a property of maps, so there is a little more to linearity than lines (although lines _are_ linear maps indeed).

To avoid confusions, let us translate the concept of linearity in mathematical language.

<!-- First, we define a _function_, as a mapping between _sets_.

\begin{definition}[Set]\label{def:set}
A set $\aset{X} = \{x_1, x_2, \dots\}$ is a well-defined collection of distinct _elements_, or _members_ of the set, $x_i$, $i = 1, 2, \dots$. For the time being, we assume elements to be numbers.
\end{definition}

\begin{definition}[Function]\label{def:function}
A function $f : \aset{X} \rightarrow \mathbb{Y}$ is a mapping between the sets $\aset{X}$ and $\mathbb{Y}$. For every input element $x \in \aset{X}$, the mapping will produce an output $y = f(x) \in \mathbb{Y}$.
\end{definition}

<div class="requirements" markdown="1">

Recommended: Functions can be classified by the nature of the relationship between inputs and outputs in: _injective_, _surjective_ or _bijective_ [add-ref]().

</div>
TODO: add references
-->

<!--<div id='def:function' class="definition latex_env" markdown="1">

A function $f : \aset{X} \rightarrow \mathbb{Y}$ is a mapping between the spaces $\aset{X}$ and $\mathbb{Y}$. For every input element $x \in \aset{X}$, the mapping will produce an output $y = f(x) \in \mathbb{Y}$.

</div> -->

\begin{definition}[Linearity]\label{def:linearity}
A function $f: \aset{X} \to \aset{Y}$ is linear when, $\forall x_i \in \aset{X}$, $i = \{1,2\}$, and $\forall a \in \reals$:

\begin{align}
f(ax_1) &= af(x_1), \label{eq:lin1} \quad \text{and:} \\
f(x_1 + x_2) &= f(x_1) + f(x_2) \label{eq:lin2}
\end{align}

\end{definition}

Condition \eqref{eq:lin1} is referred to as the property of _homogeneity_ (of order 1), while condition \eqref{eq:lin2} is referred to as _additivity_.

\begin{remark}[Superposition Principle]\label{rem:lin-superposition}
Conditions \eqref{eq:lin1} and \eqref{eq:lin2} can be merged to express the same meaning through:
\begin{align}
f(ax_1 + bx_2) = af(x_1) + bf(x_2), \forall x_i \in \aset{X}, i = \{1,2\}, \forall a,b \in \reals \label{eq:linearity}.
\end{align}
\end{remark}

This equivalent condition \eqref{eq:linearity} is instead referred to as _superposition principle_, which unveils the bottom line of the concept of linearity: adding up (equivalently, scaling up) inputs results in an added up (equivalently, scaled up) output.

<!--In this section we crisply define the problem object of this chapter. It serves as a very brief recap of exactly what is needed from previous atoms as well. E.g.

Let:

\begin{align}
\dot{\state}_t = A\state_t+Bu_t \\
y = C\state_t+Du_t              \label{eq:system}
\end{align}

 be the LTI model of the Duckiebot's plant, with $x \in \statesp$, $y \in \reals^p$ and $u \in \reals^m$. We recall ([Duckiebot Modeling]()) that:

\begin{align}
A &= \left[  \begin{array}{ccc} a_{11}  & \dots & a_{1n} \\ \vdots & \ddots & \vdots \\ a_{n1}  & \dots & a_{nn} \end{array} \right] \\
B &= \left[ b_1 \,\, \dots \,\, b_m \right]^T \\
C &=  \left[ c_1 \ \,\, \dots \,\, c_p \right] \\
D &= 0.
\end{align}

[...]

Remember you can use the `problem` environment of $\LaTeX$ to formally state a problem:

\begin{problem}[PID]\label{prob:label-prob}
Given a system \eqref{eq:system} and measurements of the output $\tilde{y}_t = y_t + n_t, n_t \~ \cal{N}(0,\sigma)$, find a set of PID coefficients that meet the specified requirements for:
- stability,
- performance,
- robustness.
\end{problem}

as shown in ([](#figure:the-bigger-picture)).

<div figure-id="fig:the-bigger-picture" figure-caption="A classical block diagram for PID control. We like to use a lot of clear figures in the Duckiebook.">
     <img src="placeholder.png" style='width: 15em'/>
</div>
-->

## Vectors {#theory-chapter-template-notions}

Let $n$ belong to the set of natural numbers $\nats$, i.e., $n \in \nats$, and let $a_i \in \reals$, $i = \{1, \dots, n\}$ be real coefficients. While $\reals$ is the set of real numbers, $\reals^n$ is the set of all $n$-tuples of real numbers.


Comment: I strongly suggest to avoid the engineering notation of considering
tuples as "column" vectors. -AC

\begin{definition}[Vector and components]\label{def:vector}

An $n$-dimensional $\textit{vector}$ is an $n$-tuple:

\begin{align} \label{eq:vector}
\textbf{v} = \left[ \begin{array}{c} v_1 \\ \vdots \\ v_n \end{array} \right] \in \reals^{n \times 1} \equiv \reals^n,
\end{align}

of _components_ $v_1, \dots, v_n \in \reals$.

\end{definition}

You can imagine a vector [](#fig:vector-breakdown) as a "directional _number_", or an arrow that starts a certain point and goes in a certain direction (in $\reals^n$). In this representation, the _number_ is the length of the arrow, or the _magnitude_ of the vector (sometimes referred to even as _modulus_, and it can be derived through the vector's components.

\begin{definition}[Length of a vector]\label{def:vec2norm}
We define the length, or _modulus_, of a vector $\textbf{v} \in \reals^n$ as:
\begin{align} \label{eq:vec2norm}
\|\textbf{v}\| = \sqrt{v_1^2 + \dots + v_n^2} \in \reals.
\end{align}
\end{definition}

\begin{remark}[2-norm]\label{rem:2norm}
Generally speaking, it is not always possible to define the length of a vector ([addref]()). But when it is possible (e.g., in [Hilbert spaces]()), and in Duckietown it always is, there are many ways to define it. The most common and intuitive definition is the _Euclidian-_ or _2-norm_, which is defined above in \eqref{eq:vec2norm}.
\end{remark}

We will discuss norms more in detail in [](#norms).

\begin{definition}[Unit vector]\label{def:unit-vector}
A unit vector, or _versor_, is a vector $\textbf{e}$ of of unit length:
\begin{align} \label{eq:unit-vector}
\|\textbf{e}\| = 1.
\end{align}
\end{definition}

Unit vectors are used to define the directions of the components of a vector, allowing for an algebraic rather than vectorial representation. As we will see in [](#vector-algebra), this will make the algebra of vectors more intuitive.

<div figure-id="fig:vector-breakdown" figure-caption="A vector, its components expressed as multiples of unit vectors.">
     <img src="placeholder.png" style='width: 15em'/>
</div>

<div class="example-usage" markdown="1">

Let $\textbf{v} \in \reals^3$ be a vector defined in the Cartesian space. Let, moreover, $(\textbf{i},\textbf{j},\textbf{k})^T$ be the versor of the Cartesian axis, i.e.:
\begin{align}\label{eq:example-vector-algebraic}
\textbf{i} &= [1,0,0]^T; \\
\textbf{j} &= [0,1,0]^T; \\
\textbf{k} &= [0,0,1]^T.
\end{align}
Then, a vector can be written equivalently in vector or algebraic form: $\textbf{v} = [v_1, v_2, v_3]^T = v_1\textbf{i} + v_2\textbf{j}+v_3\textbf{k}$. Unit vectors are sometimes explicitly denoted with a hat (`^`), e.g., $\hat{\textbf{i}}, \hat{\textbf{j}}, \hat{\textbf{k}}$.

</div>

\begin{remark}[Normalizing vectors]\label{rem:vector-normalizing}
Every vector can be made into a unit vector, or _normalized_, by dividing each of its components by the vector's magnitude:
\begin{align}\label{eq:vector-normalizing}
\hat{\textbf{v}} = \frac{\textbf{v}}{\|\textbf{v}\|} = \left[\frac{v_1}{\|\textbf{v}\|}, \frac{v_2}{\|\textbf{v}\|}, \frac{v_3}{\|\textbf{v}\|}\right]^T.
\end{align}
\end{remark}


### Vector algebra {#vector-algebra}

We here define operations amongst two given vectors defined in the same space: $\textbf{u} = [u_1, u_2, u_3]^T, \textbf{v} = [v_1, v_2, v_3]^T \in \reals^3$.

#### Vectorial Sum {#vector-sum}

The sum of two vectors is a vector, and its components are the sum of the two vectors components.

\begin{definition}[Vectorial sum]\label{def:vector-sum}
\begin{align} \label{eq:vector-sum}
\textbf{w} = \textbf{u} + \textbf{v} = (u_1+v_1)\hat{\textbf{i}} + (u_2+v_2)\hat{\textbf{j}} + (u_3+v_3)\hat{\textbf{k}}.
\end{align}
\end{definition}

\begin{remark}[Sum]\label{rem:sum}
Mathematical operations come in pairs, which represent the same concept. A _sum_ operation, sometimes more extensively referred to as the _algebric sum_, is the concept of summing, i.e., it includes both addition and subtraction. (A subtraction is nothing but an addition between positive and negative numbers.)
\end{remark}

The "parallelogram law" helps visualize the results of the vectorial sum operation [](#fig:vector-sum).

<div figure-id="fig:vector-sum" figure-caption="The sum of two vectors can be visualized with the parallelogram law.">
     <img src="placeholder.png" style='width: 15em'/>
</div>


#### Dot, or scalar, product {#vector-dot}

The dot, or scalar, product of two vectors ($\textbf{u}$,$\textbf{v} \in \reals^3$) is a scalar ($a \in \reals$), equal to the product of the magnitudes of the two vectors times the cosine of the angle between them, $\phi \in [0,2\pi)$.

\begin{definition}[Scalar product]\label{def:vector-dot-product}
\begin{align} \label{eq:vector-dot-product}
a = \textbf{u} \cdot \textbf{v} = \|u\|\|v\|\cos(\phi) \in \reals
\end{align}
\end{definition}

The dot product is a measure of the _projection_ of vectors on one another ([](#fig:vector-dot-product)).

Note: When the two vectors are perpendicular, or orthogonal, the dot product is zero ($\cos(\pi/2) = 0$). This fact is often used as a test for orthogonality. Orthogonality is an important concept for linear spaces, as the most "efficient" basis are orthogonal.

<div figure-id="fig:vector-dot-product" figure-caption="The scalar product between two vectors measures the projection of one on each other.">
     <img src="placeholder.png" style='width: 30em'/>
</div>

<!-- It is useless to reference ####, as they have no section number. -->
#### Cross, or vector, product {#vector-cross}

While the dot product depends on the metric chosen in the space (the Euclidian norm, in our case), the cross product even requires the definition of an orientation, or handedness.

\begin{definition}[Standard Base]\label{def:standard-basis}
In the Euclidian space $\reals^3$, $\hat{\textbf{i}}, \hat{\textbf{j}}, \hat{\textbf{k}}$ is the standard base, and it is right handed.
\end{definition}

The cross, or vector, product between two vectors ($\textbf{u}$, $\textbf{v} \in \reals^3$) is a
vector that is orthogonal to each of the two vectors, hence is normal, or perpendicular, to the plane containing them. Its magnitude is given by the product of their magnitude times the sine of the angle between them, and its direction is indicated by the normal unit vector ($\hat{\textbf{n}} \in \reals^3$), identified by the right hand rule.

\begin{definition}[Scalar product]\label{def:vector-cross-product}
\begin{align} \label{eq:vector-cross-product}
\textbf{w} = \textbf{u} \times \textbf{v} = \|u\|\|v\|\sin(\phi) \textbf{n}
\end{align}
\end{definition}

The components of $\textbf{w}$ can be easilly computed through the Sarrus rule.

Another way to remember the components of a cross product is to immagine the unit vectors $\hat{\textbf{i}}, \hat{\textbf{j}}, \hat{\textbf{k}}$ as if they were placed in order on a wheel ([](#fig:wheel-trick)):

<div figure-id="fig:wheel-trick" figure-caption="The wheel trick .">
     <img src="placeholder.png" style='width: 30em'/>
</div>

The right hand rule ([](#fig:right-hand-rule)) the handy-est way to identify the direction of the vector resulting from a cross product:

<div figure-id="fig:right-hand-rule" figure-caption="The right hand rule points in the direction of the resulting vector from a cross product.">
     <img src="placeholder.png" style='width: 30em'/>
</div>

### Properties of vectors {#vector-properties}

#### Sum

- commutative

#### Dot product

- commutative

#### Cross product
it loooooooo
- anticommutative
- distributive over scalars

<!--
\begin{definition}[Reference signals]\label{def:def-label}
A reference signal $\tilde{y}_t \in \mathcal{L}_2(\mathcal{T})$ is ...
\end{definition}

[](#def-label) is very important.

<div class="check" markdown="1">

Insert 'random' checks to keep the reader's attention up:

if you can't be woken up in the middle of the night and rememeber the definition of $\mathcal{L}_2(\cdot)$, read: [](#bib:placeholder)

</div>

\begin{definition}[Another definition]\label{def:another-def-label}
Lorem
\end{definition}
-->

#### Orthogonality between vectors {#vector-orthogonality}



## Norms {#norms}

- Definition of:
- norms
- p-norm, $\infty$-norm

<!--

<div class="example-usage" markdown="1">

This is a 'think about it' interrupt, used as attention grabber:

When a Duckiebot 'overshoots', it means that [...] and the following will happen [...].

</div>

### Section N: title-N (e.g.: Saving the world with PID)

And finally, this is how you save the world, in theory.

-->

## Pointers to Exercises {#theory-chapter-template-exercises-pointers}

Here we just add references to the suggested exercises, defined in the appropriate [exercise chapters](#part:exercises).


## Conclusions

In this section we have defined the fundamental concept of linearity and introduced the mathematical tools pertaining to it, in particular vectors and matrices. Moreover, we have introduced their properties and interpretations as linear spaces.

We have found that matrices are a very convenient way to represent linear spaces, and that the properties of the matrices such as eigenvalues and eigenvectors have important implications in characterizing these spaces.

These tools are useful because they are at the foundation of _modeling_ of natural phenomena. Modeling will be invaluable in understanding the behavior of systems, and a powerful tool to _predict_ future behaviors of the system, and _control_ them when needed.

We have learned that ...
<!--
- What did we do? (recap)
- What did we find? (analysis)
- Why is it useful? (synthesis)
- Final Conclusions (what have we learned)
-->
## Next Steps

- linearization of nonlinear equations
- state space representations
- basic kinematics
- basic dynamics


<!--
Strong of this new knowledge (what have we learned), we can now [...].
-->
<!--(Dear Santa, I would like class='additional-reading' here) -->
<div class="requirements" markdown="1">
<!--
Further Reading: insert here reference resources for the interested reader:
-->

See also: [](#bib:Savov2017)

See also: [Matrix cookbook](#bib:matrix-cookbook)

</div>


Author: Jacopo

Maintainer: Jacopo

Point of Contact: Jacopo


<!--
More academic examples

#### T-Example 1

Immagine a spring-mass-damper system...

#### T-Example M

[...]
-->

<!--
More Duckiebot related examples

#### I-Example 1


#### I-Example M

[...]
-->
