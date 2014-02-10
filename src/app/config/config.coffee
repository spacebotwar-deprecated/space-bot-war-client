require.config

    baseUrl: '/'

    paths:
        # Backbone and all it's things
        "backbone"            : "js-libs/backbone-amd/backbone"
        "marionette"          : "js-libs/marionette/lib/core/amd/backbone.marionette"
        "backbone.babysitter" : "js-libs/backbone.babysitter/lib/amd/backbone.babysitter"
        "backbone.wreqr"      : "js-libs/backbone.wreqr/lib/amd/backbone.wreqr"

        "handlebars"          : "js-libs/handlebars/handlebars.amd"

        # Everything below (not using Bower) is wrong.
        # Core Libraries
        "my-config"      : "js-libs/my-config"
        "jquery"         : "js-libs/jquery"
        "jqueryui"       : "js-libs/jqueryui"
        # "ocanvas"        : "http://cdnjs.cloudflare.com/ajax/js-libs/ocanvas/2.5.0/ocanvas.min"
        "jqueryviewport" : "js-libs/jquery.viewport"
        "underscore"     : "js-libs/lodash"
        # "backbone"       : "js-libs/backbone"
        # "marionette"     : "js-libs/backbone.marionette"
        # "handlebars"     : "js-libs/handlebars"
        "json2"          : "js-libs/json2"
        "humane"         : "js-libs/humane"

        # Plugins
        "backbone.validateAll" : "js-libs/plugins/Backbone.validateAll"
        "bootstrap"            : "js-libs/plugins/bootstrap"
        "text"                 : "js-libs/plugins/text"
        "image"                : "js-libs/plugins/image"
        "jquery.json"          : "js-libs/plugins/jquery.json.min"

    # Sets the configuration for your third party scripts that are not AMD compatible
    shim:
        # Twitter Bootstrap jQuery plugins
        "bootstrap" : ["jquery"]

        # jQueryUI
        "jqueryui" : ["jquery"]

        # viewport
        "jqueryviewport" : ["jqueryui"]

        "ocanvas":
            "exports" : "oCanvas"

        # Backbone.validateAll plugin that depends on Backbone
        "backbone.validateAll" : ["backbone"]

        "jquery.json": ["jquery"]

requirejs [
], (

) ->
    # THIS is the main entry point of the application!
    console.log "O-hai there!"

    # Figure out weather this is Mobile or Desktop to conditionally include
    # the correct code. (It's not a size thing, it's loading the correct
    # templates and CSS, in case you were wondering...)
    userAgent = navigator.userAgent or navigator.vendor or window.opera
    mobile = /iPhone|iPod|iPad|Android|BlackBerry|Opera Mini|IEMobile/.test userAgent

    if not mobile
        require ['app/init/desktopInit'], () ->
            # do something
    else
        # TODO: fix this miserable mess!
        error =  '
            We have absolutely zero mobile support! Use with caution!
        '
        alert error
        throw new Error error
        require ['app/init/mobileInit'], (thing={}) ->
            # do something
            console.log thing
