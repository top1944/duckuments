# Assembling the Duckiebot `C0` {#assembling-duckiebot-c0}

Assigned: Shiying

Point of contact: Shiying Li

Once you have received the parts and soldered the necessary components, it is time to assemble them in a Duckiebot. Here, we provide the assembly instructions for configurations `C0+wjd`.


<div class='requirements' markdown="1">

Requires: Duckiebot `C0+wjd` parts. The acquisition process is explained in [](#acquiring-parts-c0).

Requires: Having soldered the `C0+wjd` parts. The soldering process is explained in [](#soldering-boards-c0).

Requires: Having prepared the power cable. The power cable preparation is explained in [](#power-cable-prep-c0).

Requires: Having installed the image on the MicroSD card. The instructions on how to reproduce the Duckiebot system image are in [](#duckiebot-ubuntu-image).

Requires: Time: about ??? minutes.

TODO: estimate time.

Results:  An assembled Duckiebot in configuration `C0+wjd`.

</div>

Comment: add "next step(s)" as a standard field in the requirements class? -JT

## Chassis

Open the Magician chassis package and take out the following components:


* Chassis-bottom (1x), Chassis-up (1x)
* DC Motors (2x), motor holders (4x)
* Wheels (2x), steel omnidirectional wheel (1x) or caster wheel (1x)
* All spacers and screws
* Screwdriver


<div figure-id="fig:duckiebot_components" figure-caption="Components in Duckiebot package.">
     <img src="duckiebot_components.png" style='width: 30em'/>
</div>

Note: You won’t need the battery holder and speed board holder (on the right side in [](#fig:duckiebot_components)).

### Bottom

Insert the motor holders on the chassis-bottom and put the motors as shown in the figure below (with the longest screws (M3x30) and M3 nuts).


<div figure-id="fig:motors" figure-caption=" Components for mounting the motor">
     <img src="motors.jpg" style='width: 20ex; height: auto'/>
</div>

<div figure-id="fig:scratch_motors" figure-caption=" ">
     <img src="scratch_motors.png" style='width: 20ex; height: auto'/>
</div>

<div figure-id="fig:motors1" figure-caption=" ">
     <img src="motors1.jpg" style='width: 20ex; height: auto'/>

</div>

Note: Orient the motors so that their wires are inwards, i.e., towards the center of the chassis-bottom. The black wires should be closer to the chassis-bottom to make wiring easier down the line.

Note: if your Magician Chassis package has unsoldered motor wires, you will have to solder them first. Check these instructions [make instructions for soldering motor wires]. In this case, your wires will not have the male pin headers on one end. Do not worry, you can still plug them in the stepper motor hat power terminals.

### Wheels

Plug in the wheels to the motor as follows (no screws needed):

<div figure-id="fig:scratch_wheels" figure-caption="The scratch of wheels">
     <img src="scratch_wheels.png" style='width: 30em'/>
</div>

<div figure-id="fig:wheels" figure-caption="Assembled wheels">
     <img src="wheels.jpg" style='width: 30em'/>
</div>

### Omnidirectional wheel

The Duckiebot is driven by controlling the wheels attached to the DC motors. Still, it requires a "passive" omnidirectional wheel on the back.

If you have purchased the optional caster wheel, read on to the next section.

The Magician chassis package contains a steel omnidirectional wheel, and the related standoffs and screws to secure it to the chassis-bottom part.

<div figure-id="fig:scratch_omni" figure-caption="The scratch of omni wheel">
     <img src="scratch_omni.png" style='width: 30em'/>
</div>

<div figure-id="fig:omni" figure-caption="Assembled omni wheel">
     <img src="omni.jpg" style='width: 30em'/>
</div>

#### Caster wheel


TODO: add instructions for Caster wheel assembly.


### Mounting the spacers

Put the car upright (omni wheel pointing towards the table) and arrange wires so that they go through the center rectangle. Put 4 spacers with 4 of M3*6 screws on each corner as below.

<div figure-id="fig:screws" figure-caption=" ">
     <img src="chassi_screws.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:part_A_finished" figure-caption=" ">
     <img src="part_A.jpg" style='width: 30em'/>
</div>

The bottom part of the Duckiebot's chassis is now ready. The next step is to assemble the Raspberry Pi on chassis-top part.

Comment: These spacers are not the ones provided in the box, change pic. -JT

## Assembling the Raspberry Pi, camera, and HATs


### Raspberry Pi

The first step is to fasten the nylon standoffs on the Raspberry Pi, and secure them on the top of the chassis-up part by tightening the nuts on the opposite side of the chassis-up.

<div figure-id="fig:Raspberry_pi3" figure-caption=" ">
     <img src="RPi_3.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:SideView_Raspberry_pi3" figure-caption=" ">
     <img src="side_RPi_3.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:raspi_chassis_bottom" figure-caption=" ">
     <img src="raspi_chassis_bottom.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:raspi_chassis_up" figure-caption=" ">
     <img src="raspi_chassis_up.jpg" style='width: 30em'/>
</div>


#### Micro SD card

Requires: Having the Duckiebot image copied in the Micro SD card.

Take the Micro SD card from the Duckiebox and insert its slot on the Raspberry Pi. The SD card slot is just under the display port, on the short side of the PI, on the flipside of where the header pins are.

<div figure-id="fig:microsdcard" figure-caption="The Micro SD card and SD_card readers.">
    <img src="SD_card.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:microsdcard" figure-caption="display port and inserted SD card">
    <img src="RASPI_SD.jpg" style='width: 30em'/>
</div>

### Camera


#### The Raspberry Pi end

First, identify the camera cable port on the Pi (between HDMI and power ports) and remove the orange plastic protection (it will be there if the Pi is new) from it. Then, grab the long camera cable (300 mm) and insert in the camera port. To do so, you will need to gently pull up on the black connector (it will slide up) to allow the cable to insert the port. Slide the connector back down to lock the cable in place, making sure it “clicks”.

Protip: Make sure the camera cable is inserted in the right direction! The metal pins of the cable should be in contact with the metal terminals in the camera port of the PI.

<div figure-id="fig:raspi_camera_apart" figure-caption=" ">
     <img src="raspi_camera_apart.jpg" style='width: 30em'/>
</div>

Note: Insert the cable in the right direction to connect the camera to the Raspberry Pi.

<div figure-id="fig:camera_with_long_cable" figure-caption="camera with long cable">
     <img src="ziptied_top_camera.jpg" style='width: 30em'/>
</div>



#### The camera end

If you have purchased the long camera cable, the first thing to do is removing the shorter cable that comes with the camera package. Make sure to slide up the black connectors of the camera-camera cable port in order to unblock the cable.

Take the rear part of the camera mount and use it hold the camera in place. Note that the camera is just press-fitted to the camera mount, no screws/nuts are needed.

In case you have not purchased the long camera cable, do not worry! It is still very possible to get a working configuration, but you will have little wiggling space and assembly will be a little harder.

Place the camera on the mount and fasten the camera mount on the chassis-up using M3*10 flathead screws and M3 nuts from the Duckiebox.

Protip: make sure that the camera mount is: (a) geometrically centered on the chassis-up; (b) fastened as forward as it can go; (c) it is tightly fastened. We aim at having a standardized position for the camera and to minimize the wiggling during movement.

<div figure-id="fig:camera_raspi_enssemble" figure-caption=" ">
     <img src="camera_raspi_enssemble.jpg" style='width: 30em'/>
</div>


Note: make sure that the cable is oriented in this direction (writing towards the CPU). Otherwise you will have to disassemble the whole thing later.

### Assemble chassis-bottom and chassis-up

#### Arrange the motor wires through the chassis-up, which will be connected to Stepper Motor HAT later.

<div figure-id="fig:bottom_up_enssemble" figure-caption=" ">
     <img src="bottom_up_enssemble.jpg" style='width: 30em'/>
</div>


#### Extending the intra-decks standoffs


In order to fit the battery, we will need to extend the Magician Chassis standoffs with the provided nylon standoff spacers. Grab 4 of them, and secure them to one end of the long metal standoffs provided in the Magician Chassis package.

Secure the extended standoff to the 4 corners of the chassis-bottom.  The nylon standoffs should smoothly screw in the metal ones. If you feel resistance, don’t force it or the nylon screw might break in the metal standoff. In that case, unscrew the nylon spacer and try again.


<div figure-id="fig:standoff_extender" figure-caption="4 nylon M3*5 Standoff Spacer and 4 M3*10 screws">
     <img src="extended_standoff.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:extender_chassis" figure-caption=" ">
     <img src="extender_chassis.jpg" style='width: 30em'/>
</div>


### Put a Stepper Motor HAT with 4 standoffs on the top of Raspberry Pi

The GPIO Stacking Header need to be correctly stacked into the pins before fastening the standoffs. It connects the Pi with the HAT.
Place the camera cable properly when you mount the HAT on the Raspberry Pi.


<div figure-id="fig:GPIO_header" figure-caption=" ">
     <img src="GPIO_header.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:GPIO_upview" figure-caption=" ">
     <img src="GPIO_upview.jpg" style='width: 30em'/>
</div>


### Connect the motor's wires to the terminal

#### We are using M1 and M2. The left (in robot frame) motor is connected to M1 and the right motor is connected to M2. If you have followed Part A correctly, the wiring order will look like as following pictures:
LeftMotor:Red - LeftMotor:Black - RightMotor:Black - RightMotor:Red

Note:You will need the screwdriver from the Magician Chassis package.

<div figure-id="fig:ServoHAT_wiring" figure-caption=" ">
     <img src="ServoHAT_wiring.jpg" style='width: 30em'/>
</div>


<!---
####  Find a male-male wire (power from HAT to HAT) and connect it to +5V input as below. The other end will be connected to the upper layer, which delivers the power to the motor HAT.--
<div figure-id="fig:malHead_wire" figure-caption=" ">
     <img src="malHead_wire.jpg" style='width: 30em'/>
</div>
-->

### Battery

Put the battery between the upper and lower decks of the chassis. It is recommended to, secure the battery from moving using zip ties.


<div figure-id="fig:HAT_ensemble_sideview" figure-caption=" ">
     <img src="HAT_ensemble_sideview.jpg" style='width: 30em'/>
</div>

### Joypad

For each Joypad there is a corresponding Joypad dongle. Don't lose the dongle! Otherwise you will need to buy a new Joypad.
<div figure-id="fig:joypad" figure-caption="All components in the Joypad package">
     <img src="joypad.jpg" style='width: 30em'/>
</div>

Insert the joypad dongle into one of the USB port. 
<div figure-id="fig:joypad_dongle" figure-caption="">
     <img src="joypad_dongle.jpg" style='width: 30em'/>
</div>

Insert 2AA batteries on the backside of the joypad
<div figure-id="fig:joypack_battery" figure-caption="joypad and 2AA batteries">
     <img src="joypack_battery.jpg" style='width: 30em'/>
</div>


### Connect the power cables
You are now ready to secure the prepared power wires in [](#power-cable-prep-c0). to the DC motor HAT power pins.

Connect the battery with the DC motor HAT by making sure you plug the black wire in the pin labeled with a minus: - and the red wire to the plus: + ([](#figure:final-result-power-c0)).

Arrange all the cables properly so that the Duckiebot can run on the way without barrier.

<div figure-id="fig:Stepper_cable" figure-caption="Insert the prepared power wire to DC motor HAT power pins.">
     <img src="Stepper_cable.jpg" style='width: 30em'/>
</div>


