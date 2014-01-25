define [
    'App'
    'backbone'
    'marionette'
    'jquery'
    'hbs!templates/all/main/welcome/intro'
], (
    App
    Backbone
    Marionette
    $
    templateWelcomeIntro
) ->
    class WelcomeIntro extends Backbone.Marionette.Layout
        template: templateWelcomeIntro

        render: () ->
            @$el.html(@template)
