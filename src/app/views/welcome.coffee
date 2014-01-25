define [
    'App'
    'backbone'
    'marionette'
    'jquery'
    'hbs!templates/all/main/welcome'
    'views/dt/main/welcome/intro'
    'views/dt/main/welcome/arena'
    'models/match'
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
