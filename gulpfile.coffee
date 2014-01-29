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
    port = port or process.env.PORT or 8001
    app = connect()
    app.use connect.logger 'dev'
    for directory in ['src', 'public']
        app.use connect.static path.join __dirname, directory
    http.createServer(app).listen(port)

    console.log 'Welcome to SpaceBotWar!'
    console.log "Hit http://localhost:#{port} and git to work!!"



###
    Just a clean way to define tasks. Because OCD.
###
tasks =
    test: () ->
        # TODO
        throw new Error 'Error: Testing not implemented!'

    build: () ->
        console.log 'building the code thing'

        ###
            TODO:
                - Concat all files
                - Test all the stuff (QUnit, JSHint)
                - Uglify it
                - do stuff with the css and images (maybe? TODO!)
        ###

    develop: () ->
        startDevelopmentWebServer()

        gulp.watch 'src/app/**/*.coffee', ['compile']
        gulp.watch 'src/templates/**/*.html', ['compile']

    compile: () ->
        # TODO: this is ugly, Coffeescript 1.7.0 allows this to look nicer, but 
        # we have dependencies that need 1.6.3. For now. :D
        gulp.src(['src/app/**/*.coffee'])
            .pipe(coffee({bare:yes, sourceMap:yes}).on('error', gutil.log))
            .pipe(gulp.dest('src/app'))

gulp.task name, task for name, task of tasks
