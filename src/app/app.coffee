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
    #app.addInitializer lobby.init # lobby is, let's just say, out of service ;)
    app.addInitializer match.init
    app.addInitializer player.init
    app.addInitializer start.init

    # Warning: I don't have enough nice words to describe how I feel about this
    # piece of code. So I won't use nice words.
    # This is the dumbest piece of shit hack I've done in ages. After hours
    # of trying to figure this out I find that it's just Marionette being 
    # fucking retarded and trying to do everything itself.
    # TODO: really, I mean it, revamp the template loading, real good.
    Backbone.Marionette.TemplateCache.prototype.loadTemplate = (foo) -> foo

    return app
