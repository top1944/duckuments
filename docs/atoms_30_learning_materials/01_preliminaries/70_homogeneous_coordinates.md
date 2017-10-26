# Homogeneous Coordinates {#homogeneous_coordinates}

<div class="check" markdown="1">
Required Reading: The following assumes a working familiarity with 2D and 3D Cartesian [reference frames](#reference_frames) and [transformations](#transformations).
</div>


## Introduction

In the previous section we studied some basic transformations and their applications in Euclidean space. In the context of robotics, we are often concerned about what properties of our system are changed or preserved following a certain set transformations. For example,

-Image formation is a transformation from a 3D point in a scene to the image sensor.  These transformations are linear in homogeneous

. Some analogies can be drawn between. For example, Cartesian coordinates are used in Euclidean geometry, whereas homogeneous coordinates are used in projective geometry. The use of homogeneous coordinates has a number of advantages over Cartesian coordinates.

_Homogeneous coordinates_ are a system of coordinates used in _projective geometry_

-Can represent rigid body transformations as linear maps
-Makes the mathematics of perspective and projective geometry easier. In other words makes camera stuff easier
-Can represent points at infinity (see below)

Homogeneous coordinates gives us the tools to perspective and image formation ()

As you will see later in the book, homogeneous coordinates are also used in computer vision and computer graphics.

## Basic geometry in homogeneous coordinates

### Representation of a point

For example in 2D, we can represent a vector (or point) $\avec{p} = (x,y)$ as a vector:

\begin{align} \label{eq:vector}
\avec{p} = \left[ \begin{array}{c} x \\ y \\ 1 \end{array} \right]\end{align}

- The representation of x is not unique
- The space is called P^2

#### Homogeneity property
\begin{align} \label{eq:vector}
\avec{p} = \left[ \begin{array}{c} x' \\ y' \\ z' \end{array} \right]

= \frac{1}{z'} \left[ \begin{array}{c} \frac{x'}{z'} \\ y \\ 1 \end{array} \right]
\end{align}

### Representation of a line


### Vanishing points

_Vanishing points_, or _points at infinity_, have a finite representation in homogeneous coordinates. This property is useful for proving that parallel lines in projective space intersect at a point.


## Examples of computations in homogeneous coordinates

#### A point on a line

Dot produce

#### Intersection of two lines

Taking the cross product between
_rotation_ in 2D is when *FINISH THIS SENTENCE*. Or, in matrix-vector notation:

#### A line between two points

Exercise

#### Parallel lines intersect at infinity

Exercise


## Transformations in homogeneous coordinates

As already mentioned, one of the benefits of using homogeneous coordinates is that transformations that are non-linear in Euclidean space become linear in projective space.

### Translation

Recall that a _translation_ in 3D Euclidean coordinates is a transformation where . As mentioned  

We can represent a translation $\avec{t} the translation in homogeneous coordinates using the following $4x4$ matrix:


\begin{align} \label{eq:Translation}
\amat{H} = \lambda \left[  \begin{array}{ccc}
\amat{I}       & \avec{t}  \\
\avec{0}^{T}   &  1        \\
\end{array} \right]
\end{align}.

It is easily verified that $\amat{H}$ is linear in projective space.

### Rotation


\begin{align} \label{eq:Rotation}
\amat{H} = \lambda \left[  \begin{array}{ccc}
\amat{R}       & \avec{0}  \\
\avec{0}^{T}   &  1        \\
\end{array} \right]
\end{align}.


### Rigid-body transformation

A _rigid-body transformation_ transformation is the combination of a rotation and translation. Similar to translations, _rigid-body_ transformations are non-linear in Euclidean space. However, we can represent rigid-body transformations in homogeneous coordinates:


\begin{align} \label{eq:Rigid-body}
\amat{H}  = \lambda \left[  \begin{array}{ccc}
\amat{R}       & \avec{t}  \\
\avec{0}^{T}   &  1        \\
\end{array} \right]
\end{align}

where $\amat{R}$ and $\avec{t} represent a rotation and translation, respectively.

### Heierarchy of Transformations

In addition to rotations, translations, and rigid-body transformations, there are many other transformations that can be represented in homogeneous coordinates. We will not discuss this in detail, but instead provide a table showing the heiarchy of transformations in homogeneous coordinates.  SAY SOMETHING ABOUT ADDING PROPERTIES TO BUILD UP THIS HEIRARCHY.

Author: Jon Michaux

Maintainer: Jon Michaux
