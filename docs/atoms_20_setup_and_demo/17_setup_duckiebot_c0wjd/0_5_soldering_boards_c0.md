# Soldering boards for `C0` {#soldering-boards-c0 status=beta}


Assigned: Shiying

<div class='requirements' markdown="1">


Requires:  Duckiebot `C0+wjd` parts. The acquisition process is explained in [](#acquiring-parts-c0). The configurations are described in [](#duckiebot-configurations).

Requires: Time: ??? minutes

Results: XXX

TODO: finish above

</div>

## General  tips


General rule in soldering: soldering the components according to the height of components - from lowest to highest.

##  Soldering on DC/Stepper Motor HAT

[Alternative instructions: how to solder on Headers and Terminal Block](https://learn.adafruit.com/adafruit-dc-and-stepper-motor-hat-for-raspberry-pi/assembly)

In this step you will need the following parts from the duckiebox:

- [GPIO Stacking Header](http://adafru.it/2223) for A+/B+/Pi 2
- [Adafruit](http://adafru.it/2348) DC and Stepper Motor HAT for Raspberry Pi - Mini Kit

### Preparing the components

Take the GPIO stacking header out of duckiebox and sort the following components from Mini Kit:

* Adafruit DC/Stepper Motor HAT for Raspberry Pi
* 2-pin terminal block (2x), 3-pin terminal block (1x)

<div figure-id="fig:GPIO_Stacking_Header" figure-caption="GPIO_Stacking_Header">
     <img src="GPIO_Stacking_Header.jpg" style='width: 20ex; height: auto'/>
</div>
<div figure-id="fig:DC/Stepper_HAT" figure-caption="DC/Stepper Motor HAT and solder components">
    <img src="DC_stepper_HAT.jpg" style='width: 20ex; height: auto'/>
</div>



### Soldering instructions

1. Make a 5 pin terminal block by sliding the included 2 pin and 3 pin terminal blocks into each other.

<div figure-id="fig:terminal_block" figure-caption="5 pin terminal_block">
   <img src="terminal_block.jpg" style='width: 20ex; height: auto'/>

</div>

2. Slide this 5 pin block through the holes just under "M1 GND M2" on the board. Solder it on (we only use two motors and do not need connect anything at the "M3 GND M4" location) ([](#figure:upview_Stepper_Motor))

3. Slide a 2 pin terminal block into the corner for power. Solder it on.
([](#figure:sideview_terminal))

4. Slide in the GPIO Stacking Header onto the 2x20 grid of holes on the edge opposite the terminal blocks and with vice versa direction ([](#figure:GPIO_HAT_orientation)). Solder it on.

Note: stick the GPIO Stacking Header from bottom to top, different orientation than terminal blocks (from top to bottom).

<div figure-id="fig:GPIO_HAT_orientation" figure-caption=" ">
   <img src="GPIO_HAT_orientation.jpg" style='width: 20ex; height: auto'/>
</div>
<div figure-id="fig:sideview_terminal" figure-caption="Side view of finished soldering DC/Stepper Motor HAT">
   <img src="sideview_Stepper_HAT.jpg" style='width: 20ex; height: auto'/>
</div>
<div figure-id="fig:upview_Stepper_Motor" figure-caption="upside view of finished soldering DC/Stepper Motor HAT">
   <img src="upview_stepper_Motor.jpg" style='width: 20ex; height: auto'/>
</div>
