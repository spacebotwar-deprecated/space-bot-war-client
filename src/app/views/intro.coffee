define [
    'backbone'
    'marionette'
    'hbs!/templates/main/welcome/intro'
], (
    Backbone
    Marionette
    templateIntro
) ->
    class Intro extends Backbone.Marionette.Layout
        template: templateIntro

        render: () ->
            @$el.html(@template)

    return Intro
