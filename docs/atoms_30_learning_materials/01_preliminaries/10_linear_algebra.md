# Linear algebra {#linear_algebra}

TODO: This Section is work in progress.

Assigned: Jacopo

<!--Start with a brief introduction of the discussed topic, describing its place in the bigger picture, justifying the reading constraints/guidelines below. Write it as if the reader knew the relevant terminology. -->

Linear algebra provides the set of mathematical tools to (a) study linear relationships and (b) describe linear spaces. It is a field of mathematics with important ramifications.

Linearity is an important concept because it is powerful in describing the input-output behaviour of many natural phenomena (or _systems_). As a matter of fact, all those systems that cannot be modeled as linear, still can be approximated as linear to gain an intuition, and sometimes much more, of what is going on.

So, in a way or the other, linear algebra is a starting point for investigating the world around us, and Duckietown is no exception.

<!--(Dear Santa, I would like class='required-preliminaries' here) -->
<div class='requirements' markdown="1">

Knowledge necessary:

<!--Required Reading: Insert here a list of topics and suggested resources related to _necessary_ knowledge in order to understand the content presented. Example: -->

Requires: Real numbers are complex for you?: Number theory [addref]()

Requires: $\forall$ is a typo for A and $\in$ are Euros? Mathematical symbolic language: [addref]()

</div>
TODO: find appropriate references and fill in above

<!--(Dear Santa, I would like class='recommended-preliminaries' here)
<div class="requirements" markdown="1">

Suggested Reading: Insert here a list of topics and suggested resources related to _recommended_ knowledge in order to better understand the content presented. Example:

