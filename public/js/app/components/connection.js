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

    function Connection(url, prefix) {
        var self    = this;
        self.url    = url;
        self.prefix = prefix;
        
        self.init = function() {
            console.log('Debug: attempting connection to ' + self.url);
            self.connection = new WebSocket(self.url);

            self.connection.onerror     = self.onError;
            self.connection.onopen      = self.onOpen;
            self.connection.onmessage   = self.onMessage;

        };

        self.onError = function(e) {
            Backbone.trigger(self.prefix+":error", e);
            console.log(self.prefix+":error", e);
        };

        self.onOpen = function() {
            Backbone.trigger(self.prefix+":connected");
            console.log(self.prefix+":connected");
            Humane.log("Connection made!");
        };

        self.onMessage = function(e) {
            var data    = $.evalJSON(e.data);
            var route   = data.route;
            var content = data.content;
            console.log(self.prefix+":recv:" + route, e.data);

            if (content.code == 0) {
                Backbone.trigger(self.prefix+":recv:" + route, data);
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
