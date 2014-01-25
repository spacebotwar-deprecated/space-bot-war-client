define [
    'jquery'
    'hbs!templates/dt/main/footer'
    'backbone'
    'marionette'
], (
    $
    templateFooter
    Backbone
) ->
    class Footer extends Backbone.Marionette.ItemView
        template: templateFooter

    return Footer
