define [
    'backbone'
    'marionette'
    'app/util/templates'
], (
    Backbone
    Marionette
    Templates
) ->
    Templates.load 'main/about', 'mainAbout'
    class About extends Backbone.Marionette.ItemView
        template: Templates.get 'mainAbout'

    return About
