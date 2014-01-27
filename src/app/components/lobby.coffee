# define([
#     'my-config',
#     'jquery',
#     'backbone',
#     'components/connection',
#     'components/session',
#     'humane'
# ],
# function(
#     MyConfig,
#     $,
#     Backbone,
#     Connection,
#     Session,
#     Humane
# ) {

#     // The Start Server is responsible for handling login and registration
#     // 
#     var Lobby = function() {
#         var self = this;

#         self.init = function() {
#             // In here 'this' refers to the Marionette App.

#             // self.connection = new Connection(MyConfig.webSocketUrls.lobby, "ws");
#             // self.connection.init();

#             Backbone.on("ws:send", function(data) {
#                 console.log("ws:send " + JSON.stringify(data));
#             });
                
#             // The user has logged in
#             Backbone.on("user:login", function(data) {
#                 console.log("BACKBONE: user:login " + JSON.stringify(data));
#                 var msg = {
#                     route   : "/login_with_password",
#                     content : {
#                         password    : data.password,
#                         username    : data.username,
#                         client_code : Session.getClientCode()
#                     }
#                 };
#                 self.connection.send(msg);
#             });

#             // The user has logged out
#             Backbone.on("user:logout", function() {
#                 console.log("BACKBONE: user:logout ");
#                 var msg = {
#                     route   : "/logout",
#                     content : {
#                         client_code : Session.getClientCode()
#                     }
#                 };
#                 self.connection.send(msg);
#             });

#             Backbone.on("ws:recv:/get_client_code", function(data) {
#                 var clientCode = data.content.client_code;
#                 Session.setClientCode(clientCode);
#                 console.log("clientCode is now " + clientCode);
#             });

#             Backbone.on("ws:connected", function() {
#                 var msg = {
#                     route   : "/get_client_code",
#                     content : {
#                         client_code : Session.getClientCode()
#                     }
#                 };
#                 self.connection.send(msg);
#             });
#         };
#     };
    
#     return Lobby;
# });

