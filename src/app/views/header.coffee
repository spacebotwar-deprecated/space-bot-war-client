define [
    'jquery'
    'hbs!templates/dt/main/header'
    'backbone'
    'marionette'
], (
    $
    templateHeader
    Backbone
) ->
    class Header extends Backbone.Marionette.ItemView
        template: templateHeader

    return Header
