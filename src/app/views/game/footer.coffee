define [
    'backbone'
    'marionette'
    'app/util/templates'
], (
    Backbone
    Marionette
    Templates
) ->
    Templates.load 'game/footer', 'gameFooter'
    class ViewGameFooter extends Backbone.Marionette.ItemView
        template: Templates.get 'gameFooter'

    ViewGameFooter
