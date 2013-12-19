define([    'jquery',   'hbs!templates/all/main/menu',  'backbone', 'marionette'],
function (   $,          template,                       Backbone) {
    //ItemView provides some default rendering logic
    
    return Backbone.Marionette.ItemView.extend({
        template        : template,
        events          : {
            'click #login'      : 'login',
            'click #register'   : 'register'
        },
        login   : function() {
            var username = $("#username").val();
            var password = $("#password").val();
            alert('login! username=['+username+'] password=['+password+']');
        },
        lost_password   : function() {
            alert('lost password');
        },
        register        : function() {
            alert('register');
        }
    });
});
