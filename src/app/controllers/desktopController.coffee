define [
    'app/app'
    'backbone'
    'marionette'
    'app/views/welcome'
    'app/views/user'
    'app/views/welcome/header'
    'app/views/welcome/footer'
    'app/views/register'
    'app/views/about'
    'app/views/faq'
    'app/models/user'

    'app/views/game/header'
    'app/views/game/footer'
    'app/views/game/intro'
    'app/views/game/editor'
], (
    App
    Backbone
    Marionette
    ViewWelcome
    ViewUser
    ViewHeaderWelcome
    ViewFooterWelcome
    ViewRegister
    ViewAbout
    ViewFaq
    ModelUser

    ViewGameHeader
    ViewGameFooter
    ViewGameIntro
    ViewGameEditor
) ->
    class DesktopController extends Backbone.Marionette.Controller
        ###
            Welcome page and its components
        ###
        welcome: () ->
            App.mainRegion.show new ViewWelcome
            App.menuRegion.show new ViewUser
                model: new ModelUser
            App.headerRegion.show new ViewHeaderWelcome
            App.footerRegion.show new ViewFooterWelcome

        about: () ->
            App.mainRegion.show new ViewAbout

        faq: () ->
            App.mainRegion.show new ViewFaq


        ###
            Main game screen and its components
        ###
        game: () ->
            App.headerRegion.show new ViewGameHeader
            App.mainRegion.show new ViewGameIntro
            App.footerRegion.show new ViewGameFooter

        gameEditor: () ->
            App.mainRegion.show new ViewGameEditor

        gameTournaments: () ->
            # TODO: code viewing of tournaments (server and client!)
            console.log 'Game code tournaments viewing controller call'

    DesktopController
