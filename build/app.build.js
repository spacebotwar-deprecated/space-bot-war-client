({
    wrap: true,
    baseUrl: '../src',
    //mainConfigFile: '../src/app/config/config.js',
    // node r.js -o name=path/to/almond include=main out=main-built.js wrap=true
    name: 'js-libs/almond/almond',
    // name: 'app/config/config',
    include: 'app/config/config',
    out: '../public/dist/build.js',
    keepBuildDir: true,
    optimize: 'none',
    optimizeCss: 'none',

    paths: {
    "backbone": "js-libs/backbone-amd/backbone",
    "marionette": "js-libs/marionette/lib/core/amd/backbone.marionette",
    "backbone.babysitter": "js-libs/backbone.babysitter/lib/amd/backbone.babysitter",
    "backbone.wreqr": "js-libs/backbone.wreqr/lib/amd/backbone.wreqr",
    "handlebars": "js-libs/handlebars/handlebars.amd",
    "underscore": "js-libs/lodash/dist/lodash",
    "lodash": "js-libs/lodash/dist/lodash",
    "humane": "js-libs/humane-js/humane",
    "jquery": "js-libs/jquery/jquery",
    "jqueryviewport": "js-libs/jquery.viewport/jquery.viewport",
    "bootstrap": "js-libs/bootstrap/dist/js/bootstrap",
    "jqueryui": "js-libs/jqueryui",
    "jquery.json": "js-libs/plugins/jquery.json.min",
    "my-config": "js-libs/my-config",
    "image": "js-libs/requirejs-plugins/src/image"
  },
  shim: {
    "bootstrap": ["jquery"],
    "jqueryui": ["jquery"],
    "jquery.json": ["jquery"],
    "jqueryviewport": ["jqueryui"]
  }
})
