define [
    'my-config'
    'backbone'
    'marionette'
    'jquery'
    'app/components/lobby'
    'app/components/player'
    'app/components/match'
    'app/components/start'
], (
    MyConfig
    Backbone
    Marionette
    $
    Lobby
    Player
    Match
    Start
) ->

    app     = new Backbone.Marionette.Application
    lobby   = new Lobby
    player  = new Player
    match   = new Match
    start   = new Start

    # Organize Application into regions corresponding to DOM elements
    # Regions can contain views, Layouts, or subregions nested as necessary
    app.addRegions
        headerRegion : "#header"
        mainRegion   : "#main"
        footerRegion : "#footer"
        menuRegion   : "#menu"

    app.addInitializer () ->
        Backbone.history.start();

    # Init the various web socket connections
    app.addInitializer lobby.init
    app.addInitializer match.init
    app.addInitializer player.init
    app.addInitializer start.init

    return app
