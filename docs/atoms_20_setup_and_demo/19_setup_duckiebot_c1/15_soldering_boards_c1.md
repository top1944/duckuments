# Soldering boards for `C1` {#soldering-boards-c1}

Assigned: Shiying

<div class='requirements' markdown="1">

Resources necessary:

Requires: Duckiebot `C1` parts. The acquisition process is explained in [](#acquiring-parts-c1).
The configurations are described in [](#duckiebot-configurations).

Requires: Time: ??? minutes

Results: ...

TODO: finish above

</div>



## LSD board

<img src="image_5.png" style='width: 20ex; height: auto'/>

<img src="image_6.png" style='width: 20ex; height:auto'/>


Parts list:

* 1 x 40 pin female header
* 5 x 4 pin female header
* 2 x 16 pin male header
* 1 x 12 pin male header
* 1 x 2 pin female shunt jumper
* 5 x 200 Ohm resistors
* 10 x 130 Ohm resistors
* 3 x 4 pin male header for servos

Instructions:

1. Solder all female headers to the bottom of the board. Alignment becomes easy if the  female headers are plugged into the PWM heat, and the LSD board rests on top.

2. Solder all resistors to the top of the board according to silkscreen markings.

3. Solder all male headers to the top of the board. Male header positions are outlined on the silkscreen.


## LED connection

<img src="image_11.jpg" style='width: 20ex; height: auto'/>

<img src="image_12.jpg" style='width: 20ex; height: auto'/>


Parts list:

* 4 x 6" female-female jumper cable

Instructions:

1. Connect LED accordingly to silkscreen indication on PRi 2 LSD board

2. silkscreen legend: Rx, Gx, Bx are red, green, and blue channels, accordingly, where x is the LED number; C is a common line (either common anode or common cathode)

3. For adafruit LEDs are common anode type. The longest pin is common anode. Single pin on the side of common is red channel. The two other pins are Green and Blue channels, with the blue furthest from the common pin.

4. Both types of LEDs are supported. Use shunt jumper to select either common anode (CA) or common cathode (CC) on 3-pin male header. Note, however, that all LEDs on the board must be of the same type.


## Putting everything together!

1. Stack the boards

    1. Screw the first eight standoffs into the Pi - provide hints on the location of standoffs and the suggested orientation of the boards w/r to the chassis

    2. connect the camera to the Pi [image showing the connector ?]

    3. Stack the DC/Stepper Motor HAT onto the Pi, aligning both sets of GPIO pins over each other and screw the standoffs to secure it. Try to not bend the camera connector too much during this step

    4. Stack the 16-channel PWM/Servo HAT onto the Pi, both sets of GPIO pins over each other and screw the standoffs to secure it

2. Slide the battery between the two chassis plates

3. Power the PWM/Servo HAT and Pi connecting them to the battery with the cables included in the duckie box

4. Power the DC/Stepper motor from the PWM/Servo HAT using the male-to-male cable in the duckie box, connect the positive 

5. connect the Pi to the board

6. Finished!

