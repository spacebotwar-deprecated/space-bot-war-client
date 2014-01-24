define [
    'app'
    'backbone'
    'marionette'
    'views/dt/main/welcome'
    'views/dt/main/login_status' 
    'views/dt/main/header'
    'views/dt/main/footer'
    'views/dt/main/register'
    'views/dt/main/about'
    'views/dt/main/faq'
    'models/login_status'
], (
    App
    Backbone
    Marionette
    ViewWelcome
    ViewLoginStatus
    ViewHeader
    ViewFooter
    ViewRegister
    ViewAbout
    ViewFaq
    ModelLoginStatus
) ->
    class DesktopController extends Backbone.Marionette.Controller 
        initialize: (options) ->
            App.menuRegion.show new ViewLoginStatus
                model: new ModelLoginStatus
            App.headerRegion.show new ViewHeader
            App.footerRegion.show new ViewFooter

        # These are mapped to AppRouter's route declarations.
        index: () ->
            App.mainRegion.show new ViewWelcome

        login: () ->
            App.mainRegion.show new ViewLogin
        
        register: () ->
            App.mainRegion.show new ViewRegister

    return DesktopController
