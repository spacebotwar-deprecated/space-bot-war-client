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

            self.connection = new Connection(MyConfig.web_socket_match_url,"wsm");
            self.connection.init();

            Backbone.on("wsm:send", function(data) {
                console.log("wsm:send " + JSON.stringify(data));
            });
        };
    };
    
    return Match;
});

