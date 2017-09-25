# Duckiebot modeling {#duckiebot-modeling status=draft}

Assigned: Jacopo

TODO: put prettier figures

Obtaining a mathematical model of the Duckiebot is important in order to (a) understand its behavior and (b) design a controller to obtain desired behaviors and performances, robustly.

The Duckiebot is a differential drive mobile robot, where the actuators are DC motors. By applying different torques to the wheels a Duckiebot can turn, go straight (same torque to both wheels) or stay still (no torque to both wheels). This driving configuration is referred to as _differential drive_.

In this section we will first derive the kinematic and dynamic models of a Duckiebot, comprehensive of the model of its actuators (DC motors).

<!--, and finally describe procedures for odometry calibration, i.e., the determination of those of parameters necessary to particularize the general model to each specific Duckiebot.-->

Different methods can be followed to obtain the Duckiebot model, namely the Lagrangian or Newton-Euler, we choose to describe the latter as it arguably provides a clearer physical insight. Showing the equivalence of these formulations is an interesting exercise, and the reader may refer to [](#bib:dhaouadi2013dynamic), from which this chapter is mostly taken, for detailed insight.

<div class='requirements' markdown="1">

Requires:[k:reference_frames](#reference_frames), [k:intro-transformations](#transformations)

Requires: [k:intro-kinematics](#intro-kinematics)

Requires: [k:intro-dynamics](#intro-dynamics)

Suggested: [k:intro-ODEs-to-LTIsys](#intro-ode2lti)

Result: k:diff-drive-robot-model

</div>

## Preliminaries {#mod-prelim}

We first briefly recapitulate on the (reference frames)[#reference-frames] that we will use to model the Duckiebot, with the intent of introducing the notation used throughout this chapter.

To describe the behavior of a Duckiebot two reference frames will be used:

- An _inertial_ frame: a fixed two dimensional "global" reference system that spans the plane on which the Duckiebot moves. We will denote its axis as $\{X_I, Y_I\}$.

- A _body_ (or "robot") frame: a local reference frame fixed with respect to the robot, centered in the midpoint ($A$) of the axis between the wheels. The $x$ axis points in the direction of the front of the robot, and the $y$ axis lies along the axis between the wheels, so to form a right handed reference system. We denote the robot body frame with $\{x_r, y_r\}$.

Note: The robot is assumed to be a rigid body, symmetric, and $x_r$ coincides with axis of symmetry.

Note: Quantities described with respect to the inertial or robot frames are denoted as $((\cdot)^I)$ and $((\cdot)^r)$ respectively.

- The center of mass $C^I = (x_c, y_c)$ of the robot is on the $x_r$ axis, at a distance $d$ from $A$, i.e., ($C^r = (d, 0)$);
- $x^r$ forms an _orientation angle_ $\theta$ with the local horizontal;
- the wheels are assumed to be identical, with diameter equal to $2R$;
- the distance between the wheels is denoted as $2L$.  

The position of the robot with respect to the inertial frame is completely characterized by:

\begin{align}
\avec{q^I} = \left(  \begin{array}{c} x_a  \\ y_a \\ \theta \end{array} \right),
\end{align}

and it is always possible to switch representation of a vector $X$ from the robot to inertial frames through:

\begin{align} \label{eq:mod-r2i}
\avec{X^I} = \amat{R}(\theta)\avec{X^r}.
\end{align}

$\amat{R}(\theta)$ is an orthogonal rotation matrix defined by:

\begin{align} \label{eq:mod-rot-mat}
\amat{R}(\theta) = \left[  \begin{array}{ccc} \cos\theta & -\sin \theta  & 0 \\ \sin\theta & cos\theta & 0 \\ 0 & 0 & 1 \end{array} \right].
\end{align}

Note: Remember that the orthogonality condition implies that $\amat{R}^T(\theta)\amat{R}(\theta) = \amat{R}(\theta)R^T(\theta) = \amat{I}$, hence:
\[ \label{eq:mod-orthogonality-cond}
\amat{R}(\theta) = \amat{R}^{-1}(\theta)
\]

Note: $\amat{R}(\theta)$ is not a function of time, but only of the orientation. Hence, by denoting time derivatives as $\dot{(\cdot)}$ we can obtain the relation between velocities in the two reference systems:
\begin{align} \label{eq:mod-r2i-dot}
\avec{\dot X^I} = \amat{R}(\theta)\avec{\dot X^r}.
\end{align}

[](#fig:mod-ref-frames) summarizes the notations introduced.

<div figure-id="fig:mod-ref-frames" figure-caption="Relevant notations for modeling a differential drive robot">
  <img src="mod-ref-frames.png" style='width: 30em; height:auto'/>
</div>

## Differential drive robot kinematic model {#mod-kin}

In a differential drive robot, controlling the wheels to different speeds generate a rolling motion of rate $\omega = \dot \theta$.  In a rotating field there always is a fixed point, the _center of instantaneous curvature_ (ICC), and all points at distance $d$ from it will have a velocity given by $\omega d$ and direction orthogonal to the direction of the ICC. Therefore, by looking at [](#fig:mod-kin-icc), we can write:

<div figure-id="fig:mod-kin-icc" figure-caption="By controlling the rotation rates of the wheel independently, a differential drive robot can make turns. Figure adapted from [](#bib:Dudek10).">
  <img src="mod-kin-icc.png" style='width: 30em; height:auto'/>
</div>

TODO: change labels in pic to match previously used conventions.

\begin{align} \label{eq:mod-kin-1}
\left\{  \begin{array}{l} \dot \theta (d-L) &= v_l  \\
                          \dot \theta (d+L)  &= v_r \right.,
\end{align}

from which:

\begin{align} \label{eq:mod-kin-2}
\left\{  \begin{array}{l} d &= L \frac{v_r + v_l}{v_r - v_l}  \\
                          \dot \theta &= \frac{v_r - v_l}{2L} \right..
\end{align}

A few observations stem immediately from \eqref{eq:mod-kin-2}:

- If $v_r = v_l$ the bot does not turn (\dot \theta = 0), hence the ICC is not defined;
- If $v_r = - v_l$, then the robot "turns on itself", i.e., $d=0$ and $ICC \equiv A$;
- If $v_r = 0$ (or $v_l = 0$), the rotation happens around the right (left) wheel and $d = L$.

Note: Moreover, a differential drive robot cannot move in the direction ...

### Differential drive robot kinematic constraints {#mod-kin-constraint status=beta}
The kinematic constraints are derived from two assumptions:

- _No lateral slipping motion_: the robot cannot move sideways, but only in the direction of motion, i.e., its lateral velocity in the robot frame is zero, i.e.:
\[ \label{eq:mod-no-lat-slip-constraint-r}
 \dot y_A^r = 0.
\]

 By inverting \eqref{eq:mod-r2i}, this constraint can be expressed through the inertial frame variables, yielding:

\[ \label{eq:mod-no-lat-slip-constraint-i}
\dot y_A \cos \theta -\dot x_A \sin \theta = 0.
\]

- _Pure rolling_: the wheels never slips or skids ([](#fig:mod-kin-constraint)). Hence, letting $\dot \phi_{l}, \dot \phi_{r}$ be the angular velocities of the left and right wheels respectively, the velocity of the ground contact point P is given by:

<div figure-id="fig:mod-kin-constraint" figure-caption="Pure rolling (no slipping) kinematic constraint">
  <img src="mod-kin-constraint.png" style='width: 15em; height:auto'/>
</div>

\begin{align} \label{eq:mod-pure-rolling}
\left\{  \begin{array}{ll} v^r_{P,r} &= R \dot \varphi_{r}\\
                      v^r_{P,l} &= R \dot \varphi_{l}  \end{array} \right.
\end{align}

Recalling that the robot is assumed to be a rigid body, the velocity of point $P$ in the inertial frame can be expressed as the sum of the translational velocity $\avec{v_A}$ and that of the rotating field $\avec{w_P^I} = L \dot \theta$ due to the robot's rotation. The $X_I,Y_I $ components of $\avec{v_P}$ can therefore be expressed as:

\begin{align} \label{eq:mod-pure-rolling-inertial-left}
\left\{  \begin{array}{ll} \dot x_{P,r} &= \dot x_A + L\dot \varphi_{r} \cos \theta \\
                      \dot y_{P,r} &= \dot y_A + L \dot \varphi_{r} \sin \theta  \end{array} \right.,
\end{align}

and

\begin{align} \label{eq:mod-pure-rolling-inertial-right}
\left\{  \begin{array}{ll} \dot x_{P,l} &= \dot x_A + L\dot \varphi_{r} \cos \theta \\
                      \dot y_{P,l} &= \dot y_A + L \dot \varphi_{r} \sin \theta  \end{array} \right..
\end{align}

By recalling \eqref{eq:mod-orthogonality-cond} and \eqref{eq:mod-no-lat-slip-constraint-r}, the expression of left and right wheel velocities in the robot frame can be summarized in the _pure rolling constraint_ equation:

\begin{align} \label{eq:mod-pure-rolling-constraint}
\left\{  \begin{array}{ll} \dot x_{P,r} \cos \theta +  \dot y_{P,r} \sin \theta &= R \dot \varphi_r \\
                           \dot x_{P,l} \cos \theta +  \dot y_{P,l} \sin \theta &= R \dot \varphi_l                 \end{array} \right..
\end{align}

#### Kinematic constraints summary

The kinematic constraints (\eqref{eq:mod-no-lat-slip-constraint-i}, \eqref{eq:mod-pure-rolling-constraint}) of a differential drive robot can be succinctly expressed as:

Note: \[ \label{eq:mod-constraints-succint} \amat{\Lambda}(\avec{q})\avec{\dot q} = 0,\]

where:

\begin{align} \label{eq:mod-lambda}
 \amat{\Lambda}(\avec{q}) = \left[ \begin{array}{ccccc} -\sin \theta & \cos \theta & 0 & 0 & 0 \\
                                                 \cos \theta & \sin \theta & L & -R & 0 \\
                                                 \cos \theta & \sin \theta & -L & 0 & R \\
   \end{array}  \right]
\end{align}

and:

\[ \label{eq:mod-q} \avec{\dot q} = \left[ \dot x_A \quad \dot y_A \quad \dot \theta \quad \dot \varphi_r \quad \dot \varphi_l \right]^T,  \]

\begin{align} \label{eq:mod-pure-rolling-relabel}
\left\{  \begin{array}{ll} v_{r} &= R \dot \varphi_{r}\\
                      v_{l} &= R \dot \varphi_{l}  \end{array} \right..
\end{align}

## Differential drive robot dynamic model {#mod-dyn}

- Newton-Euler derivation

[](#fig:mod-fbd)

<div figure-id="fig:mod-fbd" figure-caption="Free body diagram of a differential drive robot">
  <img src="mod-fbd.png" style='width: 30em; height:auto'/>
</div>


## DC motor dynamic model {#mod-motor status=draft}

[](#fig:mod-dynamic)

<div figure-id="fig:mod-dynamic" figure-caption="Free body diagram of a differential drive robot">
  <img src="mod-dynamic.png" style='width: 30em; height:auto'/>
</div>

## Final result {#mod-result status=draft}

[](#fig:mod-final)

<div figure-id="fig:mod-final" figure-caption="Block diagram representation of the model of a differential drive robot">
  <img src="mod-final.png" style='width: 30em; height:auto'/>
</div>

## Conclusions {#mod-conclusions status=draft}


- How to particularize this model to an actual Duckiebot?

Next Step: Odometry Calibration

- Exercise: derive this same model through the lagrangian formulation



















<!--

## Kinematics {#mod-kinematics status=draft}

A Duckiebot has two DC motors that independently control the front wheels.

The content of this chapter is taken from [](#bib:Dudek10).

<div class='requirements' markdown="1">

Requires: [k:intro-kinematics](#intro-kinematics),

Requires:[k:coordinate-systems](#coordinate_systems)

Result: k:car-kinematics

</div>

### Differential drive kinematics {#car-kinematics-diff-drive status=draft}

### Forward kinematics for differential drive robots {#car-kinematics-forward-kin status=draft}

### Inverse kinematics for differential drive robots {#car-kinematics-inverse-kin status=draft}

### Duckiebot kinematics {#car-kinematics-duckiebot status=draft}

-->
