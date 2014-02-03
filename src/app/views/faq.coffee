define [
    'backbone'
    'marionette'
    'hbs!/templates/main/faq'
], (
    Backbone
    Marionette
    templateFaq
) ->
    class Faq extends Backbone.Marionette.ItemView
        template: templateFaq

    return Faq
