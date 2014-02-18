space-bot-war-client
=============

This is a readme thingo.


Because Github.

TODO (In order of priority)
===========================

- Find a way to unit test the application. (Jasmine?)
- Look at the following gulpjs modules: coffeelint
- Add a debug-mode-only logger. Perhaps some hacky type of precompiler? Eg,
in a build, remove all lines that have a `//debug` comment at the end?
- `sbw.pl`: just for kicks, add a task to get the number of lines of coffee
code there is in the src/app directory.
- `sbw.pl`: Add a `purge` task to delete all the `.map` and `.js` files in 
`src/app` because stuff likes to get messy in there. D:
