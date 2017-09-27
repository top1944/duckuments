# Duckiebot configurations {#duckiebot-configurations status=ready}

We define different Duckiebot configurations depending on their time of use and hardware components. This is a good starting point if you are wondering what parts you should obtain to get started. Once you have decided which configuration best suits your needs, you can proceed to the detailed descriptions for [`DB17-wjd`](#acquiring-parts-c0) or [`DB17-wjdlc`](#acquiring-parts-c1) Duckiebot.

## Configuration list

The configurations are defined with a root: `DB17-`, indicating the "bare bones" Duckiebot used in the Fall 2017 synchronized course, and an appendix `y` which can be the union (in any order) of any or all of the elements of the optional hardware set $\aset{O} = \{$`w`, `j`, `d`, `l`, `c`$\}$. A `DB17` Duckiebot can navigate autonomously in a Duckietown, but cannot communicate with other Duckiebots.

The elements of $\aset{O}$ are labels identifying hardware that aids in the development phase and enables the Duckiebot to talk to other Duckiebots. The labels stand for:

- `w`: 5 GHz wireless adapter to facilitate streaming of images;

- `j`: wireless joypad that facilitates manual remote control;

- `d`: USB drive for additional storage space;

- `l`: includes LEDs, bumpers and the necessary bits to set the LEDs in place. This hardware enables Duckiebot communications and fleet level behaviors. This is a major hardware upgrade;

- `c`: a different castor wheel to replace the preexisting one, providing an overall smoother drive.

<!--
- Configuration `DB17-w`: `DB17`, plus an additional wireless adapter.

- Configuration `DB17-j`: `DB17`, plus an additional wireless joypad for remote control.

- Configuration `DB17-d`: `DB17`, plus an additional USB drive.

- Configuration `C1`: `DB17-wjd`, plus LEDs and bumpers.
-->


## Configuration functionality

### `DB17`

This is the minimal configuration for a Duckiebot. It will be able to navigate a Duckietown, but not communicate with other Duckiebots. It is the configuration of choice for tight budgets or when operation of a single Duckiebot is more of interest than fleet behaviors.

### `DB17-w`

In this configuration, the minimal `DB17` version is augmented with a 5 GHz wireless adapter, which drastically improves connectivity enabling, e.g., streaming of images. This feature is particularly useful in connection saturated environments, e.g., classrooms.

### `DB17-j`

In this configuration, the minimal `DB17` version is augmented with a 2.4 GHz wireless joypad, used for manual remote control of the Duckiebot. It is particularly useful for getting the Duckiebot our of tight spots or letting younger ones have a drive, in addition to providing handy shortcuts to different functions in development phase.

### `DB17-d`

In this configuration, the minimal `DB17` version is augmented with a USB flash hard drive. This drive is convenient for storing videos (logs) as it provides both extra capacity and faster data transfer rates than the microSD card in the Raspberry Pi. Moreover, it is easy to unplug it from the Duckiebot at the end of the day and bring it over to a computer for downloading and analyzing stored data.

### `DB17-wjd`

This is the Duckiebot configuration that is first handed out at ETHZ during the Fall 2017 course edition. An upgrade will be provided during the course.

### `DB17-l`

In this configuration the Duckiebot in equipped with the necessary hardware for controlling and placing 5 RGB LEDs on the Duckiebot. It is the necessary configuration to enable communication between Duckiebots, hence fleet behaviors (e.g., negotiating crossing an intersection).

### `DB17-c`

In this configuration, the standard dotation castor wheel (the omnidirectional wheel on the back of the Duckiebot) is replace with a different omnidirectional wheel. The castor wheel upgrade provides a smoother ride. This configuration includes the mechanical bits necessary to mount the new castor wheel at the right height.
