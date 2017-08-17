# Symbols and conventions {#symbols-and-conventions}

Assigned: Andrea




## Conventions

If $x$ is a function of time, use $x_t$ rather than $x(t)$.

Bad: Consider the function $x(t)$.

Better: Consider the function $x_t$.

## Table of symbols

Here are some useful symbols.

<col3 figure-id='tab:spaces' figure-caption="Spaces" class='symbols labels-row1'>
    <s>command</s>
    <s>result</s>
    <s></s>

    <code>\SOthree</code>
    <s>$\SOthree$</s>
    <s>Rotation matrices</s>


    <code>\SEthree</code>
    <s>$\SEthree$</s>
    <s>Euclidean group</s>

    <code>\SEtwo</code>
    <s>$\SEtwo$</s>
    <s>Euclidean group</s>

    <code>\setwo</code>
    <s>$\setwo$</s>
    <s>Euclidean group algebra</s>
</col3>

States and poses:

<col3 figure-id='tab:states' figure-caption="Poses and states" class='symbols labels-row1'>
    <s>command</s>
    <s>result</s>
    <s></s>

    <code>\pose</code>
    <s>$\pose_t \in \SEtwo$</s>
    <s>Pose of the robot in the plane</s>

    <s><code>\state_t \in \statesp</code></s>
    <s>$\state_t \in \statesp$</s>
    <s>System state (includes the pose, and everything else)</s>
</col3>


<style>
.symbols {
    font-size: smaller;
}
.symbols td {
    text-align: left;
}
</style>
