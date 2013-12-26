define([    "jquery",   "backbone"],
function(    $,          Backbone) {
    // Creates a new Backbone Model class object
    var LoginStatus = Backbone.Model.extend({

        defaults : {
            logged_in   : false,
            user_id     : 0
        },
        
        // Model Constructor
        initialize: function() {
            Backbone.on("ws:recv:/lobby/login_with_password", this.login_success, this);
            Backbone.on("ws:recv:/lobby/logout", this.logout_success, this);
        },

        logout_success : function(data) {
            this.set({'logged_in' : 0});
            console.log("MODEL: LOGOUT: logout_success");
        },

        login_success : function(data) {
            this.set({'logged_in' : 1});
            console.log("MODEL: LOGIN: login_success "+JSON.stringify(data));
        },
        // Get's called automatically by Backbone when the set and/or save methods are called (Add your own logic)
        validate: function(attrs) {

        }

    });

    // Returns the Model class
    return LoginStatus;
});
