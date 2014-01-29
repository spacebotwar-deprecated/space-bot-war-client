require.config

    baseUrl: '/'

    paths:
        # Core Libraries
        "my-config"      : "js-libs/my-config"
        "jquery"         : "js-libs/jquery"
        "jqueryui"       : "js-libs/jqueryui"
        # "ocanvas"        : "http://cdnjs.cloudflare.com/ajax/js-libs/ocanvas/2.5.0/ocanvas.min"
        "jqueryviewport" : "js-libs/jquery.viewport"
        "underscore"     : "js-libs/lodash"
        "backbone"       : "js-libs/backbone"
        "marionette"     : "js-libs/backbone.marionette"
        "handlebars"     : "js-libs/handlebars"
        "i18nprecompile" : "js-libs/i18nprecompile"
        "hbs"            : "js-libs/hbs"
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
        
        # Backbone
        "backbone":
            # Depends on underscore/lodash and jQuery
            "deps" : ["underscore", "jquery"]
            # Exports the global window.Backbone object
            "exports" : "Backbone"
        
        # Marionette
        "marionette":
            "deps" : ["underscore", "backbone", "jquery"]
            "exports" : "Marionette"
        
        # Handlebars
        "handlebars":
            "exports" : "Handlebars"
        
        # Backbone.validateAll plugin that depends on Backbone
        "backbone.validateAll" : ["backbone"]

        "jquery.json":
            "deps" : ["jquery"]
    
    # hbs config
    hbs:
        templateExtension : "html"
        disableI18n       : true
        disableHelpers    : true

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
        require ['app/init/desktopInit'], (thing={}) ->
            # do something
            console.log thing
    else
        # TODO: fix this miserable mess!
        error =  '
            We have absolutely zero mobile support! Use with caution!
        '
        alert error
        throw new Error error
        require ['init/mobileInit'], (thing={}) ->
            # do something
            console.log thing
