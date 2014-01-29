define [
    "backbone"
    "marionette"
], (
    Backbone
    Marionette
) ->
    class Competitor extends Backbone.Model
        defaults:
            id      : 0
            name    : "foo"

    return Competitor
