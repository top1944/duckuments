# Soldering boards for `C0` {#soldering-boards-c0}

Assigned: Shiying

<div class='requirements' markdown="1">

Resources necessary:

Requires:  Duckiebot `C0+wjd` parts. The acquisition process is explained in [](#acquiring-parts-c0). The configurations are described in [](#duckiebot-configurations).

Requires: Time: ??? minutes

Results:

- ...

TODO: finish above

</div>


##  DC/Stepper Motor Hat 
([adafruit directions](https://learn.adafruit.com/adafruit-dc-and-stepper-motor-hat-for-raspberry-pi/assembly))

Parts:

- [GPIO Stacking Header](http://adafru.it/2223) for A+/B+/Pi 2
- [Adafruit](http://adafru.it/2348) DC and Stepper Motor HAT for Raspberry Pi - Mini Kit


<img src="image_0.jpg" style='width: 20ex; height: auto'/>

<img src="image_1.jpg" style='width: 20ex; height: auto'/>

Instructions:

1. Make a 5 pin terminal block by sliding the included 2 pin and 3 pin terminal blocks into each other.

<img src="image_2.jpg" style='width: 20ex; height: auto'/>


2. Slide this 5 pin block through the holes just under "M1 GND M2" on the board. Solder it on (we only use two motors and do not need connect anything at the "M3 GND M4" location)

3. Slide a 2 pin terminal block into the corner for power. Solder it on.

4. Slide in the GPIO Stacking Header onto the 2x20 grid of holes on the edge opposite opposite the terminal blocks. Solder it on.

## 16-channel PWM/Servo HAT 
([adafruit directions](https://learn.adafruit.com/adafruit-16-channel-pwm-servo-hat-for-raspberry-pi/))

Parts:

- [GPIO Stacking Header](http://adafru.it/2223) for A+/B+/Pi 2
- [Adafruit](http://adafru.it/2327) 16-Channel PWM / Servo HAT for Raspberry Pi - Mini Kit 

<img src="image_3.jpg" style='width: 20ex; height: auto'/>

<img src="image_4.jpg" style='width: 20ex; height: auto'/>


Instructions 

1. Solder the GPIO Stacking Header at the top of the board, where the 2x20 grid of holes is located. 

2. Solder the 2 pin terminal block next to the power cable jack

3. Solder the four 3x4 headers onto the edge of the HAT, below the words "Servo/PWM Pi HAT!"

