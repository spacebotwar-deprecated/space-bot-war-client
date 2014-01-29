define [
    'app/app'
    'backbone'
    'marionette'
    'jquery'
    'hbs!templates/all/main/welcome'
    'app/views/welcome/intro'
    'app/views/welcome/arena'
    'app/models/match'
], (
    App
    Backbone
    Marionette
    $
    templateWelcome
    ViewWelcomeIntro
    ViewWelcomeArena
    ModelMatch
) ->
    
    class Welcome extends Backbone.Marionette.Layout
        template = templateWelcome

        regions =
            intro : '#intro'
            arena : '#arena'

        render = () ->
            @$el.html(@template)
            @intro.show new ViewWelcomeIntro
            @arena.show new ViewWelcomeArena
                model : new ModelMatch

    return Welcome
