define [
    "app"
    "routers/AppRouter"
    "controllers/DesktopController"
    "init/setupOtherStuff"
], (
    App
    AppRouter
    AppController
    sbwInit
) ->
    
    # This is the main entry point of the application.
    console.log 'O-hai there! :D'

    # Add in the routes.
    App.appRouter = new AppRouter
        controller: new AppController

    # Setup other stuff that is desktop/mobile agnostic.
    new sbwInit
    
    # Start Marionette Application in desktop mode (default)
    App.start()
