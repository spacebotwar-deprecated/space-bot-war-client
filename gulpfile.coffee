`"use strict"`

gulp = require 'gulp'

tasks =
    test: () ->
        # TODO
        console.log 'Error: Testing not implemented!'

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
        # TODO

    compile: () ->
        # TODO
        console.log '
            This is the only place where CoffeeScript code will be 
            compiled. The Perl script in use right now is only temporary.
            Please stand by while I get my act together for that. :D
        '

gulp.task name, task for name, task of tasks
