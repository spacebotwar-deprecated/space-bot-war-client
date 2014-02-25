define [
    'backbone'
    'marionette'
    'app/util/templates'
], (
    Backbone
    Marionette
    Templates
) ->
    Templates.load 'game/header', 'gameHeader'
    class ViewGameHeader extends Backbone.Marionette.ItemView
        template: Templates.get 'gameHeader'

    ViewGameHeader
