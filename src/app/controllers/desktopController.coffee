define [
    'app/app'
    'backbone'
    'marionette'
    'app/views/welcome'
    'app/views/user' 
    'app/views/header'
    'app/views/footer'
    'app/views/register'
    'app/views/about'
    'app/views/faq'
    'app/models/user'
], (
    App
    Backbone
    Marionette
    ViewWelcome
    ViewUser
    ViewHeader
    ViewFooter
    ViewRegister
    ViewAbout
    ViewFaq
    ModelUser
) ->
    class DesktopController extends Backbone.Marionette.Controller 
        initialize: (options) ->
            App.menuRegion.show new ViewUser
                model: new ModelUser
            App.headerRegion.show new ViewHeader
            App.footerRegion.show new ViewFooter

        # These are mapped to appRouter's route declarations.
        index: () ->
            App.mainRegion.show new ViewWelcome

        login: () ->
            App.mainRegion.show new ViewLogin
        
        register: () ->
            App.mainRegion.show new ViewRegister

        lostPassword: () ->
            alert 'Lost password controller triggered.'

    DesktopController
