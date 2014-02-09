define [
    'backbone'
    'marionette'
    'app/util/templates'
], (
    Backbone
    Marionette
    Templates
) ->
    Templates.load 'main/register', 'mainRegister'
    class Register extends Backbone.Marionette.ItemView
        template: Templates.get 'mainRegister'

    return Register
