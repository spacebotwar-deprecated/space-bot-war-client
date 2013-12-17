define( [   'App',  'backbone', 'marionette',   'jquery',   'login-radius',     'radius-hub',               'models/Model', 'hbs!templates/all/main/login'],
function(    App,    Backbone,   Marionette,     $,          LoginRadiusSDK,     LoginRadius_SocialLogin,    Model,          template) {
    //ItemView provides some default rendering logic

    alert('got here!!!');
    LoginRadius_SocialLogin.util.ready(function () {
        $ui = LoginRadius_SocialLogin.lr_login_settings;
        $ui.interfacesize = "";
        $ui.apikey = "78855680-671c-4c70-b194-2e392a0a7c81";
        $ui.callback="";
        $ui.lrinterfacecontainer ="interfacecontainerdiv";
        LoginRadius_SocialLogin.init( { login : true } );
    });

    LoginRadiusSDK.onlogin = Successfullylogin;

    function Successfullylogin() {
        LoginRadiusSDK.getUserprofile(function (data) {
            //just display to a html element
            document.getElementById("profile").innerHTML = JSON.stringify(data);
        });
        return false;
    };

    LoginRadiusSDK.onlogin = SuccessFullyLogin;

    function SuccessFullyLogin() {
        LoginRadiusSDK.getUserprofile(function (data) {
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
