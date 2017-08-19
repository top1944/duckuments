# Duckiebot configurations {#duckiebot-configurations}


## Configuration list

Configuration `C0`: Only camera and motors. 

Configuration `C0+w`: `C0`, plus an additional wireless adapter.

Configuration `C0+j`: `C0`, plus an additional wireless joypad for remote control.

Configuration `C0+d`: `C0`, plus an additional USB drive.

Configuration `C1`: `C0+wjd`, plus LEDs and bumpers. 


## Configuration functionality

### `C0`

This is the minimal configuration for a Duckiebot. It will be able to navigate a Duckietown, but not communicate with other Duckiebots. It is the configuration of choice for tight budgets or when operation of a single Duckiebot is more of interest than fleet behaviours.

TODO: Insert pic of assembled Duckiebot in `C0` configuration.

### `C0+w`

In this configuration, the minimal `C0` version is augmented with a 5 GHz wireless adapter, which drastically improves connectivity. This feature is particularly useful in connection saturated enviroments, e.g., classrooms.

TODO: Insert pic of assembled Duckiebot in `C0+w` configuration.

### `C0+j`

In this configuration, the minimal `C0` version is augmented with a 2.4 GHz wireless joypad, used for manual remote control of the Duckiebot. It is particularly useful for getting the Duckiebot our of tight spots or letting younger ones have a drive.

TODO: Insert pic of assembled Duckiebot in `C0+j` configuration.

### `C0+d`

In this configuration, the minimal `C0` version is augmented with a USB flash hard drive. This drive is convenient for storing videos (logs) as it provides both extra capacity and faster data transfer rates than the microSD card in the Raspberry Pi. Moreover, it is easy to unplug it from the Duckiebot at the end of teh day and bring it over to a computer for downloading and analyzing stored data.    

TODO: Insert pic of assembled Duckiebot in `C0+d` configuration.

### `C0+wjd`

The upgrades of the minimal `C0` version are not mutually exclusive. We will refer to `C0+xyz` when multiple add-ons to the minimal version are considered.

TODO: Insert pic of assembled Duckiebot in `C0+wjd` configuration.

### `C1`

This is the ultimate Duckiebot configuration and it includes the necessary hardware for controlling and placing 5 RGB LEDs on the Duckiebot. It is the necessary configuration to enable communication between Duckiebots, hence fleet behaviours (e.g., negotiating corssing an intersection).

TODO: Insert pic of assembled Duckiebot in `C1` configuration.