Recommended: Definitions of Stability, Performances and Robustness: [](#bib:placeholder), ...

</div>
-->

## Problem Definition {#theory-chapter-template-problem-def}

In this section we discuss vectors, matrices and linear spaces, along with their properties. Before introducing the these arguments, we need to formally define what we mean by linearity. The word _linear_ comes from the latin _linearis_, which means _pertaining to or resembling a line_. You should recall that a line is represented by an equation like $y = mx + q$, but here we intend linearity as a property of maps, so there is a little more to linearity than lines (although lines _are_ linear maps indeed). To avoid confusions, let us translate the concept of linearity in mathematical language.

First, let us define a _function_, as a mapping between _sets_.

\begin{definition}[Set]\label{def:set}
A set $\mathbb{X} = \{x_1, x_2, \dots\}$ is a well-defined collection of distinct _elements_, or _members_ of the set, $x_i$, $i = 1, 2, \dots$. For the time being, we assume elements to (complex) numbers.
\end{definition}

\begin{definition}[Function]\label{def:function}
A function $f : \mathbb{X} \rightarrow \mathbb{Y}$ is a mapping between the sets $\mathbb{X}$ and $\mathbb{Y}$. For every input element $x \in \mathbb{X}$, the mapping will produce an output $y = f(x) \in \mathbb{Y}$.
\end{definition}

<div class="requirements" markdown="1">

Recommended: Functions can be classified by the nature of the relationship between inputs and outputs in: _injective_, _surjective_ or _bijective_ [add-ref]().

</div>
TODO: add references
<!--<div id='def:function' class="definition latex_env" markdown="1">

A function $f : \mathbb{X} \rightarrow \mathbb{Y}$ is a mapping between the spaces $\mathbb{X}$ and $\mathbb{Y}$. For every input element $x \in \mathbb{X}$, the mapping will produce an output $y = f(x) \in \mathbb{Y}$.

</div> -->

\begin{definition}[Linearity]\label{def:linearity}
A function $f: \mathbb{X} \rightarrow \mathbb{Y}$ is linear when, $\forall x_i \in \mathbb{X}$, $i = \{1,2\}$, and $\forall a \in \mathbb{R}$:

\begin{align}
f(ax_1) &= af(x_1), \label{eq:lin1} \quad \text{and:} \\
f(x_1 + x_2) &= f(x_1) + f(x_2) \label{eq:lin2}
\end{align}

\end{definition}

Condition \eqref{eq:lin1} is referred to as the property of _homogeneity_ (of order 1), while condition \eqref{eq:lin2} is referred to as _additivity_.

\begin{remark}[Superposition Principle]\label{rem:lin-superposition}
Conditions \eqref{eq:lin1} and \eqref{eq:lin2} can be merged to express the same meaning through:
\begin{align}
f(ax_1 + bx_2) = af(x_1) + bf(x_2), \forall x_i \in \mathbb{X}, i = \{1,2\}, \forall a,b \in \mathbb{R} \label{eq:linearity}.
\end{align}
\end{remark}

This equivalent condition \eqref{eq:linearity} is instead referred to as _superposition principle_, which unveils the bottom line of the concept of linearity: adding up (equivalently, scaling up) inputs results in an added up (equivalently, scaled up) output.

<!--In this section we crisply define the problem object of this chapter. It serves as a very brief recap of exactly what is needed from previous atoms as well. E.g.

Let:

\begin{align}
\dot{\state}_t = A\state_t+Bu_t \\
y = C\state_t+Du_t              \label{eq:system}
\end{align}

 be the LTI model of the Duckiebot's plant, with $x \in \statesp$, $y \in \mathbb{R}^p$ and $u \in \mathbb{R}^m$. We recall ([Duckiebot Modeling]()) that:

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

Let $n$ belong to the set of natural numbers $\mathbb{N}$, i.e., $n \in \mathbb{N}$, and let $a_i \in \mathbb{R}$, $i = \{1, \dots, n\}$ be real coefficients. While $\mathbb{R}$ is the set of real numbers, $\mathbb{R}^n$ is the set of all $n$-tuples of real numbers.

\begin{definition}[Vector and components]\label{def:vector}

An $n$-dimensional $\textit{vector}$ is an $n$-tuple:

\begin{align} \label{eq:vector}
\textbf{v} = \left[ \begin{array}{c} v_1 \\ \vdots \\ v_n \end{array} \right] \in \mathbb{R}^{n \times 1} \equiv \mathbb{R}^n,
\end{align}

of _components_ $v_1, \dots, v_n \in \mathbb{R}$.

\end{definition}

You can immagine a vector [](#fig:vector-breakdown) as a "directional _number_", or an arrow that starts a certain point and goes in a certain direction (in $\mathbb{R}^n$). In this representation, the _number_ is the length of the arrow, or the _magnitude_ of the vector (sometimes referred to even as _modulus_, and it can be derived through the vector's components.

\begin{definition}[Length of a vector]\label{def:vec2norm}
We define the length, or _modulus_, of a vector $\textbf{v} \in \mathbb{R}^n$ as:
\begin{align} \label{eq:vec2norm}
\|\textbf{v}\| = \sqrt{v_1^2 + \dots + v_n^2} \in \mathbb{R}.
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

Let $\textbf{v} \in \mathbb{R}^3$ be a vector defined in the Cartesian space. Let, moreover, $(\textbf{i},\textbf{j},\textbf{k})^T$ be the versor of the Cartesian axis, i.e.:
\begin{align}\label{eq:example-vector-algebraic}
\textbf{i} &= [1,0,0]^T; \\
\textbf{j} &= [0,1,0]^T; \\ 
\textbf{k} &= [0,0,1]^T.
\end{align} 
Then, a vector can be written equivalently in vector or algebraic form: $\textbf{v} = [v_1, v_2, v_3]^T = v_1\textbf{i} + v_2\textbf{j}+v_3\textbf{k}$. Unit vectors are sometimes explicitly denoted with a hat (`^`), e.g., $[\hat{\textbf{i}}, \hat{\textbf{j}}, \hat{\textbf{k}}]^T$.
</div>

\begin{remark}[Normalizing vectors]\label{rem:vector-normalizing}
Every vector can be made into a unit vector, or _normalized_, by dividing each of its components by the vector's magnitude:
\begin{align}\label{eq:vector-normalizing}
\hat{\textbf{v}} = \frac{\textbf{v}}{\|\textbf{v}\|} = [\frac{v_1}{\|\textbf{v}\|}, \frac{v_2}{\|\textbf{v}\|}, \frac{v_3}{\|\textbf{v}\|}]^T.
\end{align}
\end{remark}


### Vector algebra {#vector-algebra}

We here define operations amongst two given vectors defined in the same space: $\textbf{u} = [u_1, u_2, u_3]^T, \textbf{v} = [v_1, v_2, v_3]^T \in \mathbb{R}^3$.

#### Vectorial Sum {#vector-sum}

\begin{definition}[Vectorial sum]\label{def:vector-sum}
\textbf{w} = \textbf{u} + \textbf{v} = (u_1+v_1)\hat{\textbf{i}} + (u_2+v_2)\hat{\textbf{j}} + (u_3+v_3)\hat{\textbf{k}} = 
\begin{align} \label{eq:vector-sum}

\end{align}
\end{definition}

\begin{remark}[Sum]\label{rem:sum}
Remember that mathematical operations come in pairs, which represent the same concept. A _sum_ operation, sometimes more extensively referred to as the _algebric sum_, is the concept of summing, i.e., it includes both addition and subtraction. (A subtraction is nothing but an addition between positive and negative numbers.)
\end{remark}

#### Vectorial dot product {#vector-dot}



#### Vectorial cross product {#vector-cross}



### Properties of vectors {#vector-properties}


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

## Matrices {#matrix-definitions}

Definitions:

- matrix dimensions
- flat and tall matrix
- adjoint matrix
- inverse matrix
- rank of a matrix
- condition number of a matrix (?)
- identity matrix
- null matrix
- diagonal matrix
- symmetric matrix
- unit matrix
- trace of a matrix


### Matrix algebra {#matrix-algebra}

- sum of matrices
- product of matrices
- matrix transpose
- matrix scalar product
- matrix Hadamart product
- matrix concatenation
- matrix-vector product
- matrix power
- matrix exponential

#### Determinant {#matrix-determinant}

- 2x2
- 3x3
- nxn

#### Inverse {#matrix-inverse}

- general expression

#### Left and Right Inverse (topic for advanced-linear-algebra?)

- what if the matrix is not square? (topic for advanced-linear-algebra?)
- Moore-Penrose pseudo-inverse

#### Eigenvalues and Eigenvectors {#eigen}

- for square matrices
- for rectangular matrices (topic for advanced-linear-algebra?)
- singular value decomposition SVD (topic for advanced-linear-algebra?)

### Properties of Matrices {#matrix-properties}



## Matrix as representation of linear (vector) spaces {#matrix-linear-space}

- linear system to matrix representation
- linearly dependent and independent spaces

### Fundamental spaces {#fundamental-spaces}

- Null space
- Range/image

### Preferred spaces (matrix diagonalization)

- show how to diagonalize matrices and why it is relevant (it will come in handy for state space representation chapter chapter)

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

## Examples {#theory-chapter-template-examples}
<!--
This section serves as a collection of theoretical and practical examples that can clarify part or all of the above.
-->

### Theoretical Examples {#theory-chapter-template-examples-theory}

#### Calculate a (square) Matrix Inverse

#### Find eigenvalues and eigenvectors

#### Find range and null spaces of a matrix

<!--
More academic examples

#### T-Example 1

Immagine a spring-mass-damper system...

#### T-Example M

[...]
-->
### Implementation Examples {#theory-chapter-template-examples-code}

#### Inverting a well conditioned matrix

#### Inverting a ill conditioned matrix

<!--
More Duckiebot related examples

#### I-Example 1


#### I-Example M

[...]
-->
## Pointers to Exercises {#theory-chapter-template-exercises-pointers}

Here we just add references to the suggested exercises, defined in the appropriate [exercise chapters](#part:exercises).


## Conclusions

In this section we have defined the fundamental concept of linearity and introduced the mathematical tools pertaining to it, in particular vectors and matrices. Moreover, we have introduced their properties and interpretations as linear spaces.

We have found that matrices are a very convenient way to represent linear spaces, and that the properties of the matrices such as eigenvalues and eigenvectors have important implications in charachterizing these spaces.

These tools are useful because they are at the foundation of _modeling_ of natural phenomena. Modeling will be invaluable in understanding the behaviour of systems, and a powerful tool to _predict_ future behaviours of the system, and _control_ them when needed.

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
