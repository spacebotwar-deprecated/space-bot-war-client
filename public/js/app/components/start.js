define([
    'my-config',
    'jquery',
    'backbone',
    'components/connection',
    'components/session',
    'humane'
],
function(
    MyConfig,
    $,
    Backbone,
    Connection,
    Session,
    Humane
) {

    // The Start Module is responsible for handling login and registration
    // 
    var Start = function() {
        var self = this;

        self.init = function() {
            // In here 'this' refers to the Marionette App.

            self.connection = new Connection(MyConfig.webSocketUrls.start, "ws");
            self.connection.init();

            // Not used
            // Backbone.on("ws:send", function(data) {
            //     console.log("ws:send " + JSON.stringify(data));
            // });
                
            // Triggered when the user hits the login button.
            Backbone.on("user:login", function(data) {
                console.log("BACKBONE: user:login " + JSON.stringify(data));
                var msg = {
                    route   : "/login_with_password",
                    content : {
                        password    : data.password,
                        username    : data.username,
                        client_code : Session.getClientCode()
                    }
                };
                self.connection.send(msg);
            });

            // The user has pressed the almighty logout button.
            Backbone.on("user:logout", function() {
                console.log("BACKBONE: user:logout ");
                var msg = {
                    route   : "/logout",
                    content : {
                        client_code : Session.getClientCode()
                    }
                };
                self.connection.send(msg);
            });

            // Called when a start/get_client_code request succeeds
            Backbone.on("ws:recv:/get_client_code", function(data) {
                var clientCode = data.content.client_code;
                Session.setClientCode(clientCode);
                console.log("clientCode is now " + clientCode);
            });

            // Called when a connection to a WebSocket on the server is 
            // established. Note, this is called for any WebSocket, while
            // get_client_code on exists in  /start.
            Backbone.on("ws:connected", function() {
                var msg = {
                    route   : "/get_client_code",
                    content : {
                        client_code : Session.getClientCode()
                    }
                };
                self.connection.send(msg);
            });
        };
    };
    
    return Start;
});

