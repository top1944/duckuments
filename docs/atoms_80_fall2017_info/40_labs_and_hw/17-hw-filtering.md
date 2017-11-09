# Homework: Lane Filtering {#homework-lane-filtering status=ready}


<div class='only-montreal'>
Montreal deadline: Nov 16, 11:00pm
</div>

Slack channel: [#ex-filtering](https://duckietown.slack.com/messages/C7W6VV7BJ)

## Follow the git policy for homeworks

Please follow the instructions on how the homework should be submitted.

See: [](#git-policy-homeworks)

## Pick your Poison

This homework is about filtering. Either replace the existing histogram lane filter with either an [Extended Kalman Filter](#exercise-filtering-ekf) **or** a [Particle Filter](#exercise-filtering-pf). If you do both you will get a bonus. 

## Setup instructions

Pull from `master` in the `Software` repo

Pull from the Duckietown (`upstream`) remote in your `exercises-fall2017` repo.

We are providing a script to change all the instances of the default robot (in this case `shamrock`) with `![YOUR_ROBOT_NAME]` to save you time. To run navigate to the `homeworks/03_filtering` directory and run:

    $ ./change_robot_name_everywhere.sh ![YOUR_ROBOT_NAME]
     
 (you're welcome...)
 
In the 
 
     `homeworks/03_filtering/![YOUR_ROBOT_NAME]/dt_filtering_![YOUR_ROBOT_NAME]` 
     
 folder, the files you need to worry about are the following:

1. `default.yaml`: this contains the parameters that will be loaded. Here's what it currently looks like:
```
 # default parameters for lane_filter/lane_filter_node
 # change to your robot name below
 filter:
 - dt_filtering_shamrock.LaneFilterPF
   - configuration:
      example1: 0.2
      # fill in params here

 #uncomment below and comment above if you are doing EKF
 #  - dt_filtering_shamrock.LaneFilterEKF
 #  - configuration:
      example2: 0.3
      #fill in other params here
```

This parameter file tells your node to automatically load the right filter. If you are working on particle filter you can leave it the way it is and just add your parameters that you need under `configuration`. If you are working on EKF, comment or delete the lines for the PF and uncomment the lines for the EKF and then add your params as needed. 

2. The other file you need to concern yourself with is in `include/dt_filtering_![YOUR_ROBOT_NAME]`, you will need to fill in the functions that are setup for you. 

## Submission

As normal, tag the TAs and instructors in a release from your repo when you are ready for your work to be evaluated.
