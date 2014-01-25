define [
    'jquery'
    'backbone'
    'marionette'
    'hbs!templates/all/main/register'
], (
    $
    Backbone
    template
) ->
    class Register extends Backbone.Marionette.ItemView
        template: template

    return Register
