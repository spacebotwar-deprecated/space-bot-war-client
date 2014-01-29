define [
    "backbone"
    "marionette"
    "app/models/ship"
], (
    Backbone
    Marionette
    ModelShip
) ->
    class Ships extends Backbone.Collection
        model: ModelShip

        # Let the collection know that a tick has occurred
        # Perhaps we should do this with an event, but I am not sure
        # if the set is guaranteed to happen before the event is processed. 
        tick: () ->
            @each (ship) ->
                ship.tick()

    return Ships
