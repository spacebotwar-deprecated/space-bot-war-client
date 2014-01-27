define [
    "app/app"
    "app/routers/appRouter"
    "app/controllers/desktopController"
    "app/init/sbwInit"
], (
    App
    AppRouter
    DesktopppController
    SbwInit
) ->
    # Add in the routes.
    App.appRouter = new AppRouter
        controller: new AppController

    # Setup other stuff that is desktop/mobile agnostic.
    new SbwInit
    
    # Start Marionette Application in desktop mode (default)
    App.start()
