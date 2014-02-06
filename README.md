space-bot-war-client
=============

This is a readme thingo.


Because Github.

TODO
====

- Add a debug-mode-only logger. Perhaps some hacky type of precompiler? Eg,
in a build, remove all lines that have a `//debug` comment at the end?
- Set up BowerJS to manage all the dependencies that the actual client has.
- Use r.js to build the entire client into a single file
- Use the Google Closure Compiler to minify everything. (Could we possibly use
it's Advanced (and vicious) compile option?)
- `sbw.pl`: Add a `purge` task to delete all the `.map` and `.js` files in 
`src/app` because stuff likes to get messy in there. D:
- `sbw.pl`: just for kicks, add a task to get the number of lines of coffee
code there is in the src/app directory. Maybe we could do something interesting
with this, sometime?? :)
- Find a way to unit test the application. (Jasmine?)
- Find a way to not need to use global versions of gulp and coffee because they
can only be updated manually, which is annoying because combined, they update 
(fairly) often.
- Look at the following gulpjs modules: jshint, coffeelint, size
