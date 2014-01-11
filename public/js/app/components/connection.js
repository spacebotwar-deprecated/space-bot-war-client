define([
    'backbone',
    'marionette',
    'humane'
],
function(
    Backbone,
    Marionette,
    Humane
) {

    function Connection(url) {
        var self = this;
        self.url = url;
        
        self.init = function() {
            self.connection = new WebSocket(self.url);

            self.connection.onerror = self.onError;
            self.connection.onopen = self.onOpen;
            self.connection.onmessage = self.onMessage;

        };

        self.onError = function(e) {
            Backbone.trigger("ws:error", e);
            console.log("ws:error", e);
        };

        self.onOpen = function() {
            Backbone.trigger("ws:connected");
            console.log("ws:connected");
            Humane.log("Connection made!");
        };

        self.onMessage = function(e) {
            var data    = $.evalJSON(e.data);
            var route   = data.route;
            var content = data.content;
            console.log("ws:recv:" + route, e.data);

            if (content.code == 0) {
                Backbone.trigger("ws:recv:" + route, data);
            }
            else {
                // for now, on an error, put up a 'humane' message.
                Humane.error("ERROR: " + content.code + " - " + content.message);
            }
        };

        self.send = function(data) {
            self.connection.send(JSON.stringify(data));
        };
    }

    return Connection;
});
