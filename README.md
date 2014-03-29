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


Tech
====

The technologies used in this application are covered below.

##Build
- [GulpJs](http://gulpjs.com/) - the tool that is used to  do stuff to the code (build, update Bower deps, dev web server)
- RequireJs Optimizer (r.js) - concatenates the app into one file
- [Bower](http://bower.io/) - manages the downloading of libraries below

##Libraries in the Application
- [jQuery](http://jquery.org) - DOM manipulation
- [jQueryUI](http://jqueryui.com/) - basic UI components
- [Backbone](http://backbonejs.org/) - MV* structure library
- [Marionette](http://marionettejs.com/) - Backbone plugin, MC* structure
- [Handlebars](http://handlebarsjs.com/) - HTML template engine
- [RequireJs](http://requirejs.org/) - gives the code modular structure
- [Woodman](http://joshfire.github.io/woodman/index.html) - the logger of the app
- And others that don't really need to be mentioned.

##CSS Things
- [Bootstrap](http://getbootstrap.com/) - (Note: To be changed)

##Extras
- [CoffeeScript](http://coffeescript.org/) - most (if not all) of the app is implemented in CoffeeScript


TODO (In no particular order)
===========================
- Some sort of Chat system
- Some sort of code editor (Kind of done, no syntax highlighting)
- Start work on the Steampunk CSS styling/art
- Perhaps a loading screen? Something to display while the JavaScript is
being pulled in? Maybe?? :P
