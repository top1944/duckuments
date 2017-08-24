# Assembling the Duckiebot `C0` {#assembling-duckiebot-c0}  
This document provides detailed instructions for assembling the Duckiebot.

Assigned: Shiying

<div class='requirements' markdown="1">

Requires: Duckiebot `C0+wjd` parts. The acquisition process is explained in [](#acquiring-parts-c0).

Requires: Having soldered the `C0+wjd` parts. The soldering process is explained in [](#soldering-boards-c0).

Requires: Having prepared the power cable. The power cable preparation is explained in [](#power-cable-prep-c0).

Requires: Time: about ??? minutes.

TODO: estimate time.

Results:  An assembled Duckiebot in configuration `C0+wjd`.

</div>

# Part A - Assembling the car - bottom part
Open the Duckiebox package (magician chassis – DG007), and you won’t need them all. Take out the following materials:
* Chassis-bottom, Chassis-up (1+1 pieces)
* Motor (2 pieces), motor holders (4 pieces)
* Wheels (2 pieces), Omni wheel (1 pieces)
* all Spacers and screw inside of the packages. Screwdriver (1x)

![duckiebot_components](https://github.com/Shiying99/duckietown_photos/blob/master/duckiebot_components.PNG)
_Figure: Components in Duckiebot package.  **Note**: You won’t need the battery holder and speed board holder (on the right side). Ignore the speed board holder in the image._

<br><br>

## 1. Motor + chassis bottom
Insert motor holders on the chassis-bottom and put the motors as below (with the longest screws M3*30 and M3 nuts). Ignore the speed board holder in the image.

![motors](https://github.com/Shiying99/duckietown_photos/blob/master/motors.jpg)
_Figure: Components for mounting the motor_

![scratch_motors](https://github.com/Shiying99/duckietown_photos/blob/master/scratch_motors.png)
![motors1](https://github.com/Shiying99/duckietown_photos/blob/master/motors1.jpg)
_**Note 1**: Orient the motors so that its wires are inward (toward the center of the chassis-bottom) and the black wires are closer to the chassis-bottom. This makes wiring easier later._

_**Note 2**: if your Magician Chassis package has unsoldered motor wires, you will have to solder them first. Check these instructions [make instructions for soldering motor wires]. In this case, your wires will not have the male pin headers on one end. Do not worry, you can still plug them in the stepper motor hat power terminals._

<br><br>

## 2. Assemble the wheels
Plug in the wheels to the motor as follows (no screws needed):

![scratch_wheels](https://github.com/Shiying99/duckietown_photos/blob/master/scratch_wheels.png)
![wheels](https://github.com/Shiying99/duckietown_photos/blob/master/wheels.jpg)

<br><br>

## 3. Assemble the omni wheels

![scratch_omni](https://github.com/Shiying99/duckietown_photos/blob/master/scratch_omni.png)
![omni](https://github.com/Shiying99/duckietown_photos/blob/master/omni.jpg)

<br><br>

## 4. Put the spacers on the chassis
Put the car upright (omni wheel pointing towards the table) and arrange wires so that they go through the center rectangle. Put **4 spacers with 4 of M3*6 screws** on each corner as below.

![screws](https://github.com/Shiying99/duckietown_photos/blob/master/chassi_screws.jpg)
![part_A_finished](https://github.com/Shiying99/duckietown_photos/blob/master/part_A.jpg)

<br><br>

**We now have a complete bottom part! Don’t put the chassis-up yet. We will put a Raspberry Pi on it first.**

<br><br>


# Part B - Assembling the RPI-3, camera, and HATs
**Materials:**
* Chassis-up,
* Camera and camera mount,
* M3*10 flathead screws and M3 nuts from the Duckiebot package.
* 4 M-F Nylon M3x5+6mm standoff spacers, 3x0.5mm screws, Nylon nuts
* Raspberry Pi 3 – Model B
* Soldered PWM/Servo HAT and Soldered Stepper Motor HAT,
* 1 Male-male wire,
* Standoffs


















