define([    'App',  'backbone', 'marionette',   'views/dt/main/welcome',    'views/dt/main/login_status',  
            'views/dt/main/header', 'views/dt/main/footer', 'views/dt/main/register',   
            'views/dt/main/about',  'views/dt/main/faq',    'models/login_status',  'models/match'],
function(    App,    Backbone,   Marionette,     ViewWelcome,                ViewLoginStatus,              
             ViewHeader,             ViewFooter,             ViewRegister,
             ViewAbout,              ViewFaq,                ModelLoginStatus,       ModelMatch) {
    return Backbone.Marionette.Controller.extend({
        initialize:function (options) {
            App.headerRegion.show(new ViewHeader());
            App.menuRegion.show(new ViewLoginStatus({ model : new ModelLoginStatus()}));
            App.footerRegion.show(new ViewFooter());
        },
        //gets mapped to in AppRouter's appRoutes
        index   : function() {
            App.mainRegion.show(new ViewWelcome({ model : new ModelMatch }));
        },
        login   : function() {
            App.mainRegion.show(new ViewLogin());
        },
        register    : function() {
            App.mainRegion.show(new ViewRegister());
        }
    });
});
