# `C1` (LEDs) setup {#leds status=draft}

Assigned: Shiying?



## Connecting Wires to LEDs

The LEDs are common anode type. The longest pin is called the common.
The single pin on the side of common is red channel.
The two other pins are Green and Blue channels, with the blue furthest from the common pin.

Use the long wires with two female ends. Attach one to each of the pins on the LED.

To figure out the order to connect them to the LSD hat, use the legend on the silkscreen and the information above. i.e. RX - means the red pin, CX - means the common, GX means the green, and BX means the blue. The "X" varies in number from 1-5 depending on which LED is being connected as discussed in the next section.


## Connecting LEDs to LSD Hat

Define the following names for the lights:

“top” = top light  - the “top” light is now at the bottom
fl  = front left
fr  = front right
br = back right
bl = back left


The LEDs are wired according to [](#fig:LED_connections).

<div figure-id="fig:LED_connections">
    <img src="LED_connections.png" style='width:20em; height:auto'/>
</div>

Mappings from the numbers on the LED hats to the positions shown (TOP is now the one in the middle at the front)
FR - 5
BR - 4
TOP - 3
BL - 2
FL - 1



## Running the Wires Through the Chassis


It is advised that the LED cables are routed through the positions noted in the images below before installing the bumpers:

Front Left, Front Middle, and Front Right LED Wiring suggestion:

<div figure-id="fig:bumper_figure_0">
    <img src="image_0-1.jpg" style='width:20em; height:auto'/>
</div>

Rear Left LED Wiring Suggestion:

<div figure-id="fig:bumper_figure_1">
    <img src="image_1.jpg" style='width:20em; height:auto'/>
</div>

Rear Right LED Wiring Suggestion:

<div figure-id="fig:bumper_figure_2">
    <img src="image_2.jpg" style='width:20em; height:auto'/>
</div>


##   Final LED tweaks, Confirm LED Function and Placement

Adjust the LED terminals (particularly in the front) so that they do not interfere with the wheels. This can be accomplished by bending them up, away from the treads.
