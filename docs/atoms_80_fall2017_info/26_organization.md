# Getting and giving help

## Roster

The following roster shows the teaching staff.

<div id='staff'>
    <move-here src='#censi-roster'/>
    <move-here src='#paull-roster'/>
    <move-here src='#tani-roster'/>
    <move-here src='#walter-roster'/>
    <move-here src='#frazzoli-roster'/>
    <move-here src='#shiying_li-roster'/>
    <move-here src='#ercan_selcuk-roster'/>
    <move-here src='#miguel_delaiglesia-roster'/>
    <move-here src='#harshit_kurhana-roster'/>
    <move-here src='#lapandic_dzenan-roster'/>
    <move-here src='#marco_erni-roster'/>
    <move-here src='#andrea_daniele-roster'/>
    <move-here src='#falcon_dai-roster'/>
    <move-here src='#jon_michaux-roster'/>
    <move-here src='#florian_golemo-roster'/>
    <move-here src='#greta-roster'/>
    <move-here src='#bowser-roster'/>
    <div style='clear:both'></div>
</div>

<style>
#staff div.roster-person {
    margin-top: 1em;
}
</style>


To add yourself to the roster, or to change your picture,
add a YAML file and a jpg file to [the `duckiefleet-fall2017` repository](http://github.com/duckietown/duckiefleet-fall2017).
in the [`people/staff` directory][db-staff].

[db-staff]: https://github.com/duckietown/duckiefleet-fall2017/tree/master/people

<!-- ### Regenerating the roster

To regenerate the roster, in DUCKIETOWN_ROOT use the command

    $ make generate-roster

To do this, you need to have three repositories: duckuments, duckiefleet, and  -->

## The organization sheet  {#org-sheets}

Please familiarize yourself with [this spreadsheet][sheets] and bookmark it
in your browser.

Yes, it's intimidating! You'll get used to it.

### The Areas sheet

The sheet called "Areas" describes the points of contact for
each part of this experience. These are the people that
can offer support. In particular, note that we list two points of contact:
one for America, and one for Europe. Moreover, there is a link
to a Slack channel, which is the place where to ask for help. (We'll get you
started on Slack in just a minute.)

(Later in the class, when you are all set up and running, we will
ask you to use tools like Github Issues to ask for help; in this
onboarding phase, you only need to care about Slack.)

### The Tasks sheet

The sheet called "Tasks" describes specific tasks that you must do
in a certain sequence.  Tasks include things like "assemble your robot"
or "sign up on Github".

The difference between the Areas sheet and the Task sheet is that
the Task sheet contains tasks that you have to do once; instead,
the Areas sheet contains ongoing activities.

In this sheet, each task is a row, and each person is a column. There is one
column for each person in the class, including instructors, TAs, mentors, and
students.

In this sheet we keep track of the class status. It is very, very important
for us to know the progress stage for everybody during the class.

Each task in the first column is linked to the documentation
that describes how to perform the task.

There are two points of contact listed, one for America and one for Europe.

The colored boxes have the following meaning:

- Grey: not ready. This means the task is not ready for you to start yet.
- Red: not started. The person has not started the task.
- Blue: in progress. The person is doing the task.
- Yellow: blocked. The person is blocked.
- Green: done. The person is done with the task.
- n/a: the task is not applicable to the person. (Certain tasks are staff-only.)

If there is a problem for a task, please add a comment, and in the comment
explain the problem. If the problem is solved, remember to remove the comment.

Students do not have (at least for now) editing access to the spreadsheet.
Therefore, it's the TAs that periodically update the spreadsheet.

At any time, if a student has a blocking problem with a task, they (or the TA) should add a comment to the corresponding cell. This is our "ticket system" - if students
put a comment, we'll make sure that their issue is resolved.

[sheets]: https://docs.google.com/spreadsheets/d/1uO1aq9zqBpLwo1qOzeBKKbB3CuAQAqM94T8B1AGpCKg/edit?usp=sharing



## Getting help and giving help

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

### Problems while following instructions

If you encounter a problem when you are following the instructions,
you have the moral obligation to edit the Markdown and insert a comment.

The goal for the instructions is that anybody is able to follow them.
Last year, we managed to have two 15-year-old students
reproduce the Duckiebot from instructions.

See: How to edit the documentation is explained in [](#part:contribute).
In particular, the notation on how to insert a comment is explained in [](#notes-and-questions).

Note that because we use Git, we can always keep track of changes, and there
is no risk of causing damage.

If you encounter typos, feel free to edit them directly.

Feel free to add additional explanations.


#### How to deal with mistakes in instructions

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



### Well-defined software defects

If you encounter a software defect, then open an issue
on [the Github issue tracker for the `Software` repository][issues-Software].

### Problems with the documentation system itself

We have a very powerful, but experimental system for writing the documentation
and eventually create the "Duckietown magic book".

If you encounter an issue, please open an issue on the [Github issue tracker for the `duckuments` repository][issues-duckuments].

[issues-duckuments]: github.com/duckietown/duckuments/issues
[issues-Software]: github.com/duckietown/Software/issues


### Problems with the hardware

If you have problems with the hardware, please contact the local hardware representative,
as listed in the [organization chart][org-chart].

### Help with accounts and permissions

For accounts and permissions help, please contact Kirsten on Slack, in the channel `#help-accounts`.


[org-chart]: https://docs.google.com/spreadsheets/d/18bG3BBsFGZllVeFBh3ygvXacHCO6gckMBqH77yvZnrw/edit?usp=sharing
