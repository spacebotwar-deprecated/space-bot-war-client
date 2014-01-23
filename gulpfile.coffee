
gulp = require 'gulp'

build = () ->
    console.log 'building the code thing'

    ###
        TODO:
            - Concat all files
            - Test all the stuff (QUnit, JSHint)
            - Uglify it
            - do stuff with the css and images
    ###

gulp.task 'build', build
