# Git usage guide for Fall 2017 {#fall2017-git status=ready}

## Repositories

These are the repositories we use.

### Software

The [Software](http://github.com/duckietown/Software) repository
is the main repository that contains the software.

The URL to clone is:

    git@github.com:duckietown/Software.git

In the documentation, this is referred to as `DUCKIETOWN_ROOT`.

During the first part of the class, you will only read from this repository.

### Duckiefleet

The [duckiefleet-fall2017](http://github.com/duckietown/duckiefleet-fall2017)
repository contains the data specific to this instance of the class.

The URL to clone is:

    git@github.com:duckietown/duckiefleet-fall2017.git

In the documentation, this is referred to as `DUCKIEFLEET_ROOT`.

You will be asked to write to this repository, to update the robot DB
and the people DB, and for doing exercises.

### Duckiefleet-homework {status=recently-updated}

For homework submissions, we will use the following URL:

    git@github.com:duckietown/duckiefleet-fall2017-homework.git

As explained below, it is important that this repo is kept separate so that students can privately work on their exercises at schools where the homeworks are counted for grades.

### Duckuments

The [Duckuments](http://github.com/duckietown/duckuments) repository
is the one that contains this documentation.

The URL to clone is:

    git@github.com:duckietown/duckuments.git

Everybody is encouraged to edit this documentation!

In particular, feel free to insert comments.


### Lectures

The [lectures](http://github.com/duckietown/lectures) repository
contains the lecture slides.

The URL to clone is:

    git@github.com:duckietown/lectures.git

Students are welcome to use this repository to get the slides,
however, please note that this is a space full of drafts.


### Exercises

The [exercises](http://github.com/duckietown/XX-exercises) repository
contains the solution to exercises.

The URL to clone is:

    git@github.com:duckietown/XX-exercises.git

Only TAs have write permissions to this repository.


## Git policy for  homeworks {#git-policy-homeworks status=recently-updated}

Homeworks will require you to write and submit coding exercises. They will be submitted using git. Since we have a university plagiarism policy ([UdeM's](http://www.lecre.umontreal.ca/politique-sur-le-plagiatplagiarism-policy/),
[TTIC/uChicago](https://studentmanual.uchicago.edu/Policies#Honesty)) we have to protect students work before the deadline of the homeworks. For this reason we will follow these steps for homework submission: 

1. Go [here](https://education.github.com/) and file a request at the bottom “Request a Discount” then enter your institution email and other info.
  - Go to [duckiefleet-fall2017-homework](https://github.com/duckietown/duckiefleet-fall2017-homework)
  - Click "Fork" button in the top right
  - Choose your account if there are multiple options
  - Click on the Settings tab of your repostory, not your account
  - Under "Collaborators and Teams" in the left, click the "X" in the right for the section for "Fall 2017 Vehicle Autonomy Engineers in training". You will get a popup asking you to confirm. Confirm.


If you have not yet cloned the duckietown repo do it now:

    $ git clone git@github.com:duckietown/duckiefleet-fall2017-homework.git

Now you need to point the remote of your `duckiefleet-fall2017-homework` to your new local private repo. To do, from inside your already previously cloned `duckiefleet-fall2017` repo do:

    $ git remote set-url origin git@github.com:![GIT_USERNAME]/duckiefleet-fall2017-homework.git

Let's also add an `upstream` remote that points back to the original duckietown repo:

    $ git remote add upstream git@github.com:duckietown/duckiefleet-fall2017-homework.git

If you type

    $ git remote -v

You should now see:

```
origin  git@github.com:![GIT_USERNAME]/duckiefleet-fall2017-homework.git (fetch)
origin  git@github.com:![GIT_USERNAME]/duckiefleet-fall2017-homework.git (push)
upstream  git@github.com:duckietown/duckiefleet-fall2017-homework.git (fetch)
upstream  git@github.com:duckietown/duckiefleet-fall2017-homework.git (push)
```

Now the next time you push (without specifying a remote) you will push to your local private repo.

### Duckiefleet file structure

You should put your homework files in folder at:

    ![DUCKIEFLEET_HOMEWORK_ROOT]/homeworks/![XX_homework_name]/![YOUR_ROBOT_NAME]

Some homeworks might not require ROS, they should go in a subfolder called `scripts`. ROS homeworks should go in packages which are generated using the process described here: [](#sec:ros-python-howto). For an example see `![DUCKIEFLEET_HOMEWORK_ROOT]/homeworks/01_data_processing/shamrock`.


Note: To make your ROS packages findable by ROS you should add a symlink from your `duckietown/catkin_ws/src` directory to `![$DUCKIEFLEET_HOMEWORK_ROOT]`


### To submit your homework

When you are ready to submit your homework, you should do **create a release** and **tag the Fall 2017 instructors/TAs group** to let us know that your work is complete. This can be done through the command line or through the github web interface:

Command line:

    git tag ![XX_homework_name] -m"@duckietown/fall-2017-instructors-and-tas homework complete"
    git push origin --tags

Through github:

1. Click on the "Releases" tab
2. Click "Create a new Release"
3. Add a version (e.g. 1.0)
4. Release title put `![XX_homework_name]`
5. In the text box put "@duckietown/fall-2017-instructors-and-tas homework complete"
6. Click "Publish release"

You may make as many releases as you like before the deadline.


### Merging things back {status=draft}

Once all deadlines have passed for all institutions, we can merge all the homeworks.
We will ask to create a "Pull Request" from your private repo.

1. In your private duckiefleet-fall2017-homework repo, click the "New pull request button".
2. Click "Create pull request" green button
3. The 4 drop down menus at the top should be left to right: (`base fork: duckietown/duckiefleet-fall2017-homework`, `base: master`, `head fork: ![YOUR_GIT_NAME]/duckiefleet-fall2017-homework`, `compare: ![YOUR_BRANCH]`)
4. Leave a comment if you like and click "Create pull request" green button below.
5. At some point a TA or instructor will either merge or leave you a comment.



### For U de M students who have already submitted homework to the previus duckiefleet-2017 repo

These instructions assume that you are ok with losing the commit history from the first homework. If not, things get a little more complicated

Fork and clone the new "homework" repository using the process above. Followed by:

    $ git clone git@github.com:![GIT_USERNAME]/duckiefleet-fall2017-homework.git
    
Copy over your homework files from the duckiefleet-fall2017 repo into the duckiefleet-fall2017-homework repo

git rm your folder from duckiefleet-fall2017 and commit and push

git add your folder to duckiefleet-fall2017-homework and commit and push


## Git policy for project development {#git-policy-projects status=draft}


Different than the homeworks, development for the projects will take place in the `Software` repo since plagiarism is not an issue here. The process is:

1. Create a branch from master

2. Develop code in that branch (note you may want to branch your branches. A good idea would be to have your own "master", e.g. "your_project-master" and then do pull requests/merges into that branch as things start to work)

3. At the end of the project submit a pull request to master to merge your code. It may or may not get merged depending on many factors.
