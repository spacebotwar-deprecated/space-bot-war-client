`"use strict"`

gulp = require 'gulp'

tasks =
    build: () ->
        console.log 'building the code thing'

        ###
            TODO:
                - Concat all files
                - Test all the stuff (QUnit, JSHint)
                - Uglify it
                - do stuff with the css and images (maybe? TODO!)
        ###

gulp.task name, task for name, task of tasks
