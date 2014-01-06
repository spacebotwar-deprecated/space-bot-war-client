define([    'my-config',    'jquery',    'backbone', 'humane',  'jquery.json'],
function (   MyConfig,       $,           Backbone,   Humane) {

    // The Start Server is responsible for handling login and registration
    // 
    var StartServer = function() {
        var ws;
        var wsm;
        var wsp;
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

                wsm = new WebSocket(MyConfig.web_socket_match_url);
                wsm.onmessage = function(e) {
                    var data    = $.evalJSON(e.data);
                    var route   = data.route;
                    var content = data.content;
                    //console.log("wsm:recv:"+route, e.data);
                    Backbone.trigger("wsm:recv:"+route, data);
                };

                Backbone.on("ws:send", function(data) {
                    console.log("ws:send "+JSON.stringify(data));
                });

                // test of player web socket
                wsp = new WebSocket(MyConfig.web_socket_player_url);
                wsp.onmessage = function(e) {
                    var data    = $.evalJSON(e.data);
                    var route   = data.route;
                    var content = data.content;
                    console.log("wsp:recv:"+route, e.data);
                };
                



                Backbone.on("user:register", function(data) {
                    var msg = {
                        route   : "/foo",
                        content : {},
                    };
                    ws.send(JSON.stringify(msg));
                });

                // The user has logged in
                Backbone.on("user:login", function(data) {
                    console.log("BACKBONE: user:login "+JSON.stringify(data));
                    var msg = {
                        route   : "/login_with_password",
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
                        route   : "/logout",
                        content : {
                            client_code : client_code
                        }
                    };
                    ws.send(JSON.stringify(msg));
                });

                Backbone.on("ws:recv:/get_client_code", function(data) {
                    client_code = data.content.client_code;
                    localStorage.client_code = client_code;
                    console.log("client code is now "+client_code);
                });
                Backbone.on("ws:connected", function() {
                    var msg = {
                        route   : "/get_client_code",
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
    return StartServer;
});

