define([    'jquery',   'hbs!templates/all/main/logged_in',  'hbs!templates/all/main/logged_out', 'backbone', 'marionette'],
function (   $,          template_logged_in,                 template_logged_out,                Backbone) {
    //ItemView provides some default rendering logic
    return Backbone.Marionette.ItemView.extend({
        render : function() {
            if (this.model.get('logged_in')) {
                $(this.el).empty().html(template_logged_in(this.model.attributes));
            }
            else {
                $(this.el).empty().html(template_logged_out(this.model.attributes));
            }
        },
        events          : {
            'click #login'          : 'login',
            'click #logout'         : 'logout',
            'click #register'       : 'register',
            'click #lost_password'  : 'lost_password'
        },
        login   : function() {
            console.log("log IN");
            var username = $('#username').val();
            var password = $('#password').val();
            Backbone.trigger("user:login", {  username : username, password : password} );
        },
        logout  : function() {
            console.log("log OUT");
            Backbone.trigger("user:logout");
        },
        lost_password   : function() {
            alert('lost password');
        },
        register        : function() {
            alert('register');
        },
        initialize      : function() {
            this.model.bind('change:logged_in', this.render, this);
        }
                    
    });
});
