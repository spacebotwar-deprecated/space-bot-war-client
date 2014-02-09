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
    Templates.load 'welcome/intro', 'welcomeIntro'
    class WelcomeIntro extends Backbone.Marionette.Layout
        template: Templates.get 'welcomeIntro'
