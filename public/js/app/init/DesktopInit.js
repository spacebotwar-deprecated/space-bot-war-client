require([
    "App",
    "routers/AppRouter",
    "controllers/DesktopController",
    "init/setupOtherStuff"
],
function(App, AppRouter, AppController, setupOtherStuff) {
    
    // This is the main entry point of the application.

    // Add in the routes.
    App.appRouter = new AppRouter({
        controller: new AppController()
    });

    // Setup other stuff that is desktop/mobile agnostic.
    setupOtherStuff();
    
    // Start Marionette Application in desktop mode (default)
    App.start();
});
