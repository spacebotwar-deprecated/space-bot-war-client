define([
    'backbone',
    'marionette'
],
function(
    Backbone,
    Marionette
) {
    return Backbone.Marionette.AppRouter.extend({
        // These should be implemented in DesktopController and MobileController
        appRoutes: {
            ""         : "index",
            "login"    : "login",
            "register" : "register"
       }
    });
});
