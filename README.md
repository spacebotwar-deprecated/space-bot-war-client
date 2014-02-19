space-bot-war-client
====================

This is a readme thingo.


Because Github.

Setup
=====

The following are the steps you'll need to take to get this thing running.

- Install [Git](http://git-scm.com)
    - On Ubuntu: ` $ sudo apt-get install git`
- Install [NodeJS](http://nodejs.org)
- `git clone http://github.com/spacebotwar/space-bot-war-client`
- `cd space-bot-war-client`
- Install all the dependency management & build tools (*sigh*):
    - ` $ sudo npm install gulp -g`
    - ` $ sudo npm install bower -g`
- Install the dependencies themselves (for the client and the build process):
    - ` $ npm install`
    - ` $ bower update`

Once you have all that just `./sbw.pl develop` and you're good to go! Happy coding!

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
