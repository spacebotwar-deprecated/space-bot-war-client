({
    wrap: true,
    baseUrl: '../src',
    //mainConfigFile: '../src/app/config/config.js',
    // node r.js -o name=path/to/almond include=main out=main-built.js wrap=true
    name: 'js-libs/almond',
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
    "my-config": "js-libs/my-config",
    "jquery": "js-libs/jquery",
    "jqueryui": "js-libs/jqueryui",
    "jqueryviewport": "js-libs/jquery.viewport",
    "underscore": "js-libs/lodash",
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
    "backbone.validateAll": ["backbone"],
    "jquery.json": ["jquery"]
  }
})
