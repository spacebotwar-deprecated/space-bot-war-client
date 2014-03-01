define [
    'my-config'
    'backbone'
    'marionette'
    'jquery'
    'app/components/lobby'
    'app/components/player'
    'app/components/match'
    'app/components/start'
    'app/util/templates'
], (
    MyConfig
    Backbone
    Marionette
    $
    Lobby
    Player
    Match
    Start
    Templates
) ->

    Templates.load 'baseHtml', 'baseHtml'

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

    app.addInitializer () ->
        if window.sbwTest
            $ document.body
                .append "<div class=\"container\">#{Templates.get('baseHtml')()}</div>"
        else
            # This is not good MV* practice, but I'm not sure there's a better way.
            $ document.body
                .html Templates.get 'baseHtml'

        # To the welcome page!
        window.location.hash = 'welcome'

    app.on 'initialize:before', () ->
        # TODO: remember what window.location.hash was so we can jump to it
        # after logging in.
        # do something with this variable, perhaps append it to `app` ?
        oldLocation = window.location.hash
        window.location.hash = ''

    app.on 'initialize:after', () ->
        # Used in the unit tests to know when it's safe to start interacting
        # with the application.
        # window.sbwLoaded = true

        # TODO: perhaps here is the place to jump to the 
        # previous window.location.hash?

        if window.sbwTest
            # Used to trick the RequireJS optimizer into not including the unit
            # tests into the production build.
            trick = 'app/test'
            require [trick]


    app
