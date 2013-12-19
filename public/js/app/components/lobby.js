define([    'my-config',    'jquery',    'backbone', 'jquery.json'],
function (   MyConfig,       $,           Backbone   ) {

    var Lobby = function() {
        var ws;

        return {
            init    : function() {
                // 'this' is the marionette application
                var app = this;
                var wsUrl = MyConfig.web_socket_url;
                ws = new WebSocket(wsUrl);
    
                ws.onerror = function(e) {
                    app.vent.trigger("ws:error", e);
                    console.log("ws:error",e);
                };

                ws.onopen = function() {
                    app.vent.trigger("ws:connected");
                    console.log("ws:connected");
                };

                ws.onmessage = function(e) {
                    var data    = $.evalJSON(e.data);
                    var route   = data.route;
                    var content = data.content;
                    app.vent.trigger("ws:"+route, content);
                    console.log("ws:"+route, e.data);
                };
            }
        };
    };
    return Lobby;
});

