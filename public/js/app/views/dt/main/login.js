define( [   'App',  'backbone', 'marionette',   'jquery',   'login-radius',             'models/Model', 'hbs!templates/all/main/login'],
function(    App,    Backbone,   Marionette,     $,          LoginRadius,    Model,          template) {
    //ItemView provides some default rendering logic

    LoginRadius.onlogin = SuccessFullyLogin;

    function SuccessFullyLogin() {
        LoginRadius.getUserprofile(function (data) {
            alert(JSON.stringify(data));
        });
        return false;
    };

    return Backbone.Marionette.ItemView.extend( {
        template    : template,
        model       : new Model({
            mobile  : App.mobile
        }),

        // View Event Handlers
        events: {

        }
    });
});
