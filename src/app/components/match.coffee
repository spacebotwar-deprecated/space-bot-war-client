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

            # Vas: this is throwing WebSocket errors in my face while I'm 
            #      trying to debug something else. Not doing anything anyway.
            #      Commented out for now.
            # self.connection = new Connection(MyConfig.webSocketUrls.match, "wsm");
            # self.connection.init();

            # Backbone.on("wsm:send", function(data) {
            #     console.log("wsm:send " + JSON.stringify(data));
            # });

            # Just to indicate this works
            console.log 'Match.init()'

    return Match
