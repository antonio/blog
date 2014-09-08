---
layout: post
title: "Local gems in your Gemfile"
publish: true
date: 2012-10-28 00:00
comments: true
tags: [bundler, rails]
references:
  - https://github.com/gerrywastaken/Gemfile.local
  - https://github.com/carlhuda/bundler/issues/1315
---
All the Ruby devs know [Bundler](http://www.gembundler.com), which is the
*de-facto* solution to manage the dependencies of a project.

When you are working on a team, chances are that every dev has his own set of
tools or preferences, or that because of an unexpected situation or a specific
necessity someone needs to add a gem which won't be used by anyone else.

At the office we all use `MySQL` as our development database, but I needed to
switch to `PostgreSQL` and I didn't want to force the rest of the team to install
the `pg` gem just because of this.

[Gerard Caulfield](https://github.com/gerrywastaken) has come up with a clever
method to make this possible,
[Gemfile.local](https://github.com/gerrywastaken/Gemfile.local). Basically, the
idea is to have a file that wraps the contents of the `Gemfile` and adds the
gems you want on top of it.

```ruby
# Include the regular Gemfile
eval File.read('Gemfile')

# Add any gems and groups that you don't want to keep local
gem 'pg'
```

So now that you have defined your local `Gemfile`, how to load it by
default starting a Rails application?

According to the `bundle-config` program documentation, you can specify an
alternative `Gemfile` for a directory by typing `bundle config
Gemfile.local`. Unfortunately [this doesn't seem to
work](https://github.com/carlhuda/bundler/issues/1315) and the solution
involves setting the `BUNDLE_GEMFILE` environment variable.

Now, how you do this depends entirely on you. I use a feature of ``zsh``
which allows me to set a function that will run before the execution of any
shell command.

```shell
set_bundle_gemfile () {
  if [[ -f Gemfile.local ]]; then
    export BUNDLE_GEMFILE=Gemfile.local
  else
    unset BUNDLE_GEMFILE
  fi
}

preexec_functions+=(set_bundle_gemfile)
```

With that, if the file `Gemfile.local` exists in the current directory it
will be automatically used by `bundler`.

Only one thing remains: to prevent polluting other teammates' folders, we
should avoid adding the `Gemfile.local` and `Gemfile.local.lock` files to
the repository by mistake. If you use `git`, add them to the global
`.gitignore` file.

```shell
echo "Gemfile.local*" >> ~/.gitignore
```
