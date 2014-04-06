define [
    'backbone'
    'marionette'
], (
    Backbone
    Marionette
) ->
    class AppRouter extends Backbone.Marionette.AppRouter
        appRoutes:
            # The first page the user sees when they open the site
            'welcome'      : 'welcome'

            # The buttons on the top of the 'welcome' screen
            'about'        : 'about'
            'faq'          : 'faq'

            # The main game screen and its components
            'game'             : 'game'
            'game-editor'      : 'gameEditor'
            'game-tournaments' : 'gameTournaments'

    AppRouter
