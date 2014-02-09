define [
    'backbone'
    'marionette'
    'app/views/welcome/intro'
    'app/views/welcome/arena'
    'app/models/match'
    'app/util/templates'
], (
    Backbone
    Marionette
    ViewWelcomeIntro
    ViewWelcomeArena
    ModelMatch
    Templates
) ->
    Templates.load 'main/welcome', 'mainWelcome'
    class Welcome extends Backbone.Marionette.Layout
        template: Templates.get 'mainWelcome'

        regions:
            intro : '#intro'
            arena : '#arena'

        render: () ->
            @$el.html @template()
            @intro.show new ViewWelcomeIntro
            @arena.show new ViewWelcomeArena
                model : new ModelMatch

    return Welcome

