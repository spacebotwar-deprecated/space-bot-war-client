define([    'my-config',    'jquery',    'backbone', 'humane',  'jquery.json'],
function (   MyConfig,       $,           Backbone,   Humane) {

    // The Lobby is responsible for handling login and registration
    // 
    var Lobby = function() {
        var ws;

        var client_code = localStorage.client_code;
        console.log("client code initialised from local storage : "+client_code);
        Humane.error = Humane.spawn({ addnCls: 'humane-libnotify-error', timeout : 3000});

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
                    Humane.log("Connection made");
                };

                ws.onmessage = function(e) {
                    var data    = $.evalJSON(e.data);
                    var route   = data.route;
                    var content = data.content;
                    console.log("ws:recv:"+route, e.data);
                    if (content.code == 0) {
                        Backbone.trigger("ws:recv:"+route, data);
                    }
                    else {
                        // for now, on an error, put up a 'humane' message.
                        Humane.error("ERROR: "+content.code+" - "+content.message);
                    }
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
                // The user has logged out
                Backbone.on("user:logout", function() {
                    console.log("BACKBONE: user:logout ");
                    var msg = {
                        route   : "/lobby/logout",
                        content : {
                            client_code : client_code
                        }
                    };
                    ws.send(JSON.stringify(msg));
                });

                Backbone.on("ws:recv:/lobby/get_client_code", function(data) {
                    client_code = data.content.client_code;
                    localStorage.client_code = client_code;
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

