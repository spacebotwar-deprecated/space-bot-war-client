define [
    'backbone'
    'marionette'
    'app/util/templates'
], (
    Backbone
    Marionette
    Templates
) ->
    Templates.load 'welcome/header', 'welcomeHeader'
    class ViewWelcomeHeader extends Backbone.Marionette.ItemView
        template: Templates.get 'welcomeHeader'

    ViewWelcomeHeader
