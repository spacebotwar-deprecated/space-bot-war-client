define([
    'App',
    'backbone',
    'marionette',
    'views/dt/main/welcome',
    'views/dt/main/login_status', 
    'views/dt/main/header',
    'views/dt/main/footer',
    'views/dt/main/register',
    'views/dt/main/about',
    'views/dt/main/faq',
    'models/login_status'
],
function(
    App,
    Backbone,
    Marionette,
    ViewWelcome,
    ViewLoginStatus,
    ViewHeader,
    ViewFooter,
    ViewRegister,
    ViewAbout,
    ViewFaq,
    ModelLoginStatus
) {
    return Backbone.Marionette.Controller.extend({

        initialize: function (options) {
            App.headerRegion.show(new ViewHeader());
            App.menuRegion.show(new ViewLoginStatus({ model : new ModelLoginStatus()}));
            App.footerRegion.show(new ViewFooter());
        },

        // These are mapped to AppRouter's route declarations.
        index: function() {
            App.mainRegion.show(new ViewWelcome());
        },
        login: function() {
            App.mainRegion.show(new ViewLogin());
        },
        register: function() {
            App.mainRegion.show(new ViewRegister());
        }
    });
});
