# Duckiebot modeling {#duckiebot-modeling status=draft}

Assigned: Jacopo

Obtaining a mathematical model of the Duckiebot is important in order to (a) understanding its behavior and (b) designing a controller to obtain desired behaviors and performances.

The Duckiebot is a differential drive mobile robot, where the actuators are DC motors. By applying different torques to the wheels a Duckiebot can turn, go straight (same torque to both wheels) or stay still (no torque to both wheels). This driving configuration is referred to as _differential drive_.

In this section we will first derive the kinematic and dynamic models of a Duckiebot, then integrate them with the model of the actuators, and finally describe procedures for odometry calibration, i.e., the determination of those of parameters necessary to particularize the general model to each specific Duckiebot.

Different methods can be followed to obtain the Duckiebot model, namely the Lagrangian or Newton-Euler, we choose to describe the latter as it arguably provides a clearer physical insight. Showing the equivalence of these formulations is an interesting exercise, and the reader may refer to [](#bib:dhaouadi2013dynamic), from which this chapter is mostly taken, for detailed insight.

<div class='requirements' markdown="1">

Requires:[k:reference_frames](#reference_frames), [k:intro-transformations](#transformations)

Requires: [k:intro-kinematics](#intro-kinematics)

Requires: [k:intro-dynamics](#intro-dynamics)

Suggested: [k:intro-ODEs-to-LTIsys](#intro-ode2lti)

Result: k:diff-drive-robot-model

</div>

## Relevant notation {#mod-notation}

We here briefly recapitulate on the (reference frames)[#reference-frames] that we will use to model the Duckiebot, with the intent of introducing the notation used throughout this chapter.

To describe the behavior of a Duckiebot two reference frames will be used:

- An _intertial_ frame: a fixed two dimensional "global" reference system that spans the plane on which the Duckiebot moves. We will denote its axis as $\{X_I, Y_I\}$.

- A _body_ (or "robot") frame: a local reference frame fixed with respect to the robot, centered in the midpoint ($A$) of the axis between the wheels. The $x$ axis points in the direction of the front of the robot, and the $y$ axis lies along the axis between the wheels, so to form a right handed reference system. We denote the robot body frame with $\{x_r, y_r\}$.

Note: The robot is assumed to be symmetric, and $x_r$ coincides with axis of symmetry.

Note: Quantities described with respect to the inertial or robot frames are denoted as $(\cdot)^I)$ and $(\cdot)^r)$ respectively.

The center of mass $C^I = (x_c, y_c)$ of the robot is on the $x_r$ axis, at a distance $d$ from A.





[](#fig:mod-ref-frames) summarizes the notations introduced.

<div figure-id="fig:mod-ref-frames" figure-caption="Relevant notations for modeling a differential drive robot">
  <img src="mod-ref-frames" style='width: 30em; height:auto'/>
</div>




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
