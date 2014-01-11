define([
    'my-config',
    'jquery',
    'backbone',
    'marionette',
    'components/lobby',
    'underscore',
    'handlebars',
    'jquery.json',
    'humane'
],
function(
    MyConfig, 
    $,
    Backbone,
    Marionette,
    Lobby,
    _,
    Handlebars
) {
    var App, lobby;

    App = new Backbone.Marionette.Application();
    lobby = new Lobby();

    App.mobile = (function() {
        var userAgent = navigator.userAgent || navigator.vendor || window.opera;
        return ((/iPhone|iPod|iPad|Android|BlackBerry|Opera Mini|IEMobile/).test(userAgent));
    })();

    // Organize Application into regions corresponding to DOM elements
    // Regions can contain views, Layouts, or subregions nested as necessary
    App.addRegions({
        headerRegion : "#header",
        mainRegion   : "#main",
        footerRegion : "#footer",
        menuRegion   : "#menu",
    });

    App.addInitializer(function () {
        Backbone.history.start();
    });

    // Init the lobby
    App.addInitializer(lobby.init);
    
    App.vent.on("ws:connected", function(data) {
        console.log("ws:connected - triggered. [" + data + "]");
    });

    return App;
});

