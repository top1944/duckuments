# Assembling the Duckiebot `C0` {#assembling-duckiebot-c0}
This document provides detailed instructions for assembling the Duckiebot.

Assigned: Shiyingn Li

<div class='requirements' markdown="1">

Requires: Duckiebot `C0+wjd` parts. The acquisition process is explained in [](#acquiring-parts-c0).

Requires: Having soldered the `C0+wjd` parts. The soldering process is explained in [](#soldering-boards-c0).

Requires: Having prepared the power cable. The power cable preparation is explained in [](#power-cable-prep-c0).

Requires: Time: about ??? minutes.

TODO: estimate time. 

Results:  An assembled Duckiebot in configuration `C0+wjd`.

</div>

## Part A - Assembling the car - bottom part


Open the Duckiebox package (magician chassis DG007), and you won’t need them all. Take out the following materials:

* Chassis-bottom, Chassis-up (1+1 pieces)
* Motor (2 pieces), motor holders (4 pieces)
* Wheels (2 pieces), Omni wheel (1 pieces)
* all Spacers and screw inside of the packages. Screwdriver (1x)


<div figure-id="fig:duckiebot_components" figure-caption="Components in Duckiebot package.">
    <img src="duckiebot_components.png" style='width: 15em'/>
</div>

_**Note**: You will not need the battery holder and speed board holder (on the right side). Ignore the speed board holder in the image._

<br/><br/>

### Motor + chassis bottom
Insert motor holders on the chassis-bottom and put the motors as below (with the longest screws M3*30 and M3 nuts). Ignore the speed board holder in the image.


<div style="float: left;" figure-id="fig:motors" figure-caption="Components for mounting the motor">
    <img src="motors.jpg" style='width: 15em'/>
</div>

<div style="float: right;" figure-id="fig:scratch_motors" figure-caption="The scratch of motors" >
    <img src="scratch_motors.png" style='width: 15em'/>
</div>


<div figure-id="fig:motors1" figure-caption="Assembled motors, make sure the orientation of the motors">
     <img src="motors1.jpg" style='width: 15em'/>
</div>

_**Note 1**: Orient the motors so that its wires are inward (toward the center of the chassis-bottom) and the black wires are closer to the chassis-bottom. This makes wiring easier later._

_**Note 2**: if your Magician Chassis package has unsoldered motor wires, you will have to solder them first. Check these instructions [make instructions for soldering motor wires]. In this case, your wires will not have the male pin headers on one end. Do not worry, you can still plug them in the stepper motor hat power terminals._

<br/><br/>

### Assemble the wheels
Plug in the wheels to the motor as follows (no screws needed):

<div figure-id="fig:scratch_wheels" figure-caption="The scratch of wheels">
     <img src="scratch_wheels.png" style='width: 15em'/>
</div>

<div figure-id="fig:wheels" figure-caption="Assembled wheels">
     <img src="wheels.jpg" style='width: 15em'/>
</div>

<br/><br/>

### Assemble the omni wheels

<div figure-id="fig:scratch_omni" figure-caption="The scratch of omni wheel">
     <img src="scratch_omni.png" style='width: 15em'/>
</div>

<div figure-id="fig:omni" figure-caption="Assembled omni wheel">
     <img src="omni.jpg" style='width: 15em'/>
</div>

<br/><br/>

### Put the spacers on the chassis
Put the car upright (omni wheel pointing towards the table) and arrange wires so that they go through the center rectangle. Put **4 spacers with 4 of M3*6 screws** on each corner as below.

<div figure-id="fig:screws" figure-caption=" ">
     <img src="chassi_screws.jpg" style='width: 15em'/>
</div>

<div figure-id="fig:part_A_finished" figure-caption=" ">
     <img src="part_A.jpg" style='width: 15em'/>
</div>

<br/><br/>

**We now have a complete bottom part! Don’t put the chassis-up yet. We will put a Raspberry Pi on it first.**

<br/><br/>


## Part B - Assembling the RPI-3, camera, and HATs

**Materials:**

* Chassis-up,
* Camera and camera mount,
* M3*10 flathead screws and M3 nuts from the Duckiebot package.
* 4 M-F Nylon M3x5+6mm standoff spacers, 3x0.5mm screws, Nylon nuts
* Raspberry Pi 3 – Model B
* Soldered PWM/Servo HAT and Soldered Stepper Motor HAT,
* 1 Male-male wire,
* Standoffs


### Raspberry Pi

Fasten 8 standoffs firstly on a Raspberry Pi and put them on the top of the chassis-up. Then fasten 4 nylon nuts on the opposite side.

<div figure-id="fig:Raspberry_pi3" figure-caption=" ">
     <img src="RPi_3.jpg" style='width: 15em'/>
</div>

<div figure-id="fig:SideView_Raspberry_pi3" figure-caption=" ">
     <img src="side_RPi_3.jpg" style='width: 15em'/>
</div>

<div figure-id="fig:raspi_chassis_bottom" figure-caption=" ">
     <img src="raspi_chassis_bottom.jpg" style='width: 15em'/>
</div>

<div figure-id="fig:raspi_chassis_up" figure-caption=" ">
     <img src="raspi_chassis_up.jpg" style='width: 15em'/>
</div>


#### SD card

Take the Micro SD card from the Duckiebox and insert it in the right slot on the Raspberry Pi. The SD card slot is just under the display port, on the short side of the PI, on the flipside of where the header pins are.

TODO: Insert picture showing where to plug in the SD card

### Camera
#### The Pi end

First, identify the camera cable port on the Pi (between HDMI and power ports) and remove the orange plastic protection (it will be there if the Pi is new) from it. Then, grab the long camera cable (300 mm) and insert in the camera port. To do so, you will need to gently pull up on the black connector (it will slide up) to allow the cable to insert the port. Slide the connector back down to lock the cable in place, making sure it “clicks”.

Protip: Make sure the camera cable is inserted in the right direction! The metal pins of the cable should be in contact with the metal terminals in the camera port of the PI. 

<div figure-id="fig:raspi_camera_apart" figure-caption=" ">
     <img src="raspi_camera_apart.jpg" style='width: 15em'/>
</div>

_**Notice**: Insert the cable in the right direction to connect the camera to the Raspberry Pi._



#### The camera end

If you have purchased the long camera cable, the first thing to do is removing the shorter cable that comes with the camera package. Make sure to slide up the black connectors of the camera-camera cable port in order to unblock the cable.

Take the rear part of the camera mount and use it hold the camera in place. Note that the camera is just press-fitted to the camera mount, no screws/nuts are needed.

In case you have not purchased the long camera cable, do not worry! It is still very possible to get a working configuration, but you will have little wiggling space and assembly will be a little harder. 

Place the camera on the mount and fasten the camera mount on the chassis-up using M3*10 flathead screws and M3 nuts from the Duckiebox. 

**Protip**: make sure that the camera mount is: (a) geometrically centered on the chassis-up; (b) fastened as forward as it can go; (c) it is tightly fastened. We aim at having a standardized position for the camera and to minimize the wiggling during movement.

<div figure-id="fig:camera_raspi_enssemble" figure-caption=" ">
     <img src="camera_raspi_enssemble.jpg" style='width: 15em'/>
</div>


_**Notice**: make sure that the cable is oriented in this direction (writing towards the CPU). Otherwise you will have to disassemble the whole thing later._

### Assemble chassis-bottom and chassis-up

#### Arrange the motor wires through the chassis-up, which will be connected to Stepper Motor HAT later.

<div figure-id="fig:bottom_up_enssemble" figure-caption=" ">
     <img src="bottom_up_enssemble.jpg" style='width: 15em'/>
</div>


#### Extending the intra-decks standoffs


In order to fit the battery, we will need to extend the Magician Chassis standoffs with the provided nylon standoff spacers. Grab 4 of them, and secure them to one end of the long metal standoffs provided in the Magician Chassis package. 

Secure the extended standoff to the 4 corners of the chassis-bottom.  The nylon standoffs should smoothly screw in the metal ones. If you feel resistance, don’t force it or the nylon screw might break in the metal standoff. In that case, unscrew the nylon spacer and try again.


<div figure-id="fig:standoff_extender" figure-caption=" ">
     <img src="standoff_extender.jpg" style='width: 15em'/>
</div>

<div figure-id="fig:extender_chassis" figure-caption=" ">
     <img src="extender_chassis.jpg" style='width: 15em'/>
</div>


### Put a Stepper Motor HAT with 4 standoffs on the top of Raspberry Pi

The GPIO Stacking Header need to be correctly stacked into the pins before fastening the standoffs. It connects the Pi with the HAT. 
Place the camera cable properly when you mount the HAT on the Raspberry Pi.


<div figure-id="fig:GPIO_header" figure-caption=" ">
     <img src="GPIO_header.jpg" style='width: 15em'/>
</div>

<div figure-id="fig:GPIO_upview" figure-caption=" ">
     <img src="GPIO_upview.jpg" style='width: 15em'/>
</div>


### Connect the motor's wires to the terminal

#### We are using M1 and M2. The left (in robot frame) motor is connected to M1 and the right motor is connected to M2. If you have followed Part A correctly, the wiring order will look like as following pictures:
LeftMotor:Red - LeftMotor:Black - RightMotor:Black - RightMotor:Red


####  Find a male-male wire (power from HAT to HAT) and connect it to +5V input as below. The other end will be connected to the upper layer, which delivers the power to the motor HAT.

_*Notice:*You will need the screwdriver from the Magician Chassis package._

<div figure-id="fig:ServoHAT_wiring" figure-caption=" ">
     <img src="ServoHAT_wiring.jpg" style='width: 15em'/>
</div>

<div figure-id="fig:malHead_wire" figure-caption=" ">
     <img src="malHead_wire.jpg" style='width: 15em'/>
</div>

### PWM HAT
Put a Servo/PWM Pi HAT board (in your Duckiebox) with 4 standoffs. Connect the male-male wire to +5V output.


<div figure-id="fig:HAT_ensemble" figure-caption=" ">
     <img src="HAT_ensemble.jpg" style='width: 15em'/>
</div>

### Battery

Put the battery between the upper and lower decks of the chassis. It is recommended to, secure the battery from moving using zip ties.


<div figure-id="fig:HAT_ensemble_sideview" figure-caption=" ">
     <img src="HAT_ensemble_sideview.jpg" style='width: 15em'/>
</div>

### Joypad

TODO: Connect the joypad dongle
TODO: Insert 2AA batteries in the joypad
TODO: Insert relevant pics


### Connect the power cables
Connect power cables (USB A to 5mm cable in your Duckiebox and USB cable in the battery box). Arrange all the cables properly so that the Duckiebot can run on the way without barrier. 

<div figure-id="fig:powerbank_motor_cable" figure-caption=" ">
     <img src="powerbank_motor_cable.jpg" style='width: 15em'/>
</div>

<div figure-id="fig:cable_wiring" figure-caption="TODO: will be replace by a new pic">
     <img src="cable_wiring.jpg" style='width: 15em'/>
</div>


**Now the assembly part is finished! Let’s move to next step!**