define([
    'my-config',
    'jquery',
    'backbone',
    'marionette',
    'components/player',
    'components/match',
    'components/start',
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
    Player,
    Match,
    Start,
    _,
    Handlebars
) {

    var App     = new Backbone.Marionette.Application(),
        player  = new Player(),
        match   = new Match(),
        start   = new Start()
    ;

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

    // Init the various web socket connections
    App.addInitializer(match.init);
    App.addInitializer(player.init);
    App.addInitializer(start.init);

    return App;
});

