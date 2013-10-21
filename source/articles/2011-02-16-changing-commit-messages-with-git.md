---
date: '2011-02-16 17:07:17'
layout: post
slug: changing-commit-messages-with-git
status: publish
title: Changing commit messages with Git
comments: true
categories:
- git
---

I use [Git](http://git-scm.com) on a daily basis to manage all the code I write
both at the office and at home. One of its major features is the possibility of
changing the log message of any commit, as long as it has not been already
pushed upstream. Try to do that with Subversion :P  Suppose that you have
commited with a misspelling in the message:

` git commit -a -m "fis typo ib documentatation" `

Well, Git allows you to change the message even if you have already commited in
one simple line:

` git commit --amend `

That will start your editor of choice (defined with the `EDITOR` variable in the
shell) so that you are able to change not only the log message, but to:


  * Merge and split commits
  * Delete commits
  * Change the commit order

Today, I was working on a project that enforces you to reference a Trac ticket
in each commit message (which, by the way, I think is a good idea). Apparently,
I had been working in my local branch for a while, commiting several times
without pushing (shame on me). Finally, my push attempt was rejected by the
server because I hadn't referenced a ticket in a previous commit. Now, I am used
to change the message of the last commit (see above) but I had never needed to
change another one. If you ever find yourself in such a situation, you can work
it out with the following command:

`git rebase --interactive COMMITID_PRIOR_TO_THE_ONE_TO_CHANGE`

See below a screenshot of my editor in the process of rebasing commits:

{%img /images/2011/02/2011-02-16-170025_767x664_scrot.png %}
