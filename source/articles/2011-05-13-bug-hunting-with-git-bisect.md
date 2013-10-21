---
date: '2011-05-13 00:33:23'
layout: post
slug: bug-hunting-with-git-bisect
status: publish
title: Bug hunting with git bisect
comments: true
categories:
- git
---

So, my friend [Juan G Hurtado](http://www.coloresefimeros.com) is blogging about Git and sharing some recipes lately. I am going to get ahead on this one about a nice tool that you may not use often, but that will prove worthwile when you do: `git bisect`

Let's play a small roleplaying here, shall we? Imagine that you are working with a bunch of other devs in a project, coding and commiting like there's no tomorrow. And I mean **a lot** of commiting, because you all are using Git and it simply rocks how easy and fast it is. All of a sudden, a certain functionality is reported not to be working correctly, despite its test (you **do** test, don't you?) succeeding. So, unfortunately, your tests weren't as good as you thought they were (this kind of thing happens, you know) and you find yourself in this kind of situation in which you are not really sure when the system stopped working correctly. Damn.

Fear no more, because with `git bisect` you will find the problem in a breeze. All it does is performing a [binary search](http://en.wikipedia.org/wiki/Binary_search_algorithm) between a commit in which everything worked perfectly and one in which it does not until it finds the offending one.

So it works like this, you start by typing `git bisect start` and then you mark the current revision as a failing one with `git bisect bad`. After that, find a commit which is working as expected (ie, 805f87d) and type `git bisect good 805f87d`. Git will start to iterate between the different commits asking for your input so that it knows whether the current commit works okay or not. Find a complete example below:

    
    antonio@wonderland:~/Projects/config
    > git bisect start                                                                                                                                                                             master [56ab365]
    
    antonio@wonderland:~/Projects/config
    > git bisect bad                                                                                                                                                                               master [56ab365]
    
    antonio@wonderland:~/Projects/config
    > git bisect good 805f87d                                                                                                                                                                      master [56ab365]
    Bisecting: 30 revisions left to test after this (roughly 5 steps)
    [fbae52a8dcb942c9f57bfbb24e550188f3e1f500] smarter awesome wm autostart module
    
    antonio@wonderland:~/Projects/config (*)
    > git bisect bad                                                                                                                                                                            [fbae52a]  modified
    Bisecting: 15 revisions left to test after this (roughly 4 steps)
    [0ce9d70fcf99d08e62af99acc1ca22e5e23317cf] unset precmd and preexec functions
    
    antonio@wonderland:~/Projects/config (*)
    > git bisect bad                                                                                                                                                                            [0ce9d70]  modified
    Bisecting: 6 revisions left to test after this (roughly 3 steps)
    [147cd96506ecda9bcbf008698cd755a49dfe389c] Merge branch 'master' of github.com:antonio/dotfiles
    
    antonio@wonderland:~/Projects/config (*)
    > git bisect good                                                                                                                                                                           [147cd96]  modified
    Bisecting: 3 revisions left to test after this (roughly 2 steps)
    [4d1684c4467401907b7d59fbf9e125b988f9fc41] opener plugin
    
    antonio@wonderland:~/Projects/config (*)
    > git bisect bad                                                                                                                                                                            [4d1684c]  modified
    Bisecting: 0 revisions left to test after this (roughly 1 step)
    [df372cc78ae0dd7ad9682cdf2173e03a9aef20f2] juanghurtado theme
    
    antonio@wonderland:~/Projects/config (*)
    > git bisect good                                                                                                                                                                           [df372cc]  modified
    4d1684c4467401907b7d59fbf9e125b988f9fc41 is the first bad commit
    commit 4d1684c4467401907b7d59fbf9e125b988f9fc41
    Author: Antonio <asantosv@gmail.com>
    Date:   Thu Jan 13 14:43:54 2011 +0100
    
        opener plugin
    
    :100644 100644 e49543bfc52339d359b6c9c8be194a8b432d2e4a 47eceba05361e1d4c14366eee1788d49e2dfe370 M      .zshrc
    :040000 040000 c3963fc6ca3997faba573d4d5b8e708834b9899b e014f61b7f668229e15ee019dd774f6c952456c5 M      zsh


Now that you've found the culprit commit, it may be a good time to do some `git blame` for public humiliation :D

A nice feature is the possibility of writing a shell script that automatically tests the functionality, returning 0 if it works and a number between 1 and 127 (with the exception of 125) if it does not. Given the testing script `test.sh`, it would go like this

`git bisect run test.sh`

Check up [the git bisect manual](http://www.kernel.org/pub/software/scm/git/docs/git-bisect.html) for more information on how to use this awesome feature.
