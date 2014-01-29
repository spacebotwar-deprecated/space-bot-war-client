define [
    'backbone'
    'marionette'
    'hbs!templates/main/register'
], (
    Backbone
    Marionette
    templateRegister
) ->
    class Register extends Backbone.Marionette.ItemView
        template: templateRegister

    return Register
