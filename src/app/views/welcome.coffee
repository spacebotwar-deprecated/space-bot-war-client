define [
    'backbone'
    'marionette'
    'app/views/welcome/intro'
    'app/views/welcome/arena'
    'app/models/match'
    'hbs!/templates/main/welcome'
], (
    Backbone
    Marionette
    ViewWelcomeIntro
    ViewWelcomeArena
    ModelMatch
    templateWelcome
) ->
    
    class Welcome extends Backbone.Marionette.Layout
        template = templateWelcome

        regions =
            intro : '#intro'
            arena : '#arena'

        render = () ->
            @$el.html @template()
            @intro.show new ViewWelcomeIntro
            @arena.show new ViewWelcomeArena
                model : new ModelMatch

    return Welcome
