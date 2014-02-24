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
        intro: () ->
            App.mainRegion.show new ViewWelcome
            App.menuRegion.show new ViewUser
                model: new ModelUser
            App.headerRegion.show new ViewHeader
            App.footerRegion.show new ViewFooter

        login: () ->
            App.mainRegion.show new ViewLogin
        
        register: () ->
            App.mainRegion.show new ViewRegister

        lostPassword: () ->
            alert 'Lost password controller triggered.'

    DesktopController
