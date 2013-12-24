define([    'my-config',    'jquery',    'backbone', 'jquery.json'],
function (   MyConfig,       $,           Backbone   ) {

    // The Lobby is responsible for handling login and registration
    // 
    var Lobby = function() {
        var ws;

        var client_code = localStorage.client_code;

        return {
            init    : function() {
                // 'this' is the marionette application
                var wsUrl = MyConfig.web_socket_url;
                ws = new WebSocket(wsUrl);
    
                ws.onerror = function(e) {
                    Backbone.trigger("ws:error", e);
                    console.log("ws:error",e);
    
               };

                ws.onopen = function() {
                    Backbone.trigger("ws:connected");
                    console.log("ws:connected");
                };

                ws.onmessage = function(e) {
                    var data    = $.evalJSON(e.data);
                    var route   = data.route;
                    var content = data.content;
                    Backbone.trigger("ws:recv:"+route, data);
                    console.log("ws:recv:"+route, e.data);
                };

                Backbone.on("ws:send", function(data) {
                    console.log("ws:send "+JSON.stringify(data));
                });
                
                // The user has logged in
                Backbone.on("user:login", function(data) {
                    console.log("BACKBONE: user:login "+JSON.stringify(data));
                    var msg = {
                        route   : "/lobby/login_with_password",
                        content : {
                            password    : data.password,
                            username    : data.username,
                            client_code : client_code
                        }
                    };
                    ws.send(JSON.stringify(msg));
                });

                Backbone.on("ws:recv:/lobby/get_client_code", function(data) {
                    client_code = data.content.client_code;
                    console.log("client code is now "+client_code);
                });
                Backbone.on("ws:connected", function() {
                    var msg = {
                        route   : "/lobby/get_client_code",
                        content : {
                            client_code : ""+client_code
                        }
                    };
                    ws.send(JSON.stringify(msg));
                });
            },
            // Send a message and respond to the reply
            send_recv   : function() {

            }
        };
    };
    return Lobby;
});

