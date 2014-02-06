define [
    'my-config'
    'jquery'
    'backbone'
    'app/components/connection'
], (
    MyConfig
    $
    Backbone
    Connection
) ->

    # The match server is responsible for co-ordinating a match between two players
    #
    class Match
        init: () ->
            # In  here 'this' refers to the Marionette App defined in app.js
            if MyConfig.displayWelcomeMatch? and MyConfig.displayWelcomeMatch
                @connection = new Connection MyConfig.webSocketUrls.match, "wsm"
                @connection.init()

            Backbone.on "wsm:send", (data) ->
                console.log "wsm:send " + JSON.stringify(data)

    return Match

