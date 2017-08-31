# Computer vision basics {#CV_basics}

Assigned: Matt

For the interested reader, there are several excellent books that discuss fundamental topics in computer vision. These include (in no particular order), [Computer Vision: Algorithims and Applications](#bib:szeliski10) (available online), [Computer Vision: A Modern Approach](#bib:forsyth11) and [Multiple View Geometry in Computer Vision](#bib:hartley04).

### Computer vision: What and why?


**Topics**:

* **Objective**: Discover what is present in the world, where things are, and what actions are taking place from image sequences. In the context of robotics, this corresponds to learning a (probabilistic) world model that encodes the robot's environment, i.e., building a representation of the environment.
* History of computer vision
    * Summer Vision Project
    * OCR (license plates, signs, checks, mail, etc.)
    * Face detection
    * Structure from motion
    * Dense reconstruction
    * Augmented reality
    * Applications to self-driving cars and beyond  



### Camera and Lens Geometry

Note: We could break this up into separate sub-sections for (prospective) projection and lenses.

**Topics**:

* Pinhole cameras (tie into eclipse viewing, accidental cameras)
* Geometry of projection: equations of projection; vanishing points; weak perspective; orthographic projection;
* Lenses: Why?; first-order optics (thin lens); thick lens
* Review of 3D transformations (translation and rotation); homogeneous transformations
* Perspective projection in homogeneous coordinates


### Calibration

Note: The discussion of intrinsic and extrinsic models could be moved up to the geometry subsection

**Topics**

* Why calibration?
* Intrinsic parameters: idealized perspective projection; pixel scaling (square and non-square); offset; skew.
* Intrinsic model expressed in homogeneous coordinates
* Extrinsic parameters: translation and rotation of camera frame (non-homogeneous and homogeneous)
* Combined expression for intrinsic and extrinsic
* Calibration targets
* Calibration models


### Image filtering

**Background**: Discrete-time signal processing

Note: We currently don't have a preliminary section on signal processing and it's probably sufficient to point readers to a good reference (e.g., Oppenheim and Schafer).

**Topics**

Note: May want to stick to linear filtering

* Linear filtering and convolutions
* Oriented filters
* Convoluton
