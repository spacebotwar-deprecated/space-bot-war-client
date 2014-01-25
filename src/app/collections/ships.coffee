define [
    "jquery"
    "backbone"
    "models/ship"
], (
    $
    Backbone
    Ship
) ->
    class Ships extends Backbone.Collection
        model: Ship

        # Let the collection know that a tick has occurred
        # Perhaps we should do this with an event, but I am not sure
        # if the set is guaranteed to happen before the event is processed. 
        tick: () ->
            @each (ship) ->
                ship.tick()

    return Ships
