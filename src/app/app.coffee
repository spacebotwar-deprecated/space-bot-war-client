define [
    'my-config'
    'jquery'
    'backbone'
    'marionette'
    'app/components/lobby'
    'app/components/player'
    'app/components/match'
    'app/components/start'
    'underscore'
    'handlebars'
    'jquery.json'
    'humane'
], (
    MyConfig
    $
    Backbone
    Marionette
    Lobby
    Player
    Match
    Start
    _
    Handlebars
) ->

    App     = new Backbone.Marionette.Application
    lobby   = new Lobby
    player  = new Player
    match   = new Match
    start   = new Start

    # Organize Application into regions corresponding to DOM elements
    # Regions can contain views, Layouts, or subregions nested as necessary
    App.addRegions
        headerRegion : "#header"
        mainRegion   : "#main"
        footerRegion : "#footer"
        menuRegion   : "#menu"

    App.addInitializer () ->
        Backbone.history.start();

    # Init the various web socket connections
    App.addInitializer lobby.init
    App.addInitializer match.init
    App.addInitializer player.init
    App.addInitializer start.init

    return App
