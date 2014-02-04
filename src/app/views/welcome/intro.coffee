define [
    'app/app'
    'backbone'
    'marionette'
    'hbs!/templates/welcome/intro'
], (
    App
    Backbone
    Marionette
    templateWelcomeIntro
) ->
    class WelcomeIntro extends Backbone.Marionette.Layout
        template: templateWelcomeIntro

        render: () ->
            @$el.html @template()
