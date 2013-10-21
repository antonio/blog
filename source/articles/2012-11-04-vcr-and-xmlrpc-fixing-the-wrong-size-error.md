---
layout: post
title: "VCR and XMLRPC: Fixing the 'wrong size' error"
date: 2012-11-04 20:19
comments: true
published: true
categories: ['ruby', 'vcr', 'xmlrpc', 'rspec']
---
Yesterday I had the perfect opportunity to hack a little bit with
[VCR]("https://github.com/myronmarston/vcr"), a very nice library that [Andrei
Ursan](http://twitter.com/andreiursan) has recommended me several times.

In a nutshell, the library wraps requests to an external HTTP server and saves the
responses in files in the *yaml* format, replaying them in consecutive calls (hence the
name). This allows for perfect decoupling in tests, not only making them faster
but more reliable, as they don't depend on external factors anymore.

So I modified the project I was working on to add support for VCR, created the
pull request and... [broke the build as it was merged into master](https://travis-ci.org/#!/byroot/ruby-osdb/builds/3056048).

The specs failed in all Ruby 1.8.x interpreters (this includes REE, JRuby and
Rubinius) with messages like the following:

```Wrong size. Was 9764, should be 9662```

I haven't been able to trace the exact cause of problem, but at least I have been able to
fix it. The solution is to record the HTTP requests using one of the Ruby 1.8.x
versions. While the responses saved in 1.9.x don't work with 1.8.x versions, the
ones generated in 1.8.x are compatible with newer versions of Ruby.
