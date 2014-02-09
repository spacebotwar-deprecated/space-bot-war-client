define [
    'backbone'
    'marionette'
    'app/util/templates'
], (
    Backbone
    Marionette
    Templates
) ->
    Templates.load 'main/header', 'mainHeader'
    class Header extends Backbone.Marionette.ItemView
        template: Templates.get 'mainHeader'

    return Header
