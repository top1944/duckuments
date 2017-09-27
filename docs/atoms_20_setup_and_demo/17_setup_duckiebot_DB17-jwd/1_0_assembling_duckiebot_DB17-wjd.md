# Assembling the Duckiebot `DB17` {#assembling-duckiebot-c0 status=beta}

Point of contact: Shiying Li

Once you have received the parts and soldered the necessary components, it is time to assemble them in a Duckiebot. Here, we provide the assembly instructions for configurations `DB17-wjd`.

<div class='requirements' markdown="1">

Requires: Duckiebot `DB17-wjd` parts. The acquisition process is explained in [](#acquiring-parts-c0).

Requires: Having soldered the `DB17-wjd` parts. The soldering process is explained in [](#soldering-boards-c0).

Requires: Having prepared the power cable. The power cable preparation is explained in [](#power-cable-prep-c0). Note: Not necessary if you are proceeding directly to configuration C1.

Requires: Having installed the image on the MicroSD card. The instructions on how to reproduce the Duckiebot system image are in [](#duckiebot-ubuntu-image).

Requires: Time: about 40 minutes.

Results: An assembled Duckiebot in configuration `DB17-wjd`.

</div>

Comment: Notes - if we have the bumpers, at what point should we add them? I think that the battery could actually be attached before the levels of the chassis are joined. I found it hard to mount the camera (the holes weren't lining up). the long camera cable is a bit annoying - I folded it and shoved it in between two hats. We should decide if PWM hat is part of this configuration, why not leave it for now and forget about the spliced cable for the class. I found that the screwdriver that comes with the chassis kit is too fat to screw in the wires on the hat. The picture of where to put the zip tie for the battery is not very clear. need something to cut the end of the zip tie with.

Comment: In general I would recommend having diagonal pliers as well as a few mini screwdrivers at hand. Both can be obtained from a local dollar store for about 6$ total. The pliers / cutters are required either for making your own power cord or for cutting the zip ties after they've been attached to the chassis (because they are too long). The screwdrivers are required for tightening the screws on the hats after the cables have been plugged in because the chassis screwdriver is too wide for that.

## Chassis

Open the Magician chassis package [](#fig:duckiebot_components) and take out the following components:

* Chassis-bottom (1x), Chassis-up (1x)
* DC Motors (2x), motor holders (4x)
* Wheels (2x), steel omnidirectional wheel (1x)
* All spacers and screws
* Screwdriver

<div figure-id="fig:duckiebot_components" figure-caption="Components in Duckiebot package.">
     <img src="duckiebot_components.png" style='width: 30em'/>
</div>

Note: You won’t need the battery holder and speed board holder (on the right side in [](#fig:duckiebot_components)).

### Bottom

Insert the motor holders on the chassis-bottom and put the motors as shown in the figure below (with the longest screws (M3x30) and M3 nuts).

<div figure-id="fig:motors" figure-caption=" Components for mounting the motor">
     <img src="motors.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:scratch_motors" figure-caption=" ">
     <img src="scratch_motors.png" style='width: 30em'/>
</div>

<div figure-id="fig:motors1" figure-caption=" ">
     <img src="motors1.jpg" style='width: 30em'/>

</div>

Note: Orient the motors so that their wires are inwards, i.e., towards the center of the chassis-bottom. The black wires should be closer to the chassis-bottom to make wiring easier down the line.

Note: if your Magician Chassis package has unsoldered motor wires, you will have to solder them first. Check these instructions [make instructions for soldering motor wires]. In this case, your wires will not have the male pin headers on one end. Do not worry, you can still plug them in the stepper motor hat power terminals.

### Wheels

Plug in the wheels to the motor as follows (no screws needed):

<div figure-id="fig:horizontal">
    <figcaption>The instruction of assembling the wheels</figcaption>

<div figure-id="fig:scratch_wheels" figure-caption="The scratch of wheels">
     <img src="scratch_wheels.png" style='width: 30em'/>
</div>

<div figure-id="fig:wheels" figure-caption="Assembled wheels">
     <img src="wheels.jpg" style='width: 30em'/>
</div>

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

As alternative to omnidirection wheel, caster wheel has less friction.

If you have purchased caster wheel, read this section.

To assemble the caster wheel, the following materials is needed:

* caster wheel
* 4 standoffs (M3x12mm F-F, 6mm diameter)
* 8 metal screws (M3x8mm)
* 8 split lock washers

TODO: add instructions for Caster wheel assembly.


### Mounting the spacers

Put the car upright (omni wheel pointing towards the table) and arrange wires so that they go through the center rectangle. Put 4 spacers with 4 of M3x6 screws on each corner as below.

<div figure-id="fig:screws" figure-caption=" ">
     <img src="chassi_screws.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:part_A_finished" figure-caption=" ">
     <img src="part_A.jpg" style='width: 30em'/>
</div>

The bottom part of the Duckiebot's chassis is now ready. The next step is to assemble the Raspberry Pi on chassis-top part.


## Assembling the Raspberry Pi, camera, and HATs


### Raspberry Pi

Before attaching anything to the Raspberry Pi you should add the heat sinks to it. There are 2 small sinks and a big one. The big one best fits onto the processor (the big "Broadcom"-labeled chip in the center of the top of the Raspberry Pi). One of the small ones can be attached to the small chip that is right next to the Broadcom chip. The third heat sink is optional and can be attached to the chip on the underside of the Raspberry Pi. Note that the chip on the underside is bigger than the heat sink. Just mount the heat sink in the center and make sure all of them are attached tightly.

When this is done fasten the nylon standoffs on the Raspberry Pi, and secure them on the top of the chassis-up part by tightening the nuts on the opposite side of the chassis-up.


<div figure-id="fig:Raspberry_pi3_parts" figure-caption="Components for Raspberry Pi3">
     <img src="RPi_3_parts.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:Raspberry_pi3_heatsinks" figure-caption="Heat sink on Raspberry Pi3 ">
     <img src="RPi_3_heatsinks.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:SideView_Raspberry_pi3" figure-caption="Standoffs for Raspberry Pi3">
     <img src="side_RPi_3.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:raspi_chassis_bottom" figure-caption="Attach the nylon huts for the standoffs (Bottom view)">
     <img src="raspi_chassis_bottom.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:raspi_chassis_up" figure-caption="Top view of assembled Raspberry Pi3 ">
     <img src="raspi_chassis_up.jpg" style='width: 30em'/>
</div>


#### Micro SD card

Requires: Having the Duckiebot image copied in the micro SD card.

Take the micro SD card from the duckiebox and insert its slot on the Raspberry Pi. The SD card slot is just under the display port, on the short side of the PI, on the flipside of where the header pins are.

<div figure-id="fig:SD_card" figure-caption="The Micro SD card and SD card readers.">
    <img src="sd_card.jpg" style='width: 30em'/>
</div>

<div figure-id="fig:RASPI_SD" figure-caption="Display port and inserted SD card">
    <img src="sd_slot.jpg" style='width: 30em'/>
</div>

### Camera


#### The Raspberry Pi end

First, identify the camera cable port on the Pi (between HDMI and power ports) and remove the orange plastic protection (it will be there if the Pi is new) from it. Then, grab the long camera cable (300 mm) and insert in the camera port. To do so, you will need to gently pull up on the black connector (it will slide up) to allow the cable to insert the port. Slide the connector back down to lock the cable in place, making sure it “clicks”.

Protip: Make sure the camera cable is inserted in the right direction! The metal pins of the cable should be in contact with the metal terminals in the camera port of the PI.

<div figure-id="fig:raspi_camera_apart" figure-caption=" ">
     <img src="raspi_camera_apart.jpg" style='width: 30em'/>
</div>

Note: Insert the cable in the right direction to connect the camera to the Raspberry Pi.

<div figure-id="fig:camera_with_long_cable" figure-caption="Camera with long cable">
     <img src="ziptied_top_camera.jpg" style='width: 30em'/>
</div>



#### The camera end

If you have purchased the long camera cable, the first thing to do is removing the shorter cable that comes with the camera package. Make sure to slide up the black connectors of the camera-camera cable port in order to unblock the cable.

Take the rear part of the camera mount and use it hold the camera in place. Note that the camera is just press-fitted to the camera mount, no screws/nuts are needed.

In case you have not purchased the long camera cable, do not worry! It is still very possible to get a working configuration, but you will have little wiggling space and assembly will be a little harder.

Place the camera on the mount and fasten the camera mount on the chassis-up using M3x10 flathead screws and M3 nuts from the Duckiebox.

Protip: make sure that the camera mount is: (a) geometrically centered on the chassis-up; (b) fastened as forward as it can go; (c) it is tightly fastened. We aim at having a standardized position for the camera and to minimize the wiggling during movement.

<div figure-id="fig:camera_raspi_enssemble" figure-caption=" ">
     <img src="camera_raspi_enssemble.jpg" style='width: 30em'/>
</div>


Note: make sure that the cable is oriented in this direction (writing towards the CPU). Otherwise you will have to disassemble the whole thing later.

### Assemble chassis-bottom and chassis-up

Arrange the motor wires through the chassis-up, which will be connected to Stepper Motor HAT later.

<div figure-id="fig:bottom_up_enssemble" figure-caption=" ">
     <img src="bottom_up_enssemble.jpg" style='width: 30em'/>
</div>


### Extending the intra-decks standoffs

In order to fit the battery, we will need to extend the Magician Chassis standoffs with the provided nylon standoff spacers. Grab 4 of them, and secure them to one end of the long metal standoffs provided in the Magician Chassis package.

Secure the extended standoff to the 4 corners of the chassis-bottom.  The nylon standoffs should smoothly screw in the metal ones. If you feel resistance, don’t force it or the nylon screw might break in the metal standoff. In that case, unscrew the nylon spacer and try again.


<div figure-id="fig:standoff_extender" figure-caption="4 nylon M3x5 Standoff Spacer and 4 M3x10 screws">
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

We are using M1 and M2. The left (in robot frame) motor is connected to M1 and the right motor is connected to M2. If you have followed Part A correctly, the wiring order will look like as following pictures:

- Left Motor: Red
- Left Motor: Black
- Right Motor: Black
- Right Motor:Red


<div figure-id="fig:ServoHAT_wiring" figure-caption=" ">
     <img src="ServoHAT_wiring.jpg" style='width: 30em'/>
</div>

### Battery

Put the battery between the upper and lower decks of the chassis. It is strongly recommended to secure the battery from moving using zip ties.

<div figure-id="fig:HAT_ensemble_sideview" figure-caption=" ">
     <img src="HAT_ensemble_sideview.jpg" style='width: 30em'/>
</div>

### Joypad

With each joypad ([](#fig:joypad)) comes a joypad dongle ([](#fig:joypad_dongle)). Don't lose it!

<div figure-id="fig:joypad" figure-caption="All components in the Joypad package">
     <img src="joypad.jpg" style='width: 30em'/>
</div>

Insert the joypad dongle into one of the USB port of the Raspberry Pi.

<div figure-id="fig:joypad_dongle" figure-caption="">
     <img src="joypad_dongle.jpg" style='width: 30em'/>
</div>

Insert 2 AA batteries on the back side of the joypad [](#fig:joypack_battery).

<div figure-id="fig:joypack_battery" figure-caption="Joypad and 2 AA batteries">
     <img src="joypack_battery.jpg" style='width: 30em'/>
</div>

### Connect the power cables

You are now ready to secure the prepared power wires in [](#power-cable-prep-c0). to the DC motor HAT power pins.

Connect the battery with the DC motor HAT by making sure you plug the black wire in the pin labeled with a minus: `-` and the red wire to the plus: `+` ([](#figure:final-result-power-c0)).

Fix all the cables on the Duckiebot so that it can run on the way without barrier.

<div figure-id="fig:Stepper_cable" figure-caption="Insert the prepared power wire to DC motor HAT power pins.">
     <img src="Stepper_cable.jpg" style='width: 30em'/>
</div>
