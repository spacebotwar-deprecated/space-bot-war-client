define [
    "app"
    "jquery"
    "routers/AppRouter"
    "controllers/MobileController"
    "backbone"
    "marionette"
    "jquerymobile"
    "backbone.validateAll"
], (
    App
    $
    AppRouter
    AppController
) ->
    # Prevents all anchor click handling
    $.mobile.linkBindingEnabled = no

    # Disabling this will prevent jQuery Mobile from handling hash changes
    $.mobile.hashListeningEnabled = no

    App.appRouter = new AppRouter
        controller: new AppController

    App.start()
