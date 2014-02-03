define [
    'backbone'
    'marionette'
    'hbs!/templates/main/header'
], (
    Backbone
    Marionette
    templateHeader
) ->
    class Header extends Backbone.Marionette.ItemView
        template: templateHeader

    return Header
