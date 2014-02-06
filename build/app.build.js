// ({
//     baseUrl: '../src',
//     dir: "../public/dist",
//     name: 'app/config/config',
//     mainConfigFile: '../src/app/config/config.js',
//     optimize: 'none',
//     optimizeCss: 'none',

//     onBuildRead: function(name, path) {
//         console.log(name + ', ' + path);
//     }
// })

({
    baseUrl: '../src',
    //mainConfigFile: '../src/app/config/config.js',
    name: 'app/config/config',
    out: '../public/dist/build.js',
    keepBuildDir: true,

    paths: {
        "my-config": "js-libs/my-config",
        "jquery": "js-libs/jquery",
        "jqueryui": "js-libs/jqueryui",
        "jqueryviewport": "js-libs/jquery.viewport",
        "underscore": "js-libs/lodash",
        "backbone": "js-libs/backbone",
        "marionette": "js-libs/backbone.marionette",
        "handlebars": "js-libs/handlebars",
        "i18nprecompile": "js-libs/i18nprecompile",
        "hbs": "js-libs/hbs",
        "json2": "js-libs/json2",
        "humane": "js-libs/humane",
        "backbone.validateAll": "js-libs/plugins/Backbone.validateAll",
        "bootstrap": "js-libs/plugins/bootstrap",
        "text": "js-libs/plugins/text",
        "image": "js-libs/plugins/image",
        "jquery.json": "js-libs/plugins/jquery.json.min"
    },
    shim: {
        "bootstrap": ["jquery"],
        "jqueryui": ["jquery"],
        "jqueryviewport": ["jqueryui"],
        "ocanvas": {
            "exports": "oCanvas"
        },
        "backbone": {
            "deps": ["underscore", "jquery"],
            "exports": "Backbone"
        },
        "marionette": {
            "deps": ["underscore", "backbone", "jquery"],
            "exports": "Marionette"
        },
        "handlebars": {
            "exports": "Handlebars"
        },
        "backbone.validateAll": ["backbone"],
        "jquery.json": {
            "deps": ["jquery"]
        }
    },

    hbs: {
        templateExtension: "html",
        disableI18n: true,
        disableHelpers: true
    },

    onBuildRead: function(name, path, contents) {
        console.log(name + ', ' + path);
        // console.log(contents);

        return contents;
    }
}) 

/*
({
    baseUrl: 'src',
    out: 'Lacuna-Web-Client-jQuery-Build.js',
    name: 'load',

    keepBuildDir: true,

    shim: {
        jqueryUI: ['jquery'], // Attach jQueryUI to jQuery.
        underscore: {
            exports: '_'
        },
        zebra_cookie: ['jquery'] // Attach zebra_cookie to jQuery.
    },

    paths: {
        jquery: 'js/jquery',
        jqueryUI: 'js/jqueryUI',
        zebra_cookie: 'js/zebra_cookie',
        underscore: 'js/underscore'
    },

    onBuildRead: function(name, path, contents) {
        console.log(name + ', ' + path + ', ' + contents);

        return contents;
    }
    
})
*/
