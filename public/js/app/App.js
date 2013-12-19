define([    'my-config',    'jquery',    'backbone', 'marionette',   'components/lobby', 'underscore',   'handlebars', 'jquery.json'],
function (   MyConfig,       $,          Backbone,   Marionette,     Lobby,              _,              Handlebars) {
    var App,lobby;

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
    var lobby = new Lobby;

    App.addInitializer(lobby.init);
    
    App.vent.on("ws:connected", function(data) {
        console.log("ws:connected - triggered. ["+data+"]");
    });

    Backbone.on("user:login", function(msg) {
        console.log("user:login was triggered ["+msg.username+"]["+msg.password+"]");
    });
    return App;
});

