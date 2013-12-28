define([    'my-config',    'jquery',    'backbone', 'marionette',   'components/start_server', 'underscore',   'handlebars', 'jquery.json', 'humane'],
function (   MyConfig,       $,          Backbone,   Marionette,     StartServer,              _,              Handlebars) {
    var App,start_server;

    App = new Backbone.Marionette.Application();

    function isMobile() {
        var userAgent = navigator.userAgent || navigator.vendor || window.opera;
        return ((/iPhone|iPod|iPad|Android|BlackBerry|Opera Mini|IEMobile/).test(userAgent));
    }

    //Organize Application into regions corresponding to DOM elements
    //Regions can contain views, Layouts, or subregions nested as necessary
    App.addRegions({
        headerRegion    : "#header",
        mainRegion      : "#main",
        footerRegion    : "#footer",
        menuRegion      : "#menu",
    });

    App.addInitializer(function () {
        Backbone.history.start();
    });

    App.mobile = isMobile();
    var start_server = new StartServer;

    App.addInitializer(start_server.init);
    
    App.vent.on("ws:connected", function(data) {
        console.log("ws:connected - triggered. ["+data+"]");
    });

    return App;
});

