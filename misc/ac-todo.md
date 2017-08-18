Symbola font.



one person = one Github account
one linux user account = one ssh private key
one Github account = multiple ssh public keys


# acct

sudo apt install acct


https://www.tecmint.com/how-to-monitor-user-activity-with-psacct-or-acct-tools/


sudo service acct start


# auditd

https://linux-audit.com/configuring-and-auditing-linux-systems-with-audit-daemon/


# Add "admin" user to



# How it could work


Resources:

- skills
- knowledge

- lecture slides
- lecture videos
- notes
- homework

- installation notes

External resources:
- Youtube video
- Websites (command man page)
- Forums

Products:

- Student roadmap - which order to go around


# rebase

    $ git checkout andrea
    $ git log --pretty=format:"%h%x09%an%x09%ad%x09%s"
    c39df5d Andrea Censi    Mon Aug 14 18:39:35 2017 +0200  minor
    d0decbe Andrea Censi    Mon Aug 14 18:39:05 2017 +0200  accounts

In branch master there is another commit:

    1e129e071c2872663f09f7c550d38df5a1719db7 readme

https://git-scm.com/book/en/v2/Git-Branching-Rebasing


Now I want to add "accounts" to master:

    git checkout d0decbe
    git rebase master
    git commit --amend --reset-author
    git checkout master
    # it will say "detached head XYZ"
    git merge XYZ
