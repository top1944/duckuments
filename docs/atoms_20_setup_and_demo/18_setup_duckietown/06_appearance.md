# Duckietown Appearance Specification

Assigned: Liam

This document is about the specification for a conforming Duckietown. Any Duckietown not adhering to the rules described here cannot call itself a "Duckietown" since it is not one. Additionally, any Duckietown not adhering to these rules may cause the Duckiebots to fail in unexpected ways. These are a set of rules for which a functional system has been verified.

## Overview

Duckietown is built with two layers: 

1. The first is the *floor layer*. The floor is built of interconnected exercise mats with tape on them. 

2. The second layer is the *signal layer* and contains all the signs and other objects that sit on top of the mats. 

Note: he visual appearance of the area where the Duckietown is created is variable. If you discover that this appearance is causing negative performance, a "wall" of blank tiles constructed vertically can be used to reduce visual clutterl.


## Layer 1 - The Tile Layer

Each tile is a 2ft x 2ft square and is able to interlock with the others. 

There are five primary types of tiles as shown in [](#fig:tiles)

<div figure-id="fig:tiles" figure-class="flow-subfigures" figure-caption="The principal tile types in Duckietown">
    <div figure-id="subfig:straight" figure-caption="Straight tile">
        <img src="straight_tile2.png" style='width: 20ex'/>
    </div>
    <div figure-id="subfig:turn" figure-caption="Turn tile">
        <img src="90turntile.png" style='width: 20ex'/>
    </div>
    <div figure-id="subfig:3-way" figure-caption="3-way intersection tile">
        <img src="3way_tile.png" style='width: 20ex'/>
    </div>
    <div figure-id="subfig:4-way" figure-caption="4-way intersection tile">
        <img src="4way_tile.png" style='width: 20ex'/>
    </div>
    <div figure-id="subfig:empty" figure-caption="Empty tile">
        <img src="empty_tile.png" style='width: 20ex'/>
    </div>
</div>


### Tapes


There are 3 colors of tapes: white, yellow, and red. 

1. White


\begin{proposition}\label{prop:white_tape}
A Duckiebot never collides with Duckietown if it never crosses or touches a white tape strip.
\end{proposition}

Here are some facts about the white tapes:

* White tapes must be solid (not dashed)

* Width of the tape = 1in

* The white tape is always placed on the right hand side of a lane (we assume that Duckiebots drive on the right hand side of the road)

* For curved road, the white lane marker is formed by five pieces of white tape, while the inner corner is formed by three pieces, placed according to the specifications in the image below, where the edge pieces are matched to adjacent straight or curved tiles:

<div figure-id="fig:curved" figure-caption="The specification for a curved road tile">
  <img src="curved_road.png" style='width: 30em; height:auto'/>
</div>


2. Yellow

On a two-way road, the yellow tape should be dashed. Each piece should have a length of approximately **2in** with a **1in** gap separating each piece. 

Yellow tapes on curves: see curved road image in white tape section, pieces at tile edges should be in center of lane, piece at the middle of the curve should be approximately 20.5 cm from middle of inner center white piece of tape, with approximated circular arc in between.

3. Red

Red tapes MAY **only** appear on **intersection** tiles. 
 The red tape must be the full width of the duck tape roll and should cross the entire lane perpendicular to the lane.

The placement of red tape should always be **under** yellow and white tape

A Duckiebot navigates Duckietown by a sequence of:

* Navigating one or more straigh ties until a red tape appears,
* Wait for the coordination signal,
* Execute an intersection traversal,
* Relocalize in a StraightTile. 


The invariant is: if you stop before or ON the red strip, no collisions are possible.


### Topological Constraints During Map Construction

Here are some topological rule constraints that must be met:

1. An intersection comprises can NOT be adjacent to a curved road tile or another intersection tile.

2. Any two adjacent non-empty tiles must have a feasible path from one to the other **of length two** (i.e. if they are adjacent they must be connected.

Some examples of non-conforming topologies are shown in [](#fig:violates)

<div figure-id="fig:violates" figure-class="flow-subfigures" figure-caption="Some non-conforming Duckietown map topologies">
    <div figure-id="subfig:violates1" figure-caption="Topology violates rule 2 since the bottom two curved tiles are adjacent but not connected">
        <img src="violates1.pdf" style='width: 20ex;height:auto'/>
    </div>
    <div figure-id="subfig:violates2" figure-caption="Topology violates rule 1 since curved tiles are adjacent to intersection tiles ">
        <img src="violates2.pdf" style='width: 20ex;height:auto'/>
    </div>
    <div figure-id="subfig:violates3" figure-caption="Topology violates rule 2 since left-most tiles are adjacent but not connected">
        <img src="violates3.pdf" style='width: 20ex;height:auto'/>
    </div>
</div>


### Parking Lots {#parking}

Note: Experimental

A parking is a place for Duckiebots to go when they are tired and need a rest. 
A parking lot introduces three additional tile types:

1. **Parking lot entry tile**: This is similar to a straight  tile except with a red stop in the middle. The parking lot sign ([](#fig:parking)) will be visible from this stop line.
2. **Parking spot tiles**: 
TODO: the tape on these tiles is currently not yet specified.
3. **Parking spot access tiles**: 
TODO: the tape on these tiles is currently not yet specified. 

The following are the rules for a conforming parking lot:

1. One "parking spot" has size one tile. 
2. From each parking spot, there is a path to go to the parking lot entry tile that does not intersect any other parking spot. (i.e. when a duckiebot is parked, nobody will disturb it).
3. From any position in any parking spot, a Duckiebot can see at least two orthogonal lines or an sign with an april tag. TODO: this point needs further specification


### Launch Tiles {#launch-tiles}

Note: Experimental

A launch tile is used to introduce a new Duckiebot into Duckietown in a controllable way. The launch file should be places adjacent to a turn tile so that a Duckiebot may "merge" into Duckietown once the initialization procedure is complete.

TODO: Specification for tape on the launch tile

A "yield" sign should be visible from the launch tile. 

## Layer 2 - Signage and Lights

**IMPORTANT:** All signage should sit on the raised borders of the roads or be placed beside the white street markings. Under no circumstances should the white (any other tape) be obscured.

* Our signs were printed [from this file](https://drive.google.com/open?id=0B97DoIREKRoqU3RySjNWT0ZKZVU) with these specifications (Mixed B and W and Color, 1-sided, 80 White Cover) at MIT’s CopyTech.

## Traffic Signs

    Recommended: To print and assemble the signs refer to [](#signage)

### Specs

Center of signs are 13cm height with apriltags of 6.5cm sq. and a white border pasted below them. 

### Type

The allowable signs are:


<div figure-id="fig:signs" figure-caption="Duckietown Traffic Signs">
  <div figure-id="subfig:stop" figure-caption="stop">
    <img src="stop.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:yield" figure-caption="yield">
    <img src="yield.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:no-right" figure-caption="no-right-turn">
    <img src="no-right.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:no-left" figure-caption="no-left-turn">
    <img src="no-left.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:no-enter" figure-caption="do-not-enter">
    <img src="no-enter.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:one-way-right" figure-caption="oneway-right">
    <img src="one-way-right.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:one-way-left" figure-caption="oneway-left">
    <img src="one-way-left.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:4-way-intersect" figure-caption="4-way-intersect">
    <img src="4-way.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:3-way-right" figure-caption="right-T-intersect">
    <img src="3-way-right.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:3-way-left" figure-caption="left-T-intersect">
    <img src="3-way-left.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:t-intersection" figure-caption="T-intersection">
    <img src="t-intersection.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:crossing" figure-caption="pedestrian">
    <img src="crossing.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:traffic-light" figure-caption="t-light-ahead">
    <img src="traffic-light.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:duckie-crossing" figure-caption="duck-crossing">
    <img src="duckie-crossing.png" style='width:8em;height:auto'/>
  </div>
  <div figure-id="subfig:parking" figure-caption="parking">
    <img src="parking.png" style='width:8em;height:auto'/>
  </div>
</div>


Each sign is printed from the [signs and tags doc](https://www.dropbox.com/s/np72vupxodpd6gv/Signs_and_tags_V3.docx?dl=0)


### Placement

Signs may appear on the opposite side and at the corner of the adjacent tile from which they are viewed. In the absence of any signs, it is assumed that all network flows are allowed so a sign MUST be placed and visible whenever this is not the case. 

Signs must only be placed on empty tiles, or next to one of the other tile types if on the border of a map. The sign placements for four different cases are shown in [](#fig:sign-placement). At intersections, from each stop line 2 signs should be clearly visible: 1) the intersection type (traffic light or stop sign) and 2) the intersection topology. 

At present, 4-way intersections much be equipped with traffic lights for safe navigation.

<div figure-id="fig:sign-placement" figure-caption="Placement of Traffic Signs">
  <div figure-id="subfig:4-way-signs" figure-caption="4-way intersection">
    <img src="4-way-signs.pdf" style='width:15em;height:auto'/>
  </div>
  <div figure-id="subfig:3-way-signs" figure-caption="3-way intersection">
    <img src="3-way-signs.pdf" style='width:15em;height:auto'/>
  </div>
  <div figure-id="subfig:2-way-signs-straight" figure-caption="straight road">
    <img src="2-way-signs-straight.pdf" style='width:15em;height:auto'/>
  </div>
  <div figure-id="subfig:2-way-signs-turn" figure-caption="curved road">
    <img src="2-way-signs-turn.pdf" style='width:15em;height:auto'/>
  </div>
</div>

On straight and curved roads, additional signs can be added as desired. Their placement is indicated in [](#subfig:2-way-signs-straight) and [](#subfig:2-way-signs-turn). The signs should be placed at the border between two tiles and should face towards oncoming traffic as indicated. 

In these figures the arrow is the direction of the sign.


## Street Name Signs

### Specs


* Font: arial. 

* Color: Perhaps we could start with real-world settings: white as foreground and green as background.

* Border: currently no additional borders

* The rounded corners are modified into 90 degrees.

* Height: sign board height is 1.5 in. (**2.1 in**), 

* Width: Currently 4.5 in for id 500-511. (**6.1 in +1.1 in "ST" or 5.5 in + 1.7 in “AVE”**)

* Alphabet =  English upper case. Different writing systems may need different algorithms.

* Text direction: Horizontal for alphabetical languages

* The choice of street name: The names are MIT roboticists’ names (see further below) and popular street names arranged alphabetically. The Word file is [here](https://drive.google.com/open?id=0B97DoIREKRoqU3RySjNWT0ZKZVU)

### Placement

* **Similar to traffic light**: The street name should sit on a pole that is based at the corner of the tile outside of the allowable driving region. The bottom of the street name should be at a height of 7in, and allow a duckiebot to pass through. The street names should be visible from both sides of the road.

* **to help localization/SLAM**: have a street name every 2 tiles on a straight lane. **There should be a tag at least every 2 tiles but it should not be a street name sign because they are too big**

Fig: The placement of road signs on the roads. There should not be any road signs that are perpendicular to roads.

NEW UPDATE:

* Street name signs should never be perpendicular to the road - they are too big and obtrusive. 

    * **NOTE**: If a tag is required for the SLAM 1 tag per 2 tiles rule it should be one of the superfluous traffic sign tags (such as pedestrian crossing)

* Tag and sign relative position: around XXX; printed from the [signs and tags doc](https://drive.google.com/open?id=0B97DoIREKRoqU3RySjNWT0ZKZVU) 

* April tag ids and size are specified in the [April Tags DB](http://drive.google.com/open?id=1vvrkYaFktDBXyF4E_MMxx3wTX5U5S1ToQBbKSQ6uVoA)

## Localization Signs

### Specs

Localization signs contain only a tag and no traffic or road name sign. The id of these tags is specified in the [April Tags DB](http://drive.google.com/open?id=1vvrkYaFktDBXyF4E_MMxx3wTX5U5S1ToQBbKSQ6uVoA). These signs can be printed from [this document](https://drive.google.com/open?id=0B97DoIREKRoqU3RySjNWT0ZKZVU).

### Placement 

A localization tag should be placed at each corner.

Fig: The placement of localization signs. The should be placed at each corner pointing diagonally towards the center of the tile (not as shown in the figure)

## Traffic Lights

### Specs

**???**

### Placement

The lights MUST be at a height of EXACTLY 20cm  above the center of the tile.

The Pi SHOULD sit on a pole that is based at the corner of the tile outside of the allowable driving region.


## **Semantics of LEDS**

headlights: white, constant

Assumption:

- **20 fps** to do LED detection

- 1s to decide

- 3 frequencies to detect


tail lights: red, **6 hz square wave**

traffic light "GO" = green, 1 hz** square wave**

traffic light "STOP" = red, 1.5 Hz** square wave**

duckie light on top, state 0 = off 

duckie light on top, state 1 = blue, **3 Hz, square wave**

duckie light on top, state 2 = ?, **2.5 Hz square wave**

duckie light on top, state 3 = ?,** ****2 Hz square wave**

