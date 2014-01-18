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

    // The match server is responsible for co-ordinating a match between two players
    // 
    var Match = function() {
        var self = this;

        self.init = function() {
            // In here 'this' refers to the Marionette App.

            // Vas: this is throwing WebSocket errors in my face while I'm 
            //      trying to debug something else. Not doing anything anyway.
            //      Commented out for now.
            self.connection = new Connection(MyConfig.webSocketUrls.match, "wsm");
            self.connection.init();

            Backbone.on("wsm:send", function(data) {
                console.log("wsm:send " + JSON.stringify(data));
            });
        };
    };
    
    return Match;
});

