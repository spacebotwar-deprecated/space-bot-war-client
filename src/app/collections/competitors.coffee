define [
    "backbone"
    "marionette"
    "app/models/competitor"
], (
    Backbone
    Marionette
    Competitor
) ->

    class Competitors extends Backbone.Collection
        model: Competitor

    return Competitors
