`"use strict"`

gulp = require 'gulp'

taskDefinitions =
    build: () ->
        console.log 'building the code thing'

        ###
            TODO:
                - Concat all files
                - Test all the stuff (QUnit, JSHint)
                - Uglify it
                - do stuff with the css and images (maybe? TODO!)
        ###

tasks = Object.keys taskDefinitions
gulp.task task, taskDefinitions[task] for task in tasks
