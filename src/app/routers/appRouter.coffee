define [
    'backbone'
    'marionette'
], (
    Backbone
    Marionette
) ->
    class AppRouter extends Backbone.Marionette.AppRouter
        appRoutes:
            ''             : 'index'
            'login'        : 'login'
            'register'     : 'register'
            'lostPassword' : 'lostPassword'

    return AppRouter
