# Homogeneous Coordinates {#homogeneous_coordinates}

<div class="check" markdown="1">
Required Reading: The following assumes a working familiarity with 2D and 3D Cartesian reference frames, basic properties of vectors, matrices, and linear transformations. If you are not familiar with Cartesian reference frames, please read the [chapter on reference frames](#reference_frames).
</div>


## Introduction

_Homogeneous coordinates_ are a mathematical trick that we will use to make computations in projective space easier. First let's review basic transformations in 2D and 3D cartesian coordinate systems. Recall that a _translation_


For example in 2D, we can represent
P^2
- homogeneous property


## Why use homogeneous coordinates

-Can represent rigid body transformations as linear maps
-Makes the mathematics of perspective and projective geometry easier. In other words makes camera stuff easier
-Can represent points at infinity


### Features of homogeneous coordinates
Taking the cross product between
_rotation_ in 2D is when *FINISH THIS SENTENCE*. Or, in matrix-vector notation:

Exercise



## Transformations in homogeneous coordinates


### Translation

T =
\begin{align} \label{eq:3DrotationZ}
T = \left[  \begin{array}{ccc}
cos\theta  & -sin\theta  & 0  \\
sin\theta  & cos\theta  & 0    \\
0          & 0          & 1    \\
\end{array} \right]
\end{align}

- Degrees of freedom

### Rotation

R =

### Rigid body

- A rigid body transformation
- Not linear in Euclidean coordinates, but is linear in homoogeneous coordinates
- Degrees of freedom

H =


## Heirarchy of Transformations

In addition to rotations, translations, and rigid-body transformations, there are many other transformations.  We will not discuss this in detail, but instead provide a table showing the heiarchy of transformations in homogeneous coordinates.  SAY SOMETHING ABOUT ADDING PROPERTIES TO BUILD UP THIS HEIRARCHY.
