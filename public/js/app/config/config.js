require.config({
    baseUrl:"./js/app",
    // 3rd party script alias names (Easier to type "jquery" than "libs/jquery, etc")
    // probably a good idea to keep version numbers in the file names for updates checking
    paths:{
        // Core Libraries
        "my-config":"../libs/my-config",
        "jquery":"//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min",
        "jqueryui":"//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min",
        "ocanvas":"http://cdnjs.cloudflare.com/ajax/libs/ocanvas/2.5.0/ocanvas.min",
        "jquerymobile":"../libs/jquery.mobile",
        "jqueryviewport": "../libs/jquery.viewport",
        "underscore":"../libs/lodash",
        "backbone":"../libs/backbone",
        "marionette":"../libs/backbone.marionette",
        "handlebars":"../libs/handlebars",
        "hbs":"../libs/hbs",
        "i18nprecompile":"../libs/i18nprecompile",
        "json2":"../libs/json2",
        "jasmine": "../libs/jasmine",
        "jasmine-html": "../libs/jasmine-html",
        "login-radius": "../libs/login-radius",
        "radius-hub": "https://hub.loginradius.com/cdn/include/js/LoginRadius.1.0",
        "humane": "../libs/humane",

        // Plugins
        "backbone.validateAll":"../libs/plugins/Backbone.validateAll",
        "bootstrap":"../libs/plugins/bootstrap",
        "text":"../libs/plugins/text",
        "image":"../libs/plugins/image",
        "jasminejquery": "../libs/plugins/jasmine-jquery",
        "jquery.json" : "../libs/plugins/jquery.json.min"
    },
    // Sets the configuration for your third party scripts that are not AMD compatible
    shim:{
        // Twitter Bootstrap jQuery plugins
        "bootstrap":["jquery"],
        // jQueryUI
        "jqueryui":["jquery"],
        // jQuery mobile
        "jquerymobile":["jqueryui"],
        
        // viewport
        "jqueryviewport" : ["jqueryui"],

        // Radius
        "login-radius": {
            "exports":"LoginRadiusSDK"
        },
        "radius-hub":{
            "exports":"LoginRadius_SocialLogin"
        },
        "ocanvas":{
            "exports":"oCanvas"
        },
        // Backbone
        "backbone":{
            // Depends on underscore/lodash and jQuery
            "deps":["underscore", "jquery"],
            // Exports the global window.Backbone object
            "exports":"Backbone"
        },
        //Marionette
        "marionette":{
            "deps":["underscore", "backbone", "jquery"],
            "exports":"Marionette"
        },
        //Handlebars
        "handlebars":{
            "exports":"Handlebars"
        },
        // Backbone.validateAll plugin that depends on Backbone
        "backbone.validateAll":["backbone"],

        "jasmine": {
            // Exports the global 'window.jasmine' object
            "exports": "jasmine"
        },

        "jasmine-html": {
            "deps": ["jasmine"],
            "exports": "jasmine"
        },

        "jquery.json": {
            "deps": ["jquery"]
        }
    },
    // hbs config - must duplicate in Gruntfile.js Require build
    hbs: {
        templateExtension: "html",
        helperDirectory: "templates/helpers/",
        i18nDirectory: "templates/i18n/",

        compileOptions: {}        // options object which is passed to Handlebars compiler
    }
});
