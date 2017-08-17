# Configuration needed

This chapter explains what are the assumptions about the configuration.

Note: The "Setup" parts are "imperative" (do this, do that); this is the "declarative" part, which explaines what is a correct configuration of the file.

See also: The tool `what-the-duck` checks these conditions. If you make a change from the existing conditions, make sure that it gets implemented in `what-the-duck` by filing an issue.

## Variables {#variabes}

You need to have set up the variables in [](#tab:environment-variables).

<col3 figure-id="tab:environment-variables">
    <figcaption>Environment variables for Fall 2017</figcaption>

    <s>variable</s>
    <s>reasonable value</s>
    <s>contains</s>

    <s>DUCKIETOWN_ROOT</s>
    <s><code>~/duckietown</code></s>
    <s><code>Software</code> repository</s>

    <s>DUCKIEFLEET_ROOT</s>
    <s><code>~/duckiefleet</code></s>
    <s>repository that contains <code>scuderia.yaml</code></s>
</col3>

### Duckietown root directory `DUCKIETOWN_ROOT`

TODO: to write

### Duckiefleet directory `DUCKIEFLEET_ROOT`

For Fall 2017, this is the the repository [`duckiefleet-fall2017`][duckiefleet-repo].

For self-guided learners, this is an arbitrary repository to create.

[duckiefleet-repo]: https://github.com/duckietown/duckiefleet-fall2017

## The scuderia file {#scuderia-file}

In the <code>&#36;{DUCKIETOWN_FLEET}</code> directory,
there needs to exist a file called:

    ${DUCKIETOWN_FLEET}/scuderia.yaml

The file must contain YAML entries of the type:

    ![robot-name]:
       username: ![username]
       owner_duckietown_id: ![owner duckietown ID]

A minimal example is in [](#code:scuderia-minimal)

<div figure-id="code:scuderia-minimal" markdown="1">
<figcaption>Minimal scuderia file</figcaption>
``` .yaml
emma:
  username: andrea
  owner_duckietown_id: censi
```
</div>

Explanations of the fields:

* `![robot name]`: the name of the robot, also equal to the host name.
* `![username]`: the name of the Linux user on the robot, from which to run programs.
* `![owner_duckietown_id]`: the owner's globally-unique Duckietown ID.


## People file {#people-file}

TODO: Describe the people database

Assigned: Andrea

## The globally-unique Duckietown ID

This is a globally-unique ID for people in the Duckietown project.

It is equal to the Slack username.
