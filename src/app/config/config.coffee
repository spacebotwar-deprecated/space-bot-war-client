require.config

    baseUrl: '/'

    paths:
        # Backbone and all it's things
        "backbone"            : "js-libs/backbone-amd/backbone"
        "marionette"          : "js-libs/marionette/lib/core/amd/backbone.marionette"
        "backbone.babysitter" : "js-libs/backbone.babysitter/lib/amd/backbone.babysitter"
        "backbone.wreqr"      : "js-libs/backbone.wreqr/lib/amd/backbone.wreqr"

        # I don't know what to call this bunch of weirdos
        "handlebars"          : "js-libs/handlebars/handlebars.amd"
        "underscore"          : "js-libs/lodash/dist/lodash"
        "lodash"              : "js-libs/lodash/dist/lodash"
        "humane"              : "js-libs/humane-js/humane"

        # jQuery and friends
        "jquery"              : "//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min"
        "jqueryviewport"      : "js-libs/jquery.viewport/jquery.viewport"
        "bootstrap"           : "js-libs/bootstrap/dist/js/bootstrap"

        # This does not use Bower because jQueryUI needs to be built after
        # downloaded. For now, it will sit here.
        # TODO: get jQueryUI to be managed by Bower!
        "jqueryui"            : "js-libs/jqueryui"

        # This is hosted on  Google Code, which, Bower can't download from.
        "jquery.json"    : "js-libs/plugins/jquery.json.min"

        # We can't use Bower to manage our own configuration module.
        "my-config"           : "js-libs/my-config"

        # Plugins
        "image"          : "js-libs/requirejs-plugins/src/image"

    # Sets the configuration for your third party scripts that are not AMD compatible
    shim:
        # Get all these guys together.
        "bootstrap"   : ["jquery"]
        "jqueryui"    : ["jquery"]
        "jquery.json" : ["jquery"]

        # *sigh* ... and you, too...
        "jqueryviewport" : ["jqueryui"]


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
