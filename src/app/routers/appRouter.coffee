define [
    'backbone'
    'marionette'
], (
    Backbone
    Marionette
) ->
    class AppRouter extends Backbone.Marionette.AppRouter
        appRoutes:
            'intro'        : 'intro'
            'login'        : 'login'
            'register'     : 'register'
            'lostPassword' : 'lostPassword'

    return AppRouter
