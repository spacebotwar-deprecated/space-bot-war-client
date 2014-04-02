define [
    'backbone'
    'marionette'
    'app/util/templates'
], (
    Backbone
    Marionette
    Templates
) ->
    Templates.load 'main/footer', 'mainFooter'
    class Footer extends Backbone.Marionette.ItemView
        template: Templates.get 'mainFooter'

    return Footer
