define([    'jquery',   'hbs!templates/all/main/menu',  'backbone', 'marionette'],
function (   $,          template,                       Backbone) {
    //ItemView provides some default rendering logic
    
    return Backbone.Marionette.ItemView.extend({
        template        : template,
        events          : {
            'click #login'      : 'login',
            'click #register'   : 'register'
        },
        ui      : {
            username    : '#username',
            password    : '#password'
        },

        login   : function() {
            var username = this.ui.username.val();
            var password = this.ui.password.val();
            Backbone.trigger("user:login", { username : username, password : password} );
        },
        lost_password   : function() {
            alert('lost password');
        },
        register        : function() {
            alert('register');
        }
    });
});
