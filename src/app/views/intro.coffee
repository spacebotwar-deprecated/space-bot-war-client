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
    templateIntro
) ->
    class Intro extends Backbone.Marionette.Layout
        template: templateIntro

        render: () ->
            @$el.html(@template)

    return Intro
