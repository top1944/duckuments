# Computer vision basics {#CV_basics}

Assigned: Matt

### Computer vision: What and why?


**Objective**: Discover what is present in the world, where things are, and what actions are taking place from image sequences. In the context of robotics, this corresponds to learning a (probabilistic) world model that encodes the robot's environment, i.e., building a representation of the environment.


### Camera and Lens Geometry

**Topics**:

* Pinhole cameras
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
