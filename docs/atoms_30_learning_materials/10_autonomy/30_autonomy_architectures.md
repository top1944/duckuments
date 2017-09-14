# Autonomy architectures {#autonomy_architectures status=draft}


Assigned: Andrea

<div class='requirements' markdown="1">

</div>

## No robot is an island

Difference between a robot and a robotic system


Components of a robotic system:

- The robot:

  - The hardware
  - The software


- The other robots

- Other machines

- The infrastructure:
    - The network
    - The power

- The people, including:

  - The supervisor
  - The safety operator (e.g. safety driver)



## Modern robotic development

The old model of development:

* design
* product development
* integration ("system integrators")
* installation
* support

Characteristics of new model of development:

- continuous feedback from the users
- Learning from data, acquired by the robot
- continuous integration
- incremental updates

## Example of a modern data pipeline

(Example of an annotator-in-the-loop model.)

As an example, consider the problem of creating an object
detection system that learns from data.

This system ([](#fig:modern-data)) could be represented as follows:

1. Robot collects data
2. Developers develop
3. Models are learned in the cloud
4. Regression tests in the cloud
5. Failures are sent to the annotators
6. The annotated data becomes part of the training set.


<div figure-id="fig:modern-data">
    <figcaption>Diagram for modern data-based pipeline</figcaption>
    (annotation)
</div>


## Examples in Duckietown

* A cloud-in-the-loop project is one of the projects available.


## Trade-offs and design considerations

### Centralized vs Distributed
