define [
    'jquery'
    'hbs!templates/dt/main/faq'
    'backbone'
    'marionette'
], (
    $
    templateFaq
    Backbone
) ->
    class Faq extends Backbone.Marionette.ItemView
        template: templateFaq

    return Faq
