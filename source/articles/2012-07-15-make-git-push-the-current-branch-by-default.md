---
layout: post
title: "Make git push the current branch by default"
publish: true
date: 2012-07-15 11:53
comments: true
categories: git
references:
  - http://stackoverflow.com/questions/948354/git-push-current-branch
---
Tired of typing the name of your git branch everytime you push it? Wouldn't it
be nice to just type `git push` instead of the full `git push origin
annoying-and-suprisingly-long-branch-name`?

`git config` to the rescue. The `push.default` option lets you define the
prefered behavior when pushing. From the manual page, options are:

* nothing - do not push anything.
* matching - push all branches having the same name in both ends.
* upstream - push the current branch to its upstream branch.
* simple - like upstream, but refuses to push if the upstream branch's name is different from the local one.
* current - push the current branch to a branch of the same name.

<div class='hint'><p>Take into account that these are the options for the latest
git version as of today (1.7.11), your mileage may vary.</p></div>

So, basically all you need to do is type

```shell
git config push.default current
```

If the branch names differ between your local and remote environments, consider
using `upstream` as the configuration option.

Happy pushing!
