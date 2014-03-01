space-bot-war-client
====================

This is a readme thingo. Because Github made me do it.

Setup
=====

The following are the steps you'll need to take to get this thing running.

- Install [Git](http://git-scm.com)
    - On Ubuntu: ` $ sudo apt-get install git`
- Install [NodeJS](http://nodejs.org)
- ` $ git clone http://github.com/spacebotwar/space-bot-war-client`
- ` $ cd space-bot-war-client`
- Use our funky Perl script to do the rest!
    - ` $ perl sbw.pl setup`

Now hit ` $ perl sbw.pl help ` for instructions on how to develop with us!


TODO (In order of priority)
===========================

- Add unit tests for logging in and out
- Add a debug-mode-only logger. Perhaps some hacky type of precompiler? Eg,
in a build, remove all lines that have a `//debug` comment at the end?
