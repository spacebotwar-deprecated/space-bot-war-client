define [
    'my-config'
    'jquery'
    'backbone'
    'components/connection'
], (
    MyConfig
    $
    Backbone
    Connection
) ->

    # The Player server is responsible for getting the next move from a player
    # TODO: This does not really belong here it is just for test purposes for now
    #
    class Player
        init: () ->
            # In  here 'this' refers to the Marionette App defined in app.js

            # Vas: this is throwing WebSocket errors in my face while I'm 
            #      trying to debug something else. Not doing anything anyway.
            #      Commented out for now. (And is now old/broken :D)
            # self.connection = new Connection(MyConfig.webSocketUrls.player, "wsm");
            # self.connection.init();

            # Backbone.on("wsm:send", function(data) {
            #     console.log("wsm:send " + JSON.stringify(data));
            # });

            # Just to indicate this works
            console.log 'Player.init()'
 
    return Player
