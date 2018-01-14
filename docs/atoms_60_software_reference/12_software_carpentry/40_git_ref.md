# Source code control with Git {#git-reference status=ready}

Assigned: Andrea

## Background reading

See: [Good book](https://git-scm.com/book/en/v2)

See: [Git Flow](http://nvie.com/posts/a-successful-git-branching-model/)

## Installation

The basic Git program is installed using

    $ sudo apt install git

Additional utilities for `git` are installed using:

    $ sudo apt install git-extras

This include the `git-ignore` utility.


## Setting up global configurations for Git  {#howto-git-local-config}

This should be done twice, once on the laptop, and later, on the robot.

These options tell Git who you are:

    $ git config --global user.email "![email]"
    $ git config --global user.name  "![full name]"

Also do this, and it doesn't matter if you don't know what it is:

    $ git config --global push.default simple

## Git tips

### Delete branches


Delete local:

    $ git branch -d ![branch-name]

Delete remote:

    $ git push origin --delete ![branch-name]


Propagate on other machines by doing:

    $ git fetch --all --prune


### Shallow clone

You can clone without history with the command:

    $ git clone --depth 1 ![repository URL]

## Git troubleshooting


### Problem 1: https instead of ssh:

The symptom is:

    $ git push
    Username for 'https://github.com':

Diagnosis: the `remote` is not correct.

If you do `git remote` you get entries with `https:`:

    $ git remote -v
    origin  https://github.com/duckietown/Software.git (fetch)
    origin  https://github.com/duckietown/Software.git (push)

Expectation:

    $ git remote -v
    origin  git@github.com:duckietown/Software.git (fetch)
    origin  git@github.com:duckietown/Software.git (push)

Solution:

    $ git remote remove origin
    $ git remote add origin git@github.com:duckietown/Software.git


### Problem 1: `git push` complains about upstream

The symptom is:

    fatal: The current branch ![branch name] has no upstream branch.

Solution:

    $ git push --set-upstream origin ![branch name]

## `git` {#git status=draft}

TODO: to write
Once you've set up SSH (so that you don't have to enter passwords all the time - see XXX for instructions) you are now ready to use Git locally. 

jekyll serve

move to directory you want your files stored or make one (google 'using the terminal' for help on this)
If you are new to using the terminal to navigate but still want Find the repository you would like to work on and chose the "clone or download" button on the right hand side to find the repository's location, for eg/ "git@github.com:duckietown/duckietown.org.git". Then you

git clone git@github.com:duckietown/duckietown.org.git

Check your success with

ls

and now the new repository should be listed in your directory. 

No you need to checkout the code to your own branch, and you do both these things with this:

git checkout -b (GIVE A NAME TO WHAT WILL BE YOUR NEW BRANCH)

git branch --> checks how many branches there are. Your new branch should be listed here. If you went to the browser version of git you would not yet see your branch listed because it has not yet been committed and pushed. We'll get there soon.

Now that you are in your own branch of the repository you are ready to connect and make changes.

jekyll serve --> connects you to ######

Now you can make local (on your own machine) changes to the files within your branch of the repo. How you do this depends on why type of file you are working on. When you've made a few changes and want to officially add them (publicize these changes 'remotely') (it is good to do this often because it allows you to track your changes and revert back to older versions if necessary) then it is good to first

git status --> will tell you about whether there are changes on your branch that have not yet been committed

then you should 

git pull --> to make sure you add your changes to the most recent branch version (if there are multipkle people working on the same branch)

git commit -a -m "A MESSSAGE ABOUT THE CHANGES YOU HAVE MADE - ADD A MESSAGE!"

(-a --> adds all new changes
-m --> adds a message)

git status to see that no remaining changes or files to add

Now you want to make your branch visible to everyone (it currently only exists locally) so you use

git push --set-upstream origin NAME OF YOUR BRANCH

When committing and pushing future changes to your branch you probably needn't specify the upstream branch #####is this true?? 
so you can use the more straightforward

git push

Once you've made some major breakthroughs and your code should be added to or become the master branch you will have to MERGE. Depending on the repository this is accomplished two ways. First through

git merge

Where you, the authour, have write rights to this repository.

Otherwise you will have to submit a pull request, where an administrator can review your changes and then merge them into the master branch.

git request-pull

## `hub` {#hub}


### Installation

Install `hub` using the [instructions](https://hub.github.com/).

### Creating pull requests

You can create a pull request using:

    $ hub pull-request -m "![description]"
