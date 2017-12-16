
#  Smart City Demo {#smart-city-demo status=beta}

This demo describes how to implement the power grid for the Duckietown and reproduce the results from the painted-line experiments.

## Power Grid {#powergrid-demo}

The power grid described and implemented for this demo consists of running power cables through the foam tiles throughout the city. The power cables are connected to each other at the corners of the tiles, which prevents them from interfering with the roads of Duckietown. The corner junctions have a power adapter that rests on top of the tile so Duckietown devices can easily access the power grid.

The power grid topology that we designed consists of running the power grid parallel to the streets. This ensures that there is always power on the side of the road (the most likely spot to put a peripheral device such as a traffic light). We also run power lines underneath the intersections, which provides power to the inner parts of the Duckietown and also prevents any potential power islands (parts of the town that are enclosed by roads). There are many other power topologies that could work well, such as running parallel power lines through the town. In addition, you can also create multiple separate power grids if your power requirements exceed the power ratings for a single grid.

### Parts List:

* 14 AWG 2-Conductor Speaker Wire - https://www.amazon.com/Mediabridge-14AWG-2-Conductor-Speaker-Black/dp/B01M2XEV0G/
* Wire Connectors - The wire connectors we ordered did not work well and so for our experiments we simply twisted the wire strands together and added electrical tape - I would recommend something like this (though the number of positions required per intersection depends on the power grid topology) - http://www.newark.com/wago/222-413/terminal-block-pluggable-3-position/dp/28K2061?MER=bn_level5_5NP_EngagementRecSingleItem_1
* 5.5 x 2.1mm Barrel Power Connectors - https://www.amazon.com/inShareplus-Barrel-Connector-Adapter-Security/dp/B01IBFNQP6?th=1
* Power Supply - (We used a power supply from a Physics lab on campus. We used a 24V, 10amp power supply, but you should get a power supply that meets your power requirements for your Duckietown)


### Tools List:

* Wire stripper
* Exacto knife
* Electrical tape
* Screwdriver

### Assembly Instructions:

* Cut power wires (1 red, 1 black) to length of tile + 2 extra inches
* Cut 2 inch wires (1 red, 1 black) for connecting to power adapter
* Connect 2 neighboring tiles and flip them upside down
* Use exacto knife to cut a slot in tile along the edges. (We did 2 passes with the exacto knife and ended with a slot approximately ¾ the thickness of the tile.)
* Insert power cable into slot so that the power cable sits completely in the slot. (Similar to the picture below except slot should be on the bottom of the tile, instead of the top).
* At an intersection, once all of the connecting tiles have wires, insert the red wires into 1 power connector, and insert the black wires into another power connector (remember to insert the short 2 inch wires into their respective power connectors as well).
* Remove one of the tile teeth near the intersection to place the power connectors (make sure to not remove a tile tooth that will be part of the road or the white road tape).
* Put the power connectors into the hole from the removed tooth so that they do not stick up above the tile.
* Connect a power connector to the 2 short wires so that it looks like the picture below.
* (Optional) 3D print a cover for the power adapter that hides it when not in use for aesthetic purposes. (We used a 3D printed fire hydrant based on this model https://www.thingiverse.com/thing:2437446)
* Test the newly added power line and power connector before continuing
* Repeat process for the rest of the tiles in the Duckietown

![image1](image1.png)
![image2](image2.png)

## Painted Tiles {#painted-tiles-demo}

TODO: add link to Marco Erni's design files for tape templates.

The spray paint masks were made using the tape template fabricated by ETHZ, cutting into the mask where the tape should be placed. The heavier and more rigid the mask, the better. When painting outside, we found it useful to use a second mask to cover non sprayed regions to prevent cross contamination from wind or other environmental effects.

Our results show that the type of paint, matte versus glossy, have no impact on the quality of data produced by the line segment node. The matte paint did spray more consistently, dried faster, and minimized smearing into the textured groves of the tile.


## References {#external-references-demo}

For more information: [Link to Final Presentation](https://docs.google.com/presentation/d/1b8xOznpHaN1j9hC0-xy7wOa3SSZ2TfBAgZ4LjE8_8G4/edit?usp=sharing).

TODO: remove link from Google docs
