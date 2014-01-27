define [
    "jquery"
    "backbone"
    "collections/competitors"
    "collections/ships"
], (
    $
    Backbone
    CollectionCompetitors
    CollectionShips
) ->
    class Match extends Backbone.Model

        defaults:
            tick_count : 0
        
        # Model Constructor
        initialize: () ->
            competitors = new CollectionCompetitors @get "competitors"
            @set "competitors", competitors

            ships = new CollectionShips @get "ships"
            @set "ships", ships

            Backbone.on "wsm:recv:/match_tick",     @match_tick, @
            Backbone.on "wsm:recv:/match_status",   @match_status, @
            @on 'change', @stats, @

        stats: (data={}) ->
            console.log "model stats"

        # It would be nice if the model 'set' method also recursively set the
        # collections but I don't think it does. So we have to do it here.
        match_tick: (data={}) ->
            ships = @get "ships"
            ships.tick()
            ships.set data.content.ships

            # updating 'tick_count' ensures that the view is triggered on every model tick
            @set 'tick_count', @get('tick_count') + 1
            @stats()

        match_status: (data={}) ->
            ships = @get "ships"
            ships.tick()
            ships.set data.content.ships

        # Propagate the tick down to the components.
        tick: () ->
            @get("ships").tick()

    return Match
