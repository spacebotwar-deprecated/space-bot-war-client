define([
    "jquery",
    "backbone"
],
function(
    $,
    Backbone
) {
    
    // Creates a new Backbone Model class object
    return Backbone.Model.extend({

        defaults : {
            username    : '',
            user_id     : 0,
            logged_in   : false
        },
        
        initialize: function() {
            Backbone.on("ws:recv:/login_with_password", this.login_success, this);
            Backbone.on("ws:recv:/logout", this.logout_success, this);
        },

        logout_success : function(data) {
            this.set({
                username    : '',
                user_id     : 0,
                logged_in   : false
            });

            console.log("MODEL: LOGOUT: logout_success");
        },

        login_success : function(data) {
            this.set({
                username    : data.content.username,
                user_id     : data.content.user_id,
                logged_in   : true
            });
            console.log("MODEL: LOGIN: login_success "+JSON.stringify(data));
        }

    }); 
});
