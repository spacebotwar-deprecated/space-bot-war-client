define [
    'app/app'
    'backbone'
    'marionette'
    'app/views/welcome'
    'app/views/loginStatus' 
    'app/views/header'
    'app/views/footer'
    'app/views/register'
    'app/views/about'
    'app/views/faq'
    'app/models/loginStatus'
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
