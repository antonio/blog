---
date: '2011-08-18 12:23:34'
layout: post
slug: managing-your-ruby-installations-with-rvm-the-ruby-version-manager
status: publish
title: Managing your Ruby installations with RVM, the Ruby Version Manager
comments: true
categories: [rvm, ruby]
---

Ruby is an interpreted language with very different implementations. This means that there are several programs able to read and execute Ruby code, each one with its advantages and disadvantages. The reference implementation is called CRuby, and is the de facto interpreter. Others exist, like JRuby (an implementation of the language written in Java that makes it possible to merge Ruby and Java code and libraries in the same program) or the Ruby Enterprise Edition.

The [Ruby Enterprise Edition](http://rubyenterpriseedition.com/) is an open source implementation designed to use less memory (33% as stated in the website) than CRuby when used with the Phussion Passenger module and claims to be well-tested and stable. In this post I will describe how to install it in an easy way using RVM.

[Ruby Version Manager](http://rvm.beginrescueend.com) is without a doubt the easiest way to install different implementations of the Ruby language in a given machine. It is a command line tool that wraps the installed environments so that you use the one you want each time, making it possible to switch to another and managing the installed gems. It doesn't require root permissions to be installed or used, so makes a perfect match with the chosen server .

To install it, just type 

`bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)`

in the shell and it will be automatically installed to the `.rvm` directory of your home folder. Then, you need to add some environment variables so that it works. This is done by appending some code to one of the files that are loaded by default when connecting to the server (`.bash_profile`,`.bashrc`,`.zshrc`, you name it). Assuming that you are using `bash`, you can perform this step by typing

`echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile`

The final step is reloading the environment, either by reconnecting to the server or typing `source .bash_profile`

Once RVM is installed, installing a Ruby interpreter is as easy as using the `rvm install` command. For instance, to get Ruby Enterprise Edition installed type

`rvm install ree`

And start using it by typing 

`rvm use ree`

One of the features of RVM is that it is possible to define gem sets, which makes it possible to install and manage different gems in each of the Ruby environments defined with RVM. In this way, you can create environments that fit your application exactly as needed and are more secure, as everything is installed in the user folder and run as the aforementioned user, reducing the risk of a hijacked application running as the root user and also avoiding possible gem conflicts.

To use a given gemset, first we need to create it with `rvm gemset create mygemset`. Then, you can start using it either by typing `rvm gemset use mygemset` or `rvm use ree@mygemset`. The later allows you to specify the Ruby intepreter as well.

You may be thinking by now that, though certainly useful, RVM has a big flaw: if you work in several different Ruby / Rails projects, you have to remember to load the correct Ruby environment for each when you start working on it. Well, not exactly, because every time you change to a different directory RVM looks for a file named `.rvmrc` and executes it if present. In this way, the right environment will be always loaded automatically.

You can create the project `.rvmrc` file by typing in the shell `rvm --rvmrc --create use ree@mygemset`. Note that as of version 1.7.0, this functionality is disabled by default. To enable it, you need to add `rvm_project_rvmrc=1` to either `/etc/rvmrc` or `~/.rvmrc`.

There are other interesting things to know about RVM, so I advice you to check [the website](https://rvm.beginrescueend.com), which has plenty of documentation available. Also, have a look at the [recommended practices](https://rvm.beginrescueend.com/rvm/best-practices/).




 
