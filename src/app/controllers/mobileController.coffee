###
    TODO: wat do I do with this?
###
define [
    'app'
    'backbone'
    'marionette'
    'views/WelcomeView'
    'views/MobileHeaderView'
], (
    App
    Backbone
    Marionette
    WelcomeView
    MobileHeaderView
) ->
    class MobileController extends Backbone.Marionette.Controller
        initialize: (options) ->
            App.headerRegion.show new MobileHeaderView
        
        # Gets mapped to in AppRouter's appRoutes
        index: () ->
            App.mainRegion.show new WelcomeView

    return MobileController
