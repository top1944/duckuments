# Acquiring the parts for the Duckiebot `C0` {#acquiring-parts}

Assigned: Jacopo



The trip begins with acquiring the parts. Here, we provide a link to all bits and pieces that are needed to build a Duckiebot, along with their price tag.

In general, keep in mind that:

- The links might expire, or the prices might vary.
- In general, substitutions are OK for the mechanical components,
  and not OK for all the electronics, unless you are OK in writing
  some software.

<div class='requirements' markdown="1">

Resources necessaries:

- Cost: USD ???
- Time: ??? days (average shipping)

Results:

-  A kit of parts ready to be assembled.

</div>





## Bill of materials

[//]: #   (<s>[4 Spacers (M3x5)](https://tinyurl.com/y9sjzm4r)</s><s>USD</s>)
[//]: #   (<s>[4 Screws (M3x10)](https://tinyurl.com/y9sjzm4r)</s><s>USD</s>)

<div markdown="1">

 <col2 id='materials' figure-id="tab:materials" figure-caption="Bill of materials">
    <s>[Chassis](http://www.kr4.us/magician-chassis-rob-12866.html)</s>                         <s>USD 20</s>
    <s>[Camera with 160-FOV Fisheye Lens](https://tinyurl.com/ybwrcywc)</s>                         <s>USD 39</s>
    <s>[Camera Mount](https://tinyurl.com/ybyewdrt)</s>                         <s>USD 8.50</s>
    <s>[300mm Camera Cable](https://www.adafruit.com/product/1648)</s>                         <s>USD 2</s>
    <s>[Raspberry Pi 3 - Model B](https://tinyurl.com/ycsujzb9)</s>                         <s>USD 35</s>
    <s>[Heat Sinks](https://tinyurl.com/yayj2qen)</s>                         <s>USD 5</s>
    <s>[Power supply](https://www.adafruit.com/product/1995)</s>                         <s>USD 7.50</s>
    <s>[Class 10 MicroSD Card](https://www.adafruit.com/product/2693)</s>                         <s>USD 20</s>
    <s>[Female/Female Jumper Wires (300mm)](https://www.adafruit.com/products/793)</s>                         <s>USD 8</s>
    <s>[Stepper Motor HAT - Mini Kit](https://tinyurl.com/y7qurpcw)</s>                         <s>USD 22.50</s>
    <s>[GPIO Stacking Headers - DC motor hat headers 2x20 Stacking Extra Long](https://www.adafruit.com/product/2223)</s>                         <s>USD 2.50</s>
    <s>[16-Channel PWM/Servo HAT for Raspberry Pi - Mini Kit](https://tinyurl.com/yd8bdl2r)</s>                         <s>USD 17.50</s>
    <s>[Battery](https://tinyurl.com/ya7otc76)</s>                         <s>USD 20</s>
    <s>[16 Nylon Standoffs (M2.5 12mm F 6mm M](https://tinyurl.com/y9uy73b2)</s>                         <s>USD 0.05/piece</s>
    <s>[4 Nylon Hex Nuts (M2.5)](https://tinyurl.com/ydy4znem)</s>                         <s>USD 0.02/piece</s>
    <s>[4 Nylon Screws (M2.5x10)](https://tinyurl.com/ya2uo9so)</s>                         <s>USD 0.05/piece</s>
    <s>[Zip Ties 300x5mm](https://tinyurl.com/yb8v3nns)</s>                         <s>USD 8.99</s>
    <s>[Joypad](https://tinyurl.com/y9klooef)</s>                         <s>USD 10.50</s>
    <s>[Premium Male/Male Jumper Wires (150mm)](https://www.adafruit.com/products/1957) `D17-1`</s>                         <s>USD 1.95</s>
    <s>[Wifi Augmenter](https://tinyurl.com/ycvu7ok3) `D17-0+w`</s><s>USD 20</s>
    <s>[LEDs](https://www.adafruit.com/product/848) `D17-1`</s>                         <s>USD 10</s>
    <s>[GPIO Header - 40 pin female header](https://www.adafruit.com/products/2222)</s>                         <s>USD 1.50</s>
    <s>[LED HAT](https://tinyurl.com/ydh9wqp5) `D17-1`</s><s>USD </s>
    <s>[Bumpers]()</s><s>USD ??</s>
    <s>Total for minimum configuration</s>                         <s>USD ??</s>
    <s>Total for fancy configuration</s>                         <s>USD ??</s>
 </col2>

</div>

<style>
#materials {
    font-size: 80%;
}
#materials TD {
    text-align: left;
}
</style>

## Chassis

We selected the Magician Chassis as the basic chassis for the robot ([](#fig:magician_chassis)).

We chose it because it has a double-decker configuration, and so
we can put the battery in the lower part.

The chassis pack includes the motors and wheels as well as the structural part.

The price for this in the US is about USD 15-30.

<div figure-id="fig:magician_chassis" figure-caption="The Magician Chassis">
     <img src="magician_chassis.jpg" style='width: 15em'/>
</div>

## Raspberry Pi 3 (RPI-3)

The RPI-3 is the central computer of the Duckiebot. Duckiebot version `D17` uses Model B ([](#fig:rpi3b)) (A1.2GHz 64-bit quad-core ARMv8 CPU, 1GB RAM), a small but powerful computer.

<div figure-id="fig:rpi3b" figure-caption="The Raspberry Pi 3 Model B">
     <img src="rpi3b.png" style='width: 15em'/>
</div>

The price for this in the US is about USD 35.

### Power Supply

We want a hard-wired power source (5VDC, 2.4A, Micro USB) to supply the RPI-3 ([](#fig:power_supply)).

<div figure-id="fig:power_supply" figure-caption="The Power Supply">
     <img src="power_supply.png" style='width: 15em'/>
</div>

The price for this in the US is about USD 5-10.

### Heat Sinks

The RPI-3 will heat up significantly during use. It is warmly recommended to add heat sinks, as in  [](#fig:heat_sinks). Since we will be stacking HATs on top of the RPI-3 with 15 mm standoffs, the maximum height of the heat sinks should be well below 15 mm. The chip dimensions are 15x15 mm and 10x10 mm.

<div figure-id="fig:heat_sinks" figure-caption="The Heat Sinks">
     <img src="heat_sinks.png" style='width: 15em'/>
</div>

###  Class 10 MicroSD Card

The MicroSD card [](#fig:SDcard)is the hard disk of the RPI-3. 16 GigaBytes of capacity are sufficient.

<div figure-id="fig:SDcard" figure-caption="The MicroSD card">
     <img src="SDcard.png" style='width: 15em'/>
</div>

## Camera

The Camera is the main sensor of the Duckiebot. Version `D17` equips a 5 Mega Pixels 1080p camera with wide field of view ($160^\circ$) fisheye lens ([](#fig:camera)).

<div figure-id="fig:camera" figure-caption="The Camera with Fisheye Lens">
     <img src="camera.png" style='width: 15em'/>
</div>

### Camera Mount

The camera mount ([](#fig:camera_mount)) serves to keep the camera looking forward at the right angle to the road (looking slightly down). The front cover is not essential.

<div figure-id="fig:camera_mount" figure-caption="The Camera Mount">
     <img src="camera_mount.png" style='width: 15em'/>
</div>

### 300mm Camera Cable

A longer (300 mm) camera cable [](#fig:long_camera_cable) make assembling the Duckiebot easier, allowing for more freedom in the relative positioning of camera and computational stack.

<div figure-id="fig:long_camera_cable" figure-caption="A 300 mm camera cable for the RPI-3">
     <img src="long_camera_cable.png" style='width: 15em'/>
</div>

## Wifi Augmenter

The Edimax AC1200 EW-7822ULC wifi adpater [](#fig:edimax) improves the interactions with the Duckiebot by improving the connectivity between Duckiebot and laptop, especially useful in crowded environments (e.g., classroom).

<div figure-id="fig:edimax" figure-caption="The Edimax AC1200 EW-7822ULC wifi adapter">
     <img src="edimax.png" style='width: 15em'/>
</div>

## Joypad

The joypad is used to manually remote control the Duckiebot. Any 2.4 GHz wireless controller (with a _tiny_ USB dongle) will do.

The model link in the table ([](#fig:joystick)) does not include batteries (2 AA 1.5V)!

<div figure-id="fig:joystick" figure-caption="A Wireless Joypad">
     <img src="joystick.png" style='width: 15em'/>
</div>

## DC Stepper Motor HAT - Mini Kit

We use the DC+Stepper motor HAT to control the motors that drive the wheels.

<div figure-id="fig:motor_hat" figure-caption="The Stepper Motor HAT">
     <img src="motor_hat.png" style='width: 15em'/>
</div>

TODO: use picture that shows only the hat without the motors

### Male-Male Jumper Wires

<div figure-id="fig:mm_wires" figure-caption="Premier Male-Male Jumper Wires">
     <img src="mm_wires.png" style='width: 15em'/>
</div>

### GPIO Stacking Headers

<div figure-id="fig:stacking_header" figure-caption="The Stacking Headers">
     <img src="stacking_header.png" style='width: 15em'/>
</div>

## 16-Channel PWM/Servo HAT for Raspberry Pi - Mini Kit

<div figure-id="fig:servo_hat" figure-caption="The PWM-Servo HAT">
     <img src="servo_hat.png" style='width: 15em'/>
</div>


TODO: use picture without any accessories


## Battery

The battery provides power to the Duckiebot.

We choose this ([](#fig:battery)) battery because it has a good combination of size (to fit in the lower deck of the Magician Chassis), high output amperage (2.4A and 2.1A at 5V DC) over two USB outputs, a good capacity (10400 mAh) at an affordable price (USD 20).

<div figure-id="fig:battery" figure-caption="The Battery">
     <img src="battery.png" style='width: 15em'/>
</div>

## Standoffs, Nuts and Screws

We use non electrically conductive standoffs (M2.5 12mm F 6mm M), nuts (M2.5), and screws (M2.5x10mm) to hold the RPI-3 to the chassis and the HATs stacked on top of the RPI-3.

In versions `D17-0` and `D17-0+w`, the Duckiebot requires 12 standoffs, 4 nuts and 4 screws.

In version `D17-1`, the Duckiebot requires 16 standoffs, 4 nuts and 4 screws.

<div figure-id="fig:stands_nuts_screws" figure-caption="Standoffs, Nuts and Screws">
     <img src="placeholder.png" style='width: 15em'/>
</div>

## Ziptie

Two long (300x5 mm) zip ties are going to be useful to keep the battery at the lower deck from moving around.

<div figure-id="fig:zipties" figure-caption="The zip ties">
     <img src="zipties.png" style='width: 15em'/>
</div>


## LEDs

In the _fancy_ version `D17-1`, the Duckiebot is equipped with 5 RGB LEDs. LEDs can be used to signal to other Duckiebots, or just make cool patterns!

The pack of LEDs linked in the table above holds 10 LEDs, enough for two Duckiebots.

<div figure-id="fig:led" figure-caption="The RGB LEDs">
     <img src="led.png" style='width: 15em'/>
</div>

### LED HAT

Daughterboard for Adafruit 16-Channel PWM / Servo HAT that enables connection with RGB LEDs, ADS1015 12 Bit, 4 Channel ADC, Monochrome 128x32 I2C OLED graphic display, and Adafruit 9-DOF IMU Breakout - L3GD20H + LSM303.

<div figure-id="fig:led_hat" figure-caption="The LED HAT">
     <img src="led_hat.png" style='width: 15em'/>
</div>

### Female-Female Jumper Wires

<div figure-id="fig:ff_wires" figure-caption="Premier Female-Female Jumper Wires">
     <img src="ff_wires.png" style='width: 15em'/>
</div>

## Bumpers

<div figure-id="fig:bumpers" figure-caption="The Bumpers">
     <img src="placeholder.png" style='width: 15em'/>
</div>


## Passive Electric Components
