define [
    'backbone'
    'marionette'
    'hbs!templates/main/footer'
], (
    Backbone
    Marionette
    templateFooter
) ->
    class Footer extends Backbone.Marionette.ItemView
        template: templateFooter

    return Footer
