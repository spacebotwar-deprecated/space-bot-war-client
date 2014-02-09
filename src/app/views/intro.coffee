define [
    'backbone'
    'marionette'
    'app/util/templates'
], (
    Backbone
    Marionette
    Templates
) ->
    Templates.load 'main/welcome/intro', 'mainWelcomeIntro'
    class Intro extends Backbone.Marionette.Layout
        template: Templates.get 'mainWelcomeIntro'

        render: () ->
            console.log 'Rendering intro'
            #@$el.html @template()

    return Intro
