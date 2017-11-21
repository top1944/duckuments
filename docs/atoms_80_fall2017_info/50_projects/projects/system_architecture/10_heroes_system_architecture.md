# System Architecture {#heroes-system-architecture status=beta}

## Preliminaries

**Name of Project:** System Architecture

**Team:**

* Sonja Brits (Zurich) (System architect)
* Andrea Censi (Zurich) (Mentor/Supervisor)

**Slack channel:** `#devel-heroes`

**Software development branch:** `devel-sonja` (Software repo) or `sonja-branch` (Duckuments repo)

### Missions

The system architect project can be split into two missions:

1. Ensure that the development of the system goes smoothly (wooden spoon)
2. Develop a framework/tool to formally describe (and later optimize) the system (bronze, silver and gold)

## Mission 1 {#heroes-system-architecture-mission1 status=beta}
Ensure that the development and integration of the projects into the system goes smoothly and that the resulting system makes sense, and is useful for future duckierations (duckie + generations).

### Problem Statement
Ensure that all teams know what their goal is and how it fits into the bigger picture

### Relevant Resources
* The functional diagram of the system
* Duckuments
* Other teams’ preliminary project reports

### Deliverables (Goals)
The deliverables for Mission 1 will include the following:

* Functional diagram of the system
* Documentation of system architecture

Mission 1 is the "wooden spoon" level of the project.

### Proposed Approach

* Become one with the goals of Duckietown
    In order to make Duckietown a better place, one has to keep in mind what “better” means in Duckie terms. 
* Be familiar with the current system architecture and track changes
    This can include having to update the functional diagram, for instance.
* Keep in close contact with teams
    This will be done by attending the meetings of some of the other teams (especially early meetings). Some teams’ meetings have been prioritized since many parts of the system are dependant on their work, namely:
    * Anti-instagram
    * Controllers
    * Navigators
    * Explicit coordination
    All teams will designate a contact person who can contact me whenever they change their project boundaries or have doubts/ need advice on their project’s boundaries/negotiating with other 
* Offer nudges in a different direction if needed
* Acting as middleman/helper to facilitate negotiation of contracts between groups
* Monitor status of projects to find possible problems

### Logging and Testing Procedure
...

### Current status

Familiarisation with the current system status is under way.

Functional diagram has been updated to include multi-robot SLAM as alternative to single-robot SLAM to creating map.

### Tasks
* Familiarisation with existing system architecture
* Going to group meetings
* Identifying potential problems

### Timeline
...

### Meetings notes
...

## Mission 2 {#heroes-system-architecture-mission2 status=beta}
Where there is a system, there is a want (nay, need) for optimisation. Describing a system’s performance and resource requirements in a quantifiable way is a critical part of being able to benchmark modules and optimise the system. 

Mission 2 is to formalise the description of the system characteristics, so that eventually the system performance can be optimised for some given resources.

### Problem Statement
Find a way to describe all the module requirements, specifications, etc in a formal, quantifiable language.

Find a way to calculate the requirements and specifications of a whole system or subsystem, based on the requirements and specifications of the individual modules of the system.

Find a way to calculate the optimal system configuration, based on the desired requirements and specifications of the system.

### Relevant Resources
* How the current system’s characteristics are defined
* Which values/parameters are needed
* Possibly research on system description?
* Possibly graph theory?

### Deliverables (Goals)
The different levels of Mission 2 are defined as follows: 

* Bronze standard:
    * Formal, qualitative language to describe constraints/requirements between modules

* Silver standard:
    * each module has table of performance. Qualitative. Can compare and give yes/no queries. With given configuration x, is the cost/requirements possible with available resources? f(x) smaller equal to Rmax?

* Gold standard:
    * optimization is possible to find best implementation, given available resources. Given f(x) and Rmax, find optimal configuration x

The deliverables will then include:

* Documentation on the result of the project
* A description of the current system’s characteristics (bronze)
* A program/tool that can give a qualitative answer (yes/no) to the question: Are these resources sufficient for this system configuration? (silver)
* A program/tool that will give an optimised system configuration, based on the given available resources (gold)

### Proposed Approach
* Research on the topic of formal description of a system
* Find/develop a suitable language to describe module characteristics
* Require groups to compile a description of their respective modules’ characteristics
* Find/develop functions to do mathematics on the language description of modules

### Logging and Testing Procedure
...

### Current status

Research is being done to identify some research areas that may be relevant and tools that may be helpful, in order to decide on an approach.

### Tasks
* Research into existing methods of system description
* Graph based databases?
* Perhaps graph theory can be useful later if the (suspiciously graph-looking) system can be described suitably.

### Timeline
...

### Meetings notes
...



