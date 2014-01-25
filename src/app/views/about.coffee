define [
    'jquery'
    'hbs!templates/dt/main/about'
    'backbone'
    'marionette'
], (
    $
    templateAbout
    Backbone
) ->
    class About extends Backbone.Marionette.ItemView
        template: templateAbout

    return About
