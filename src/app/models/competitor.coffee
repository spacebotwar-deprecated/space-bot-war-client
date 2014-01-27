define [
    "jquery"
    "backbone"
], (
    $
    Backbone
) ->
    class Competitor extends Backbone.Model
        defaults:
            id      : 0
            name    : "foo"

    return Competitor
