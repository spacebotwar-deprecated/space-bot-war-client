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

        # jquery and friends
        "jquery"              : "js-libs/jquery/dist/jquery"
        "jqueryviewport"      : "js-libs/jquery.viewport/jquery.viewport"
        "bootstrap"           : "js-libs/bootstrap/dist/js/bootstrap"
        "jqueryui"            : "app/mods/jqueryui"

        "my-config"           : "js-libs/my-config"

        # Plugins
        "image"               : "js-libs/requirejs-plugins/src/image"

        "notify-lib"          : "js-libs/jquery-mininotification/js/miniNotification"

        # Path to the dir which has all the jqueryui components in it.
        # Used in app/mods/jquery.
        "jqui-dir" : "js-libs/jquery.ui/ui"


        # Used to configure Woodman
        "woodman" : "app/mods/woodman"

        # The actual path to Woodman
        "woodman-js" : "js-libs/woodman/dist/woodman-amd"

    # Sets the configuration for your third party scripts that are not AMD compatible
    shim:
        # Get all these guys together.
        "bootstrap"   : ["jquery"]
        "jqueryui"    : ["jquery"]

        # *sigh* ... and you, too...
        "jqueryviewport" : ["jqueryui"]


requirejs [
    'woodman'
], (
    Woodman
) ->

    # THIS is the main entry point of the application!
    logger = Woodman.getLogger 'app/config/config'
    logger.log 'Reached the main entry point of the application.'

    # Figure out weather this is Mobile or Desktop to conditionally start
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
            You shall NOT pass!
        '
        alert error
        throw new Error error
        # require ['app/init/mobileInit'], (thing={}) ->
        #     # do something
        #     console.log thing
