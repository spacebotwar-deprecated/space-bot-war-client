define [
    'app/app'
    'backbone'
    'marionette'
    'app/util/templates'
], (
    App
    Backbone
    Marionette
    Templates
) ->
    Templates.load 'game/intro', 'gameIntro'
    class ViewGameIntro extends Backbone.Marionette.Layout
        name: 'ViewGameIntro'
        template: Templates.get 'gameIntro'

    ViewGameIntro
