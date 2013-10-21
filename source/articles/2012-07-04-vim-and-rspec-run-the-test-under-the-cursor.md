---
layout: post
title: "Vim and Rspec: run the test under the cursor"
date: 2012-07-04 14:55
comments: true
categories: vim, rspec, tdd
published: true
references:
---
Lately I have been working more than usual with [Rspec](http://rspec.info/) and
[Capybara](https://github.com/jnicklas/capybara/), the *de facto* testing
libraries for Rails (yes, yes, I know,
[there](http://ruby-doc.org/stdlib-1.9.3/libdoc/test/unit/rdoc/index.html)
[are](https://github.com/seattlerb/minitest) [others](http://cukes.info/)).

I was adding some integration tests to the website today when I suddenly
realized that it is a waste of time to wait for the full test suite to run when
you only care about a single test result. As I am adding tests to an existing
codebase, most of the time I just want to run the test that I am currently
writing to see if it passes or not.

Turns out that Rspec has a lot of options I didn't know about, including one to
specify the line of the file that you want to test. For example, to run the test
in line 25 of the file ``spec/example_spec.rb``, just call Rspec in the
following way

```
rspec spec/example_spec.rb:25
```

<p class='hint'>
You don't have to point rspec the exact line in where the test starts, it is
clever enough to find the enclosing test definition given a line
</p>

So now that we know how to run a certain test, we just need to be able to do so
*dynamically* from within vim, depending on the cursor position. We can
accomplish that with some
[Vimscript](http://vimdoc.sourceforge.net/htmldoc/usr_41.html), Vim's own script
language.

This has been the first time I have a look at the language, so maybe
there is a better/more efficient way to do it, but this works for me. Add the
following snippet to your ``.vimrc`` file.

``` vim
function! RSpecFile()
  execute("!clear && rspec " . expand("%p"))
endfunction
map <leader>R :call RSpecFile() <CR>
command! RSpecFile call RSpecFile()

function! RSpecCurrent()
  execute("!clear && rspec " . expand("%p") . ":" . line("."))
endfunction
map <leader>r :call RSpecCurrent() <CR>
command! RSpecCurrent call RSpecCurrent()

```

With this in your config file, use ``<leader>r`` to run the test under your
cursor and ``<leader>R`` to run *all* the tests in the current file.

The code is pretty straightforward: basically we execute a shell command
using some vimscript functions to get the variables we want with
``expand("%p")`` (the file) and ``line(".")`` (the line number).
