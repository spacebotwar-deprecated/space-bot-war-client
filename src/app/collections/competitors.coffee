define [
    "jquery"
    "backbone"
    "models/competitor"
], (
    $
    Backbone
    Competitor
) ->

    class Competitors extends Backbone.Collection
        @model: Competitor

    return Competitors
