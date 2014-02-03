define [
    'backbone'
    'marionette'
    'hbs!/templates/main/about'
], (
    Backbone
    Marionette
    templateAbout
) ->
    class About extends Backbone.Marionette.ItemView
        template: templateAbout

    return About
