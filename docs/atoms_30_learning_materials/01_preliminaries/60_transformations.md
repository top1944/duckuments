# Transformations {#transformations status=beta}

<div class="check" markdown="1">
Required Reading: The following assumes a working familiarity with 2D and 3D Cartesian reference frames. If you are not familiar with Cartesian reference frames, please read the [chapter on reference frames](#reference_frames).
</div>

Please refer to the _Robotics Handbook_ section 1.2, and in the context of this course, reader's goal is to attain a conceptual understanding, not necessarily knowing the exact formulae.

## 2D Transformations

2D transformations are transformations of points, vectors, or objects in the 2D plane.

### Translation

Let $\avec{v}$ be a vector in the 2D plane.  We say that the vector $\avec{v}$ undergoes a _translation_ to form a new vector $\avec{v'}$ when added to another another vector $\avec{t}$: $\avec{v'} = \avec{v} + \avec{t}$. Or, equivalently we can write:

\begin{align} \label{eq:vector}
\avec{v'} = \left[ \begin{array}{c} x_1' \\ y_1' \end{array} \right]
= \left[ \begin{array}{c} x_1 + t_x \\ y_1 + t_y \end{array} \right]\end{align}

### Rotation
A _rotation_ is a transformation of an object around a fixed point. In 2D Cartesian coordinates, the fixed point is usually the origin $(0,0)$.  To derive the equations for a rotation in the plane, let us consider rotating vector $\avec{v}$ by some angle $\theta$.  Assume that $\avec{v}$ has coordinates $(x,y)$ and has an angle of $\phi$ relative to the _x-axis_. By rotating $\avec{v}$ by $\theta$, we obtain a new vector $\avec{v'}$ whose coordinates are $(x',y')$.  First, let's rewrite $(x,y)$ in _polar coordinates_:

\begin{align}
x &= r cos\phi \\
y &= r sin\phi 
\end{align}

Similarly, we can write $(x',y')$ in _polar coordinates_:

\begin{align}
x' &= r cos(\phi + \theta) \\
y' &= r sin(\phi + \theta) 
\end{align}

Using the double angle formulas for $sin$ and $cos$ we obtain:

\begin{align}
x' &= r(cos\phi cos\theta - sin\phi sin\theta) \\
y' &= r(cos\phi sin\theta + sin\phi cos\theta
\end{align}

And substituting $x = r cos\phi$ and $y = r sin\phi$:

\begin{align}
x' &= x cos\theta - y sin\theta \\
y' &= x sin\theta + y cos\theta
\end{align}

From the above we obtain the rotation matrix:
\begin{align} \label{eq:2Drotation}
R(\theta) = \left[  \begin{array}{ccc}
cos\theta   & -sin\theta \\
sin\theta   & cos\theta    \\
\end{array} \right]
\end{align}

Thus, using matrix-vector notation we can write the rotation as $\avec{v'} = R(\theta)\avec{v}$ or:

\begin{align} \label{eq:vector2}
\avec{v'} = \left[  \begin{array}{ccc}
cos\theta   & -sin\theta \\
sin\theta   & cos\theta    \\
\end{array} \right]
\left[ \begin{array}{c} x \\ y \end{array} \right]
\end{align}


## 3D Transformations

3D transformations are transformations of objects 

### Translation

Similarly, we can define translation in 3D coordinate systems:

\begin{align} \label{eq:vector3}
\avec{v'} = \left[ \begin{array}{c} x_1' \\ y_1' \\ z_1' \end{array} \right]
= \left[ \begin{array}{c} x_1 + t_x \\ y_1 + t_y \\ z_1 + t_z \end{array} \right]\end{align}

### Rotation 

A _basic rotation_ in 3D is defined as rotation about one of the cardinal axes $x$, $y$, or $z$. The basic rotation matrices are 

\begin{align} \label{eq:3Drotationx}
R_x(\theta) = \left[  \begin{array}{ccc}
1   & 0           &    0 \\
0   & cos\theta   & -sin\theta \\
0   & sin\theta        & cos\theta    \\
\end{array} \right]
\end{align}

\begin{align} \label{eq:3Drotationy}
R_y(\theta) = \left[  \begin{array}{ccc}
cos\theta   & 0    & sin\theta \\
0           & 1    & 0          \\
-sin\theta  & 0    & cos\theta   \\
\end{array} \right]
\end{align}


\begin{align} \label{eq:3Drotationz}
R_z(\theta) = \left[  \begin{array}{ccc}
cos\theta  & -sin\theta  & 0  \\
sin\theta  & cos\theta  & 0    \\
0          & 0          & 1    \\
\end{array} \right]
\end{align}

As you can see, each basic rotation matrix is an extension of the 2D rotation matrix defined in the previous section.  We can obtain other rotation matrices by multiplying the basic rotation matrices.  For example, we obtain a new rotation matrix $R'$ by first rotating $\avec{v}$ about the _z-axis_ axis by $\alpha$, then the _x-axis_ by $\beta$, and finally the _y-axis_ by $\gamma$. This can be written as $\avec{v'} = R(\alpha)R(\beta)R(\gamma)\avec{v}$ or:

\begin{align} \label{eq:vector6}
\avec{v'} = \left[  \begin{array}{ccc}
cos\alpha  & -sin\alpha  & 0  \\
sin\alpha  & cos\alpha  & 0    \\
0          & 0          & 1    \\
\end{array} \right]
\left[  \begin{array}{ccc}
1   & 0          &  0        \\
0   & cos\beta   & -sin\beta \\
0   & sin\beta   & cos\beta    \\
\end{array} \right]
\left[  \begin{array}{ccc}
cos\gamma   & 0    & sin\gamma \\
0           & 1    & 0          \\
-sin\gamma  & 0    & cos\gamma   \\
\end{array} \right]
\left[ \begin{array}{c} x \\ y \\ z \end{array} \right]
\end{align}


Author: Falcon Dai

Maintainer: Falcon Dai

