---
date: '2011-04-22 03:02:36'
layout: post
slug: improving-oh-my-zsh-startup-time
status: publish
title: Improving oh-my-zsh startup time
comments: true
categories:
- oh-my-zsh
- zsh
---

I've been using [zsh](http://www.zsh.org) as a replacement for _bash_
for some time already. Its cool features like globbing patterns (\*\*/*
ftw!), tab completion or typo correction are now essential to me.

[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) makes it
really easy to get a fully functional shell out of the box because of
the defined functions and its plugin system. Nonetheless, it makes my
shell startup really slow. Or it used to, because I have _gitpulled_
(nice verb there, isn't it?) several patches created by
[oknowton](https://github.com/oknowton/oh-my-zsh) for the shell
framework that improve **a lot** the startup time.

```shell
git remote add oknowton https://github.com/oknowton/oh-my-zsh.git
git pull oknowton master
```

Pat Regan original post can be found
[here](http://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html).

**UPDATE 11-04-29**

According to Robby Russell the branch has been merged upstream, so you
don't need to checkout Pat Regan's branch anymore. Thanks to both of
you for making our CLI experience better ;)
