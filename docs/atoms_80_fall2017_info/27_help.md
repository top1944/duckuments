# Getting and giving help {#help}

## *Who* to ask for help

### Primary points of contact

The organization chart ([](#org-sheets)) lists the primary contact for each area.

<!--
For each topic, there are three columns: a "manager", a point of contact for the Americas,
and a point of contact for Europe.

The manager is the person in charge of keeping track of the status of the area.
(There might be other people working on that area/functionality, but they are not listed there.)

The points of contact are the people that are responsible to answer questions from the students.
There is 2, so one is awake at all times.

Note that if you are in Europe, it is fine to ask for help to the Americas point of contact,
and vice versa. It's all a big class.

On each rows, there is also a pointer to the appropriate Slack channel, if any, to discuss. -->


### Point of contacts for specific documents

Certain documents have specific points of contacts, listed at the top.
These override the listing in the organization chart.


## *How* to ask for help

The ways that we will support each other will depend on the type of situation. Here we will enumerate the different cases. Try to figure out which case is the most appropriate and act accordingly. These are ordered roughly in order of increasing severity.

### Case: You find a mistake in the documentation
Action: Please fix it. 

The goal for the instructions is that anybody is able to follow them.
Last year, we managed to have two 15-year-old students
reproduce the Duckiebot from instructions.

See: How to edit the documentation is explained in [](#part:contribute).
In particular, the notation on how to insert a comment is explained in [](#notes-and-questions).

Note that because we use Git, we can always keep track of changes, and there is no risk of causing damage.

If you encounter typos, feel free to edit them directly.

Feel free to add additional explanations.

One thing that is very delicate is dealing with mistakes in the instructions.

A few times the following happened: there is a sequence of commands `cmd1;cmd2;cmd3`
and `cmd2` has a mistake, and `cmd2b` is the right one, so that the sequence
of commands is `cmd1;cmd2b;cmd3`. In those situations we first just corrected
the command `cmd2`.

However, that created a problem: now half of the students had used `cmd1;cmd2;cmd3`
and half of the students had used `cmd1;cmd2b;cmd3`: the states had diverged.
Now chaos might arise, because there is the possibility of "forks".

Therefore, if a mistaken instruction is found, rather than just fixing the mistake,
please add an addendum at the end of the section.

For example: "Note that instruction `cmd2` is wrong; it should be `cmd2b`. To fix
this, please enter then command `cmd4`".

Later, when everybody has gone through the instructions, the mistake is
fixed and the addendum is deleted.


### Case: You find the instructions unclear and you need clarification

Action: Ask for clarification on the appropriate Slack channel. For a list of slack channels that could be helpful see [](#slack_channels). Once the ambiguity is clarified to your satisfaction, either you or the appropriate staff member should update the documentation if appropriate. For instructions on this see [](#part:contribute).

### Case: You understand the instructions but you are blocked for some reason

Action: This is more serious than the previous. 
Open an issue [on the `duckiefleet-fall2017` github page](https://github.com/duckietown/duckiefleet-fall2017/issues). Once the issue is resolved, either you or the appropriate staff member should update the documentation if appropriate. For instructions on this see [](#part:contribute).


### Case: You are having a technical issue related to building the documentation

Action: Open an issue [on the `duckuments` github page](https://github.com/duckietown/duckuments/issues) and provide all necessary information to reproduce it.

### Case: You have found a well-defined defect in the software.

Action: open an issue
[on the  `Software` repository github page](https://github.com/duckietown/Software/issues) and provide all necessary information for reproducing the bug.
