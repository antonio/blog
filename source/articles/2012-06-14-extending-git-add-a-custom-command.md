---
layout: post
title: "Extending Git: add a custom command"
date: 2012-06-14 19:18
comments: true
categories: git
---

[Stu](https://github.com/thelazycamel) is the guy sitting next to me in the
office, and besides being a top notch developer is also our release
manager, that is, the one that takes care of the whole process of releasing
a new version of our website every week.

I don't recall the exact question he asked me first hour in the morning today,
but it involved extending Git to make the releasing process a little bit easier.
It is actually a very easy to do, so keep reading.

Let's define a release workflow before going deep into subject. What we would
like to have is a new command called `validate` that will push the master branch
and delete a remote one, passed as a parameter. It will be executed after
rebasing the target branch against `master`, so the idea is to go from

```shell
git checkout master
git merge target_branch
git push origin master
git push origin :target_branch
```

to

```shell
git checkout master
git validate target_branch
```

It might not seem like a big improvement, but when you are doing that *all the
time*, believe me it is.

Basically, the only thing that needs to be done is to write a shell script named
accordingly. Yeah, that's it, I was as surprised as you probably are.

The rule is simple, if you want to create a `validate` command, the script will
be called `git-validate` and must be placed in one of the folders present in your
`PATH`.

<p class="alert-box warning">
Make sure that you give execution permissions to the script!
</p>

{% gist 2932484 %}

You are not limited to shell scripting when it comes to defining your own git
commands. Actually, you can use a more powerful language (such as Ruby) if you
want, therefore being only limited only by your imagination and coding skills.
