define [
    'backbone'
    'marionette'
    'app/util/templates'
], (
    Backbone
    Marionette
    Templates
) ->
    Templates.load 'welcome/footer', 'welcomeFooter'
    class ViewWelcomeFooter extends Backbone.Marionette.ItemView
        template: Templates.get 'welcomeFooter'

    ViewWelcomeFooter
