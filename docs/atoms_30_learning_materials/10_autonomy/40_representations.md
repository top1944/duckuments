# Representations  {#representations}

Assigned: Matt

<div class="check" markdown="1">
Required Reading: The following assumes working knowledge of 2D and 3D Cartesian coordinate systems, reference frames, and coordinate transformations. If you are not familiar with these topics, please see the chapters on [coordinate systems](#coordinate_systems), [reference frames](#reference_frames), and [coordinate transformations](#transformations).
</div>


<!--
**Discuss**:
* Introduction to the notion of *state* as a sufficient statistic that represents the agent (robot) and environment.
* Describe qualities: sufficient statistic; compact (i.e., not conveying unnecessary information); and readily interpretable.
* Define notion of *static* and *dynamic* states.
* Provide examples of robot and environment states.
-->

Robots are autonomous agents that interact with their environment. As you read through this book, you will find that shared representations of the agent (i.e., the robot) and the environment in which it operates are fundamental to a robot's ability to sense, plan, and act---the capabilities are key to making a robot a robot. Referred to as the *state*, this representation consists of a compilation of all knowledge about the robot and its environment that is *sufficient* both to perform a particular task as well as to affect the future. This knowledge is often extracted from the robot's multimodal sensor streams (e.g., wheel encoders and cameras). Consequently, one might choose to formulate the state as the collection of all of the measurements that the robot acquires over time. Indeed, the use of low-level sensor measurements as the representation of the state has a long history in robotics and artificial intelligence (cite) and has received renewed attention of-late (cite).

However, while measurement history is a sufficient representation of the robot and its operating environment, it serves as a challenging definition of state. First, raw measurements are redundant, both within a single observation and across successive measurements. For example, one doesn't need to reason over all pixels in an image let alone all pixels within successive images to understand the location of a street sign. Second, raw measurements contain a large amount of information that is not necessary for a given task (e.g., pixel intensities associated with clouds are not useful for self-driving vehicles). Third, measurement history is very inefficient: its size grows linearly with time as the robot makes new observations, and it may be computationally intractable to access and process such a large amount of data. This motivates the desire for a *minimal* representation that expresses knowledge that is both necessary and sufficient for the robot to perform a given task. More concretely, we will consider parameterized (symbolic) formulations of the state and will prefer representations that involve as small a number of parameters as possible, subject to the constraints imposed by the task.

Metric spaces (namely, Euclidean spaces) constitute the most commonly adopted state space in robotics, be it through the use of feature-based representations or gridmap representation. However, it is not uncommon to define the state of the robot and its environment in terms of a topological space or a hybrid metric-topological space.

Exteroceptive and proprioceptive sensor measurements are noisy, the models that describe the motion of the robot and environment are error-prone, and many aspects of the state are not directly observable. As a result, robots must reason over probabilistic models of the state, commonly referred to as the *belief*, in order to effectively mitigate this uncertainty.

## Robot Representations

The state of the robot is generally represented by it's *pose*, which expresses the robot's position and orientation with respect to a fixed global coordinate frame commonly referred to as the "world frame". For rigid-body robots that operate in a plane ($\mathbb{R}^2$), the pose consists of the Cartesian coordinates $(x,y)$ that specify the robot's position and the angle $\theta$ that defines it's orientation (yaw). For robots in $\mathbb{R}^3$, including some ground platforms, aerial vehicles, and underwater vehicles, the pose consists of three Cartesian coordinates $(x, y, z)$ for position, and three Euler angles (pitch, roll, and yaw) for orientation. In addition to the robot's pose, it is often useful to include its linear and angular velocities as elements of the state, resulting in an additional set of three or six parameters for robots that operate in two dimensions and three dimensions, respectively.

<!--
Define the notion of:

* *pose* for mobile robots;
* *configuration* for manipulators
* robot and joint velocities
-->

Discuss specific robot state representation for Duckietown.

## Environment Representations

The environment is often parameterized in terms of a feature-based representation that specifies the position and possibly the orientation of different objects within the environment.

Discuss:

* Difference between topological and metric environment representations;
* Details of topological representation;
* Common metric representations, notably feature-based maps and gridmaps;

### Duckietown Environment Representation

Discuss specific environment representation for Duckietown.
