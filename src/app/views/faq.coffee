define [
    'backbone'
    'marionette'
    'app/util/templates'
], (
    Backbone
    Marionette
    Templates
) ->
    Templates.load 'main/faq', 'mainFaq'
    class Faq extends Backbone.Marionette.ItemView
        template: Templates.get 'mainFaq'

    return Faq
