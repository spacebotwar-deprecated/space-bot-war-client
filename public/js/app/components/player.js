define([
    'my-config',
    'jquery',
    'backbone',
    'components/connection'
],
function(
    MyConfig,
    $,
    Backbone,
    Connection
) {

    // The Player server is responsible for getting the next move from a player
    // TODO: This does not really belong here it is just for test purposes for now
    // 
    var Player = function() {
        var self = this;

        self.init = function() {
            // In here 'this' refers to the Marionette App.

            // Vas: I don't see this doing anything  atm so commenting to  avoid
            //      confusion while debugging other stuff.
//            self.connection = new Connection(MyConfig.webSocketUrls.player,"wsp");
//            self.connection.init();

            Backbone.on("wsp:send", function(data) {
                console.log("wsp:send " + JSON.stringify(data));
            });
        };
    };
    
    return Player;
});

