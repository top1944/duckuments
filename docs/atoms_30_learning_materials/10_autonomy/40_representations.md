# Representations  {#representations}

Assigned: Matt

<div class="check" markdown="1">
Required Reading: The following assumes working knowledge of 2D and 3D Cartesian coordinate systems, reference frames, and coordinate transformations. If you are not familiar with these topics, please see the chapters on [coordinate systems](#coordinate_systems), [reference frames](#reference_frames), and [coordinate transformations](#transformations).
</div>

**Discuss**:

* Introduction to the notion of *state* as a sufficient statistic that represents the agent (robot) and environment.
* Describe qualities: sufficient statistic; compact (i.e., not conveying unnecessary information); and readily interpretable.
* Define notion of *static* and *dynamic* states.
* Provide examples of robot and environment states.


The planning and control capabilities necessary for autonomy rely upon shared representations of the agent (i.e., the robot) and the environment in which it operates. Referred to as the *state*, this representation consists of a compilation of all knowledge about the robot and its environment that is *sufficient* both to perform a particular task as well as to predict the future. Ignoring prior information, this knowledge is often extracted from the robot's multimodal sensor streams (e.g., wheel encoders and cameras). Consequently, a natural choice is to formulate the state as the collection of all of the measurements that the robot acquires over time. Indeed, the use of low-level sensor measurements as the representation of the state has a long history in robotics and artificial intelligence (cite) and has received renewed attention of-late (cite).

However, while measurement history is a sufficient representation of the robot and its operating environment, several limitations limit its utility for planning and control. First, measurement history is redundant within individual and across successive observations. Second, the observations contain a large amount of unnecessary information (e.g., pixel intensities associated with clouds are not useful for self-driving vehicles). Third, measurement history is very inefficient: its size grows linearly with time (i.e., as the robot acquires new measurements), and it it may be computationally intractable to access and process such a large amount of data. This motivates the desire for a *minimal* representation that expresses knowledge that is both necessary and sufficient for the robot to perform a given task. More concretely, we will consider parameterized (symbolic) formulations of the state and will prefer representations that involve as small a number of parameters as possible, subject to the constraints imposed by the task.


## Preliminaries

I've created (currently empty) chapters for each of the following

* [Coordinate systems](#coordinate_systems))
* [Reference frames](#reference_frames)
* [Coordinate transformations](#transformations)

## Robot Representations

Define the notion of:

* *pose* for mobile robots;
* *configuration* for manipulators
* robot and joint velocities

Discuss specific robot state representation for Duckietown.

## Environment Representations

Discuss:

* Difference between topological and metric environment representations;
* Details of topological representation;
* Common metric representations, notably feature-based maps and gridmaps;

### Duckietown Environment Representation

Discuss specific environment representation for Duckietown.
