# Wheel calibration {#wheel-calibration status=beta}

Assigned: Andrea Daniele

<div class='requirements' markdown='1'>

Requires: You can run the joystick demo remotely. The procedure is documented
in [](#rc-launched-remotely).

Suggested: Duckiebot modeling [](#duckiebot-modeling).

Results:  Calibrate the wheels of the Duckiebot such that it goes in a straight line
when you command it to. Set the maximum speed of the Duckiebot.

</div>

## Introduction

The motors used on the Duckiebots are called "Voltage-controlled motors".
This means that the velocity of each motor is directly proportional to the
voltage it is subject to. Even though we use the same model of motor for left
and right wheel, they are not exactly the same. In particular, every motor responds
to a given voltage signal in a slightly different way. Similarly, the wheels
that we are using look "identical", but they might be slightly different.

If you drive the Duckiebot around using the joystick, you might notice that
it doesn’t really go in a straight line when you command it to. This is due to
those small differences between the motors and the wheels explained above.
Different motors can cause the left wheel and right wheel to travel at different
speed even though the motors received the same command signal.
Similarly, different wheels travel different distances even though the motors
made the same rotation.

Comment: It might be helpful to talk about the ROS Parameter Server here, or at least
reference another page. -AD


## What is the Calibration step?

We can counter this behavior by *calibrating* the wheels. A calibrated Duckiebot
sends two different signals to left and right motor such that the robot moves in
a straight line when you command it to.

The relationship between linear and angular velocity of the robot and the velocities
of left and right motors can be modeled as:

\begin{align} \label{eq:kin-calib-gain-trim-model}
    V_{\text{right}} &= (g + r) \cdot (v + \omega L ) \\
    V_{\text{left}} &= (g - r) \cdot (v - \omega L )
\end{align}

where $V_{\text{right}}$ and $V_{\text{left}}$ are the voltages applied to the two motors, $g$ is
called *gain*, $r$ is called *trim*, $v$ and $\omega$ are the linear
and the angular velocity of the robot, and $2L$ is the distance between the two
wheels. The gain parameter $g$ controls the maximum speed of the robot.
With $g > 1.0$, the vehicle goes faster given the same velocity command,
and for $g < 1.0$ it goes slower. The trim parameter $r$ controls the balance
between the two motors. With $r > 0$, the right wheel will turn slightly more
than the left wheel given the same velocity command; with $r < 0$, the left
wheel will turn slightly more the right wheel.

### The gain-trim model {#calib-gain-trim status=draft}

Odometry calibration aims at determining the parameters of a model used to describe the motion of a robot, typically through a set of measurements through which the model output can be estimated. Depending on the model used (e.g., dynamic, constrained dynamic, kinematic), different calibration parameters are determined. A typical solution to the odometry calibration problem relies on wheel encoders to determined the wheel radii and axle length using the kinematic model \eqref{eq:mod-kin-3}. We cannot use this solution in the context of Duckietown because Duckiebots are not equipped with wheel encoders.

The gain-trim model \eqref{eq:kin-calib-gain-trim-model} is obtained by considering the kinematic model of a differential drive robot along with the steady state solution of the DC motor equations, under the following assumptions:

- the wheels are equally spaced with respect to the guide point $A$, so that the axle length is $2L$,
- the wheels have different diameters: $2R_{l/r}$,
- no lateral slipping: the robot does not slip laterally,
- pure rolling: the wheels do not slip:

\[ \label{eq:calib-pure-rolling}
v_{l/r} = \dot \varphi_{l/r} R_{l/r},
\]

- the robot starts at rest ($v_l(t_0)=v_r(t_0)=0$),
- the motor's dynamics is considered at steady state, with zero initial current ($i(t_0)=0$).

Note: in the models introduced in [](#duckiebot-modeling), we instead assumed the wheels were identical.

Recalling the DC motor equations \eqref{eq:mod-dc-motor-equations}:

\begin{align} \label{eq:calib-dc-motor-equations}
V(t) &= Ri(t) + L \frac{di}{dt} + e(t) \\
e(t) &= K_b \dot \varphi(t)  \\
\tau(t) &= K_t i(t),
\end{align}

and the pure rolling constraint \eqref{eq:calib-pure-rolling}, \eqref{#calib-dc-motor-equations} can be written, in the Laplace domain, as:

TODO: finish writing

<!--
\begin{align} \label{eq:calib-dc-motor-equations}
V(t) &= Ri(t) + L \frac{di}{dt} + e(t) \\
e(t) &= K_b \dot \varphi(t)  \\
\tau(t) &= K_t i(t),
\end{align}
-->

Note: Disturbances such as the friction between wheels and ground are ignored in this simple model. For this reason, we call the robot "calibrated" as long as it falls within a neighbor of the intended final position ([](#calib-perform-the-calibration-gain-trim-model)).

## Perform the Calibration {#calib-perform-the-calibration-gain-trim-model}

### Calibrating the `trim` parameter

The trim parameter is set to $0.00$ by default, under the assumption that both
motors and wheels are perfectly identical. You can change the value of the trim
parameter by running the command:

    duckiebot $ rosservice call /![robot name]/inverse_kinematics_node/set_trim -- ![trim value]

Calibrate the trim parameter using the following steps.

#### Step 1

Make sure that your Duckiebot is ON and connected to the network.

#### Step 2

On your Duckiebot, launch the joystick process:

    duckiebot $ roslaunch duckietown joystick.launch veh:=![robot name]


#### Step 3

Use some tape to create a straight line on the floor ([](#fig:wheel_calibration_line)).

<div figure-id="fig:wheel_calibration_line" figure-caption="Straight line useful for wheel calibration">
     <img src="wheel_calibration_line.jpg" style='width: 30em'/>
</div>


#### Step 4

Place your Duckiebot on one end of the tape. Make sure that the Duckiebot is
perfectly centered with respect to the line.

#### Step 5

Command your Duckiebot to go straight for about 2 meters. Observe the Duckiebot
from the point where it started moving and annotate on which side of the tape
the Duckiebot drifted ([](#fig:wheel_calibration_lr_drift)).

<div figure-id="fig:wheel_calibration_lr_drift" figure-caption="Left/Right drift">
  <img src="wheel_calibration_lr_drift.jpg" style='width: 30em'/>
</div>

#### Step 6

Measure the distance between the center of the tape and the center of the axle of
the Duckiebot after it traveled for about 2 meters ([](#fig:wheel_calibration_measuring_drift)).

Make sure that the ruler is orthogonal to the tape.

<div figure-id="fig:wheel_calibration_measuring_drift" figure-caption="Measure the amount of drift after 2 meters run">
     <img src="wheel_calibration_measuring_drift.jpg" style='width: 30em'/>
</div>

If the Duckiebot drifted by less than $10$ centimeters you can stop calibrating
the trim parameter. A drift of $10$ centimeters in a $2$ meters run is good
enough for Duckietown. If the Duckiebot drifted by more than $10$ centimeters,
continue with the next step.


#### Step 7

If the Duckiebot drifted to the left side of the tape, decrease the value of $r$,
by running, for example:

    duckiebot $ rosservice call /![robot name]/inverse_kinematics_node/set_trim -- -0.1


#### Step 8

If the Duckiebot drifted to the right side of the tape, increase the value of
$r$, by running, for example:

    duckiebot $ rosservice call /![robot name]/inverse_kinematics_node/set_trim -- 0.1


#### Step 9

Repeat the steps 4-8.

### Calibrating the `gain` parameter

The gain parameter is set to $1.00$ by default. You can change its value by
running the command:

    duckiebot $ rosservice call /![robot name]/inverse_kinematics_node/set_gain -- ![gain value]

You won't really know if it's right until you verify it though! onto the next section

### Verify your calibration {#verify-kinematic-calibration status=recently-updated}

Construct a calibration station similar [](#fig:kinematic_calibration):

<div figure-id="fig:kinematic_calibration" figure-caption="Kinematic calibration verification setup">
     <img src="kinematic_calibration1.png" style='width: 30em'/>
     <img src="kinematic_calibration2.png" style='width: 30em'/>
</div>

The following are the specs for this 3x1 mat "runway":

 - Red line as close to the edge without crossing the interlocking bits

 - Blue/Black line 8 cm from red line and parallel to it.

 - White lines on the edge without intersecting the interlocking bits

 - Yellow line in the middle of the white lines

 - Blue/black start position is ~3-4 cm from the edge (not including the interlocking bits)


Place your robot as shown in [](#fig:kinematic_calibration).

On your robot execute:

    duckiebot $ cd ![Duckietown root]
    duckiebot $ make-hw-test-kinematics

You should see your robot drive down the lane. If it is calibrated properly, you will see a message saying that it has `PASSED`, otherwise it is `FAILED` and you should adjust your gains based on what you observe and try again.


### Store the calibration

When you are all done, save the parameters by running:

    duckiebot $ rosservice call /![robot name]/inverse_kinematics_node/save_calibration

The first time you save the parameters, this command will create the file

    ![DUCKIEFLEET_ROOT]/calibrations/kinematics/![robot name].yaml

You can add and commit it to the repository. Then you should create a pull request in the [duckiefleet repo](https://github.com/duckietown/duckiefleet)
