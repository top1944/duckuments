# Acquiring the parts for the Duckiebot `C0` {#acquiring-parts}

The trip begins with acquiring the parts. Here, we provide a link to all bits and pieces that are needed to build a Duckiebot, along with their price tag.

In general, keep in mind that:

- The links might expire, or the prices might vary.
- Shipping times and fees vary, and are not included in the prices shown below.
- Substitutions are OK for the mechanical components,
  and not OK for all the electronics, unless you are OK in writing
  some software.
- Buying the parts for more than one Duckiebot makes each one cheaper than buying only one. 



<div class='requirements' markdown="1">

Resources necessaries:

- Cost: USD 193.50 + Shipping Fees (configuration `D17-0`)
- Time: 15 days (average shipping for cheapest choice of components)

Results:

-  A kit of parts ready to be assembled.

</div>





## Bill of materials

[//]: #   (<s>[4 Spacers (M3x5)](https://tinyurl.com/y9sjzm4r)</s><s>USD</s>)
[//]: #   (<s>[4 Screws (M3x10)](https://tinyurl.com/y9sjzm4r)</s><s>USD</s>)
[//]: #   (We can make the minimal configuration cheaper by USD20 removing the 16GB Class 10 MicroSD Card and stick with default)
<div markdown="1">

 <col2 id='materials' figure-id="tab:materials" figure-caption="Bill of materials">
    <s>[Chassis](http://www.kr4.us/magician-chassis-rob-12866.html)</s>                         <s>USD 20</s>
    <s>[Camera with 160-FOV Fisheye Lens](https://tinyurl.com/ybwrcywc)</s>                         <s>USD 22</s>
    <s>[Camera Mount](https://tinyurl.com/ybyewdrt)</s>                         <s>USD 8.50</s>
    <s>[300mm Camera Cable](https://www.adafruit.com/product/1648)</s>                         <s>USD 2</s>
    <s>[Raspberry Pi 3 - Model B](https://tinyurl.com/ycsujzb9)</s>                         <s>USD 35</s>
    <s>[Heat Sinks](https://tinyurl.com/yayj2qen)</s>                         <s>USD 5</s>
    <s>[Power supply](https://www.adafruit.com/product/1995)</s>                         <s>USD 7.50</s>
    <s>[16 GB Class 10 MicroSD Card](https://www.adafruit.com/product/2693)</s>                         <s>USD 20</s>
    <s>[Mirco SD card reader](https://www.adafruit.com/product/939)</s><s>USD 6 </s>
    <s>[Tiny 32GB USB Flash Drive](https://tinyurl.com/ycao6men)</s>                         <s>USD 12.50</s>
    <s>[Stepper Motor HAT](https://tinyurl.com/y7qurpcw)</s>                         <s>USD 22.50</s>
    <s>[Stacking Headers](https://www.adafruit.com/product/2223) 2 for `D17-1`, 1 otherwise</s>                         <s>USD 2.50/piece</s>
    <s>[Battery](https://tinyurl.com/ya7otc76)</s>                         <s>USD 20</s>
    <s>[16 Nylon Standoffs (M2.5 12mm F 6mm M](https://tinyurl.com/y9uy73b2)</s>                         <s>USD 0.05/piece</s>
    <s>[4 Nylon Hex Nuts (M2.5)](https://tinyurl.com/ydy4znem)</s>                         <s>USD 0.02/piece</s>
    <s>[4 Nylon Screws (M2.5x10)](https://tinyurl.com/ya2uo9so)</s>                         <s>USD 0.05/piece</s>
    <s>[2 Zip Ties (300x5mm)](https://tinyurl.com/yb8v3nns)</s>                         <s>USD 8.99</s>
    <s>[5-GHz Wifi Adapter](https://tinyurl.com/ycvu7ok3) (`D17-0+w`)</s><s>USD 20</s>
    <s>[Joypad](https://tinyurl.com/y9klooef) (`D17-0+j`)</s>                         <s>USD 10.50</s>
    <s>[20 Female-Female Jumper Wires (300mm)](https://www.adafruit.com/products/793) (`D17-1`)</s>                         <s>USD 8</s>
    <s>[Male-Male Jumper Wire (150mm)](https://www.adafruit.com/products/1957)  (`D17-1`)</s>                         <s>USD 1.95</s>
    <s>[LEDs](https://www.adafruit.com/product/848) (`D17-1`)</s>                         <s>USD 10</s>
    <s>[LED HAT](https://tinyurl.com/ydh9wqp5) (`D17-1`)</s><s>USD 28.20 for 3 pieces</s>
        <s>[PWM/Servo HAT](https://tinyurl.com/yd8bdl2r) (`D17-1`)</s>                         <s>USD 17.50</s>
    <s>[40 pin female header](https://www.adafruit.com/products/2222) (`D17-1`)</s>                   <s>USD 1.50</s>
    <s>[Bumpers]() (`D17-1`)</s><s>TBD (custom made)</s>
    <s>[5 4 pin female header]() (`D17-1`)</s><s>USD 0.60/piece</s>
       <s>[2 16 pin male header]() (`D17-1`)</s><s>USD 0.61/piece</s>
          <s>[12 pin male header]() (`D17-1`)</s><s>USD 0.48/piece</s>
             <s>[3 pin male header]() (`D17-1`)</s><s>USD 0.10/piece</s>
                <s>[2 pin female shunt jumper]() (`D17-1`)</s><s>USD 2/piece</s>
                   <s>[5 200 Ohm resistors]() (`D17-1`)</s><s>USD 0.10/piece</s>
                      <s>[10 130 Ohm resistors]() (`D17-1`)</s><s>USD 0.10/piece</s>
    <s>Total for `D17-0` configuration</s>                         <s>USD 191.50</s>
        <s>Total for `D17-0+w` configuration</s>                         <s>USD 211.50</s>
            <s>Total for `D17-0+j` configuration</s>                         <s>USD 222</s>
    <s>Total for `D17-1` configuration</s>                         <s>USD 281+Bumpers</s>        
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

## Raspberry Pi 3 - Model B

The Raspberry Pi is the central computer of the Duckiebot. Duckiebot version `D17` uses Model B ([](#fig:rpi3b)) (A1.2GHz 64-bit quad-core ARMv8 CPU, 1GB RAM), a small but powerful computer.

<div figure-id="fig:rpi3b" figure-caption="The Raspberry Pi 3 Model B">
     <img src="rpi3b.png" style='width: 15em'/>
</div>

The price for this in the US is about USD 35.

### Power Supply

We want a hard-wired power source (5VDC, 2.4A, Micro USB) to supply the Raspberry Pi ([](#fig:power_supply)).

<div figure-id="fig:power_supply" figure-caption="The Power Supply">
     <img src="power_supply.png" style='width: 15em'/>
</div>

The price for this in the US is about USD 5-10.

### Heat Sinks

The Raspberry Pi will heat up significantly during use. It is warmly recommended to add heat sinks, as in  [](#fig:heat_sinks). Since we will be stacking HATs on top of the Raspberry Pi with 15 mm standoffs, the maximum height of the heat sinks should be well below 15 mm. The chip dimensions are 15x15mm and 10x10mm.

<div figure-id="fig:heat_sinks" figure-caption="The Heat Sinks">
     <img src="heat_sinks.png" style='width: 15em'/>
</div>

###  Class 10 MicroSD Card

The MicroSD card ([](#fig:SDcard)) is the hard disk of the Raspberry Pi. 16 Gigabytes of capacity are sufficient for the system image.

<div figure-id="fig:SDcard" figure-caption="The MicroSD card">
     <img src="SDcard.png" style='width: 15em'/>
</div>

###  Mirco SD card reader

A microSD card reader ([](#fig:microsd-reader)) is useful to copy the system image to a Duckiebot from a computer to the Raspberry Pi microSD card, when the computer does not have a native SD card slot.

<div figure-id="fig:microsd-reader" figure-caption="The Mirco SD card reader">
     <img src="microsd-reader.png" style='width: 15em'/>
</div>

###  Tiny 32GB USB Flash Drive

This "external" hard drive ([](#fig:USBdrive)) is very convenient to store logs during experiments and later port them to a workstation for analysis. It provides storage capacity and faster data transfer than the MicroSD card.   

<div figure-id="fig:USBdrive" figure-caption="The Tiny 32GB USB Flash Drive">
     <img src="USBdrive.png" style='width: 15em'/>
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

<div figure-id="fig:long_camera_cable" figure-caption="A 300 mm camera cable for the Raspberry Pi">
     <img src="long_camera_cable.png" style='width: 15em'/>
</div>

## 5-GHz Wifi Adapter

The Edimax AC1200 EW-7822ULC 5-GHz WiFi adpater ([](#fig:edimax)) boosts the connectivity of the Duckiebot, especially useful in busy Duckietowns (e.g., classroom).

<div figure-id="fig:edimax" figure-caption="The Edimax AC1200 EW-7822ULC wifi adapter">
     <img src="edimax.png" style='width: 15em'/>
</div>

## Joypad

The joypad is used to manually remote control the Duckiebot. Any 2.4 GHz wireless controller (with a _tiny_ USB dongle) will do.

The model link in the table ([](#fig:joystick)) does not include batteries (required: 2 AA 1.5V).

<div figure-id="fig:joystick" figure-caption="A Wireless Joypad">
     <img src="joystick.png" style='width: 15em'/>
</div>

TODO: Add figure with 2 AA batteries

## DC Stepper Motor HAT

We use the DC Stepper motor HAT ([](#fig:joystick)) to control the DC motors that drive the wheels. This item will require [soldering](0_5_soldering_boards.md) to be functional. 

<div figure-id="fig:motor_hat" figure-caption="The Stepper Motor HAT">
     <img src="motor_hat.png" style='width: 15em'/>
</div>


### Stacking Headers

We use long 20x2 stacking headers ([](#figure:stacking_header)) to connect the Raspberry Pi with the other HATs, creating a stack. This item will require [soldering](0_5_soldering_boards.md) to be functional.

In configuration `D17-1`, we need 2 stacking headers.

In all configurations, we use only 1 stacking header.

<div figure-id="fig:stacking_header" figure-caption="The Stacking Headers">
     <img src="stacking_header.png" style='width: 15em'/>
</div>


## Battery

The battery ([](#fig:battery)) provides power to the Duckiebot.

We choose this battery because it has a good combination of size (to fit in the lower deck of the Magician Chassis), high output amperage (2.4A and 2.1A at 5V DC) over two USB outputs, a good capacity (10400 mAh) at an affordable price (USD 20).

<div figure-id="fig:battery" figure-caption="The Battery">
     <img src="battery.png" style='width: 15em'/>
</div>

## Standoffs, Nuts and Screws

We use non electrically conductive standoffs (M2.5 12mm F 6mm M), nuts (M2.5), and screws (M2.5x10mm) to hold the Raspberry Pi to the chassis and the HATs stacked on top of the Raspberry Pi.

In configuration `D17-0` and `D17-0+w` or `D17-0+j`, the Duckiebot requires 8 standoffs, 4 nuts and 4 screws.

In configuration `D17-1`, the Duckiebot requires 16 standoffs, 4 nuts and 4 screws.

<div figure-id="fig:stands_nuts_screws" figure-caption="Standoffs, Nuts and Screws">
     <img src="placeholder.png" style='width: 15em'/>
</div>

## Zip Tie

Two 300x5mm zip ties are going to be useful to keep the battery at the lower deck from moving around.

<div figure-id="fig:zipties" figure-caption="The zip ties">
     <img src="zipties.png" style='width: 15em'/>
</div>

## LEDs

In configuration `D17-1`, the Duckiebot is equipped with 5 RGB LEDs. LEDs can be used to signal to other Duckiebots, or just make _fancy_ patterns.

The pack of LEDs linked in the table above holds 10 LEDs, enough for two Duckiebots.

<div figure-id="fig:led" figure-caption="The RGB LEDs">
     <img src="led.png" style='width: 15em'/>
</div>

### LED HAT

In configuration `D17-1`, the LED HAT ([](#figure:led_hat)) provides an interface for our RGB LEDs and the computational stack. This board is a daughterboard for the Adafruit 16-Channel PWM/Servo HAT, and enables connection with additional gadgets such as [ADS1015 12 Bit 4 Channel ADC](https://www.adafruit.com/product/1083), [Monochrome 128x32 I2C OLED graphic display](https://www.adafruit.com/product/931), and [Adafruit 9-DOF IMU Breakout - L3GD20H+LSM303](https://www.adafruit.com/product/1714). This item will require [soldering](0_5_soldering_boards.md) to be functional.

This board is custom degined and can only be ordered in minimum runs of 3 pieces. The price scales down quickly with quantity, and lead times may be significant, so it is better to buy these boards in bulk.

<div figure-id="fig:led_hat" figure-caption="The LED HAT">
     <img src="led_hat.png" style='width: 15em'/>
</div>

### PWM/Servo HAT

In configuration `D17-1`, the PWM/Servo HAT HAT ([](#figure:servo_hat)) mates to the LED HAT and provides the signals to control the LEDs, without taking computational resources away from the Rasperry Pi itself. This item will require [soldering](0_5_soldering_boards.md) to be functional.

<div figure-id="fig:servo_hat" figure-caption="The PWM-Servo HAT">
     <img src="servo_hat.png" style='width: 15em'/>
</div>

### Male-Male Jumper Wires

In configuration `D17-1`, the Duckiebot requires one male-male jumper wire ([](#figure:mm_wires)) to power the DC Stepper Motor HAT from the PWM/Servo HAT.

<div figure-id="fig:mm_wires" figure-caption="Premier Male-Male Jumper Wires">
     <img src="mm_wires.png" style='width: 15em'/>
</div>


### Female-Female Jumper Wires

In configuration `D17-1`, 20 Female-Female Jumper Wires ([](#figure:ff_wires)) are necessary to connect 5 LEDs to the LED HAT.

<div figure-id="fig:ff_wires" figure-caption="Premier Female-Female Jumper Wires">
     <img src="ff_wires.png" style='width: 15em'/>
</div>

## Bumpers

These bumpers are designed to keep the LEDs in place and are therefore used only in configuration `D17-1`. They are custom designed parts, so they must be produced and cannot be bought. We used laser cutting facilities. Our design files are available [here].

TODO: add links to .sldprt files once confirmed final version 

<div figure-id="fig:bumpers" figure-caption="The Bumpers">
     <img src="placeholder.png" style='width: 15em'/>
</div>


## Passive Electric Components

 5 4 pin female header

 2 16 pin male header

 1 12 pin male header
 
 1 3 pin male header 

 1 2 pin female shunt jumper

 5 200 Ohm resistors

 10 130 Ohm resistors

These items will require [soldering](0_5_soldering_boards.md) to be functional.

<div figure-id="fig:headers" figure-caption="The Headers">
     <img src="placeholder.png" style='width: 15em'/>
</div>

<div figure-id="fig:resistors" figure-caption="The Resistors">
     <img src="placeholder.png" style='width: 15em'/>
</div>

TODO: Clean up 
