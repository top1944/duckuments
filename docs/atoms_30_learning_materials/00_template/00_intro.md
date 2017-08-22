# Chapter template {#theory-chapter-template}

Assigned: Jacopo

Theory chapters benefit from a standardized exposition. Here, we define the template for these chapters.

TODO: Define new classes for:
- 'required-reading' (must read - red color), 
- 'suggested-reading' (best if read - orange)
- 'additional-reading' (for curious users - green)
- 'example' (pop-up box in soothing color (blue?) similar to 'check': stop and think about this for a second). Keep in mind that: (a) color blind people might be confused by red/green. Use additional visual cue (thick/dashed/dotted boundary boxes?); (b) book could be printed in b/w only.

## Example Title: PID control {#pid-example-theory-label}

Start with a brief introduction of the discussed topic, describing its place in the bigger picture, justifying the reading constraints/guidelines below. Write it as if the reader knew the relevant terminology. For example:

PID control is the simplest approach to making a system behave in a desired way rather than how it would naturally behave. It is simple because the measured output is directly feedbacked, as opposed to, e.g., the system's states. The control signal is obtained as a weighted sum of the tracking error (*P*roportional term), its integral over time (*I*ntegrative term) and its instantaneous derivative (*D*erivative term), from which the appellative of PID control. The tracking error is defined as the instantaneous difference between a reference and a measured system output.    

<div class="check" markdown="1">
Required Reading: Insert here a list of topics and suggested resources related to _necessary_ knowledge in order to understand the content presented. Example:

- If you are not familiar with the terminology above (system, plant, output, reference, ...), you must read: [autonomy overview](#autonomy_overview)

- If you are not familiar with how to obtain a system, you must read: 
-- [basic kinematics](#basic_kinematics)
-- [basic dynamics](#basic_dynamics).
-- [linear algebra](#linear_algebra)
-- [State space representations]()
-- [Linear Time Invariant Systems]()
-- [...]
</div>

<div class="check" markdown="1">

Suggested Reading: Insert here a list of topics and suggested resources related to _recommended_ knowledge in order to better understand the content presented. Example:

If you want to know more about the subtleties of PID control, you can read the following:

- Definitions of Stability, Performances and Robustness: [reference-7](), ...

- observability/detectability and controllability/reachability: [reference-1](), [reference-2](), ...

- Discrete time PID: [reference-4](),

- Bode diagrams: [reference-5](), ...

- Nyquist plots: [reference-6](), ...

- [...]

</div>


## Problem Definition {#theory-chapter-template-problem-def}

In this section we crisply define the problem object of this chapter. It serves as a very brief recap of exactly what is needed from previous atoms as well. E.g.

Let:

\begin{align} \label{eq:LTIsys}
\dot{\state_t} &= A\state_t+Bu_t \\
y &= C\state_t+Du_t
 \end{align}

 be the LTI model of the Duckiebot's plant, with $x \in \statesp$, $y \in \mathbb{R}^p$ and $u \in \mathbb{R}^m$. We recall ([Duckiebot Modeling]()) that:

\begin{align}
A &= \left[  \begin{array}{ccc} a_{11}  & \dots & a_{1n} \\ \vdots & \ddots & \vdots \\ a_{n1}  & \dots & a_{nn} \end{array} \right] \\ 
B &= \left[ b_1 \,\, \dots \,\, b_m \right]^T \\
C &=  \left[ c_1 \ \,\, \dots \,\, c_p \right] \\
D &= 0.
\end{align}

[...]

TODO: fix uncentered dot in $\dot{\state_t}$

as shown in ([](#figure:the-bigger-picture)).

<div figure-id="fig:the-bigger-picture" figure-caption="A classical block diagram for PID control. We like to use a lot of clear figures in the Duckiebook.">
     <img src="placeholder.png" style='width: 15em'/>
</div>

## Introduced Notions {#theory-chapter-template-notions}

### Section 1: title-1 (e.g.: Definitions)

- Definition 1: A reference signal $\tilde{y}_t \in \mathcal{L}_2(\mathcal{T})$ is ...

<div class="check" markdown="1">
Insert 'random' checks to keep the reader's attention up:
if you can't be woken up in the middle of the night and rememeber the definition of $\mathcal{L}_2(\cdot)$, read: [another math text]()
</div>

- Definition 2: [...]

### Section 2: title-2 (e.g.: Output feedback)

Now that we know what we're talking about, lets get in the meat of the problem. Here is what is happening:

[...math, math, oh math...]


### Section 3: title-3 (e.g.: Tuning the controller)

Introduce the 'synthesys through attempts' methodology (a.k.a. tweak until death)

### Section 4: title-4 (e.g.: Performance Metrics)

How do we know if the PID controller designed above is doing well? We need to define some performance metrics first:

Overshoot, Module at resonance, Settling Time, Rising Time

...

<div class="check" markdown="1">
This is a TBD 'example' class application: 

For example, when a Duckiebot 'overshoots', it means that [...] and the following will happen [...]. 
</div>

### Section N: title-N (e.g.: Saving the world with PID)

And this is how to save the world with PID...

## Examples {#theory-chapter-template-examples}

This section serves as a collection of theoretical and practical examples that can clarify part or all of the above.

### Theoretical Examples {#theory-chapter-template-examples-theory}

More academic examples

#### T-Example 1

Immagine a spring-mass-damper system...

#### T-Example M

[...]

### Implementation Examples {#theory-chapter-template-examples-code}

More Duckiebot related examples

#### I-Example 1


#### I-Example M

[...]

TODO: It might make sense to decouple the examples from the the theory (as we are doing for the exercises), as an example may be explanatory for different theory chapters.

## Pointers to Exercises {#theory-chapter-template-exercises-pointers}

Here we just add references to the suggested exercises, defined in the appropriate [exercise chapters](#part:exercises). 


## Conclusions

- What did we do? (recap)
- What did we find? (analysis)
- Why is it useful? (synthesis)
- Final Conclusions (what have we learned)

## Next Steps

Strong of this new knowledge (what have we learned), we can now [...].

<div class="check" markdown="1">

Further Reading: insert here reference resources for the interested reader:

- learn all there is to know about PID: [Isidori-1]()
- become a linear algebra master: [Matrix cookbook](http://www2.imm.dtu.dk/pubdb/views/edoc_download.php/3274/pdf/imm3274.pdf)
- [...]
</div>


## References {#bibliography-example-theory-label}

The external references mentioned in this chapter should be listed here.

[1] Crazy math paper with lots of arguable math, _W. L. Mathematics_, Nasty Journal, vol. 1, pg. 1-99, 2001.

[2] Isidori-1, ....

[3] Matrix cookbook

TODO: How to implement scalable difficulty? Suggestion: lets start from the graduate level that we need. We will then create seperate files for the 'undergrad' and 'high-school' versions, simplfying the 'graduate' level files.

TODO: auto-compilation of references section


TODO: add "next" in top right corner of every page


TODO: add "click to enlarge pic" functionality


