`"use strict"`

gulp    = require 'gulp'
gutil   = require 'gulp-util'
chalk   = require 'chalk'

# Gulp plugins
coffee = require 'gulp-coffee'



###
    Very quick (to implement) http server for serving all the files.
    Not using nodemon because it's configuration 'n' stuff is impossible to
    figure out. Besides, in this case we don't actually need to restart the 
    server every file change. Only, recompile the CoffeeScript, Handlebars 
    templates and CSS files (Using SASS).
###

connect = require 'connect'
http    = require 'http'
path    = require 'path'

startDevelopmentWebServer = (port) ->
    port or= process.env.PORT or 8001
    app = connect()
    app.use connect.logger 'dev'
    for directory in ['src', 'public']
        app.use connect.static path.join __dirname, directory
    http.createServer app
    .listen port

    gutil.log 'Server:', 'Welcome to SpaceBotWar!'
    gutil.log 'Server:', "Hit http://localhost:#{port} and git to work!!"
    # ^ see what I did there! ;-)



###
    Just a clean way to define tasks. Because OCD.
###
tasks =
    test: () ->
        # TODO
        throw new Error 'Error: Testing not implemented!'

    build: () ->
        console.log 'Not implemented!'

        ###
            TODO:
                - Compile all the CoffeeScript to JavaScript
                - Use r.js to concatenate it and all deps
                - Run the Google Closure Compiler on it
                - Dump the remains into public/dist to be used my 
                  public/production.html (which also needs to be done)
        ###

    develop: () ->
        startDevelopmentWebServer()

        gulp.watch 'src/app/**/*.coffee', ['compile']
        gulp.watch 'src/templates/**/*.html', ['compile']

    compile: () ->
        gulp.src ['src/app/**/*.coffee']
            .pipe coffee(
                bare      : yes
                sourceMap : yes
            ).on 'error', gutil.log
            .pipe gulp.dest 'src/app'

gulp.task name, task for name, task of tasks
