define [
    "backbone"
    "marionette"
    "app/collections/competitors"
    "app/collections/ships"
], (
    Backbone
    Marionette
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

        match_tick: (data={}) ->
            @tick_ships data

            # updating 'tick_count' ensures that the view is triggered on every model tick
            console.log "######## model/match.coffee tick ########"
            @set 'tick_count', @get('tick_count') + 1

        match_status: (data={}) ->
            @tick_ships data

        # It would be nice if the model 'set' method also recursively set the
        # collections but I don't think it does. So we have to do it here.
        tick_ships: (data={}) ->
            ships = @get "ships"
            ships.tick()
            ships.set data.content.ships

        stats: (data={}) ->
            console.log "model/match change"


    return Match
