define([    'App',  'backbone', 'marionette',   'views/dt/main/welcome',    'views/dt/main/login',  'views/dt/main/header', 'views/dt/main/register'],
function(    App,    Backbone,   Marionette,     ViewWelcome,                ViewLogin,              ViewHeader,             ViewRegister) {
    return Backbone.Marionette.Controller.extend({
        initialize:function (options) {
            App.headerRegion.show(new ViewHeader());
        },
        //gets mapped to in AppRouter's appRoutes
        index   : function() {
            App.mainRegion.show(new ViewWelcome());
        },
        login   : function() {
            App.mainRegion.show(new ViewLogin());
        },
        register    : function() {
            App.mainRegion.show(new ViewRegister());
        }
    });
});
