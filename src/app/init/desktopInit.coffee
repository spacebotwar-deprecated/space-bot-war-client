define [
    "app/app"
    "app/routers/appRouter"
    "app/controllers/desktopController"
], (
    App
    AppRouter
    DesktopController
    SbwInit
) ->
    # Add in the routes.
    App.appRouter = new AppRouter
        controller: new DesktopController

    # Start Marionette Application in desktop mode (default)
    App.start()
