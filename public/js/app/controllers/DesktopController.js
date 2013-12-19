define([    'App',  'backbone', 'marionette',   'views/dt/main/welcome',    'views/dt/main/login',  
            'views/dt/main/header', 'views/dt/main/footer', 'views/dt/main/register',   'views/dt/main/menu',   
            'views/dt/main/about',  'views/dt/main/faq',],
function(    App,    Backbone,   Marionette,     ViewWelcome,                ViewLogin,              
             ViewHeader,             ViewFooter,             ViewRegister,               ViewMenu,
             ViewAbout,             ViewFaq) {
    return Backbone.Marionette.Controller.extend({
        initialize:function (options) {
            App.headerRegion.show(new ViewHeader());
            App.menuRegion.show(new ViewMenu());
            App.footerRegion.show(new ViewFooter());
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
