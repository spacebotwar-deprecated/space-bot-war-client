define([
    'my-config',
    'jquery',
    'backbone',
    'marionette',
    'components/lobby',
    'components/player',
    'components/match',
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
    Player,
    Match,
    _,
    Handlebars
) {
    var App, lobby, player, match;

    App = new Backbone.Marionette.Application();
    lobby   = new Lobby();
    player  = new Player();
    match   = new Match();

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
    App.addInitializer(lobby.init);
    App.addInitializer(player.init);
    App.addInitializer(match.init);

    return App;
});

