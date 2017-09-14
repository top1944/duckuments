# Modern Robotic Systems {#modern-robotic-systems status=draft}

Assigned: Andrea Censi

<div class='requirements' markdown="1">

Results: The many parts of a robotic system

Results: Modern robotics development

Results: Example of cloud learning, annotators in the loop scenario.

</div>

## No robot is an island

A robot is only a small part of a modern robotic system.

We briefly discuss what we could consider the possible components of a robotic
system:

- Of course, **the robot**, which includes:

  - The hardware: actuation, sensing, computation;
  - The software;

- **The other robots** with which the robot interacts. Perhaps they just need to avoid each other; perhaps they are collaborating.

- The **other machines**. For example, a battery dock with that the
robot can use to recharge

- The **infrastructure**, including the network and off-board
storage and computation resources.

- The **people**, including:

  - The supervisor
  - The safety operator (e.g. safety driver)
  - The customers
  - ...


## Development of modern robotic systems

While robotic systems have existed for decades, modern
autonomous robotic systems are developed in a different way than
traditional robotics/automation projects.

The classical model of development is:

* design
* product development
* integration ("system integrators")
* installation
* support

Characteristics of modern robotics development model:

- continuous feedback from the users
- learning from data, acquired by the robot
- continuous integration
- incremental updates
- agile development

<!-- ### Industry 4.0

A buzzword they use in Europe -->


## Example of a modern robotic system

Let us look at an example of (part) of a modern robotic system.
The following is something that is implemented by most autonomous
vehicles developers.

As an example, consider the problem of creating an object
detection system that can learns from data including


### The cloud as component

Infinite computation

Big latency

Running simulation

or training machine learning models

### The people as components

Annotators as robot components

Examples of annotation services are:

* MightyAI
* Samasource
* ...

### Putting it all together

This system ([](#fig:modern-data)) works as follows:

1. Robot collects data during operation
2. QA person looks at the failures
5. Failures are sent to the annotators to generate training examples.
6. The annotated data becomes part of the training set.
3. Models are learned in the cloud
4. Regression tests in the cloud
3. The models are updated.


<div figure-id="fig:modern-data">
    <figcaption>Diagram for modern data-based pipeline</figcaption>

    (figure)
</div>

## Vignettes from an optimistic future

Example of blockchain application, in which the car
interacts with a service provider (e.g. cleaning service) and pays
with Bitcoin by itself.

Or, car can bids by themselves.

## Take-away points

- The robot is but a small part of a robotic system.

- Development methods have changed recently: data is very important,
  as well as delocalized computation.


## Further reading

* One of the cloud robotics papers

* Blockchain paper

* Mechanical Turk

* Examples of annotation providers

* The [Robot Design Game][rdg]


[rdg]: http://robot-design.org

<!--
## Examples in Duckietown

* A cloud-in-the-loop project is one of the projects available.


## Trade-offs and design considerations

### Centralized vs Distributed -->
