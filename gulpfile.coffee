`"use strict"`

gulp    = require 'gulp'
gutil   = require 'gulp-util'
bower   = require 'bower'
chalk   = require 'chalk'
fs      = require 'fs'

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

    gutil.log 'Welcome to SpaceBotWar!'
    gutil.log "Hit http://localhost:#{port} and git to work!!"
    # ^ see what I did there! ;-)



###
    Just a clean way to define tasks. Because OCD.
###
tasks =
    test:
        deps: []
        func: () ->
            # TODO
            gutil.log chalk.red 'Error: Testing not implemented!'

    develop: 
        deps: ['compile']
        func: () ->
            startDevelopmentWebServer()

            gulp.watch 'src/app/**/*.coffee', ['compile']
            gulp.watch 'src/templates/**/*.html', ['compile']

    compile:
        deps: []
        func: () ->
            gulp.src ['src/app/**/*.coffee']
                .pipe coffee(
                    bare      : yes
                    sourceMap : yes
                ).on 'error', gutil.log
                .pipe gulp.dest 'src/app'

    updatedeps:
        deps: []
        func: () ->
            # TODO:
            # npm update
            # bower install

gulp.task name, task.deps, task.func for name, task of tasks
