define([    "jquery",   "backbone", "collections/competitors",  "collections/ships"],
function(    $,          Backbone,  CollectionsCompetitors,     CollectionsShips) {
    // Creates a new Backbone Model class object
    var Match = Backbone.Model.extend({

        defaults : {
            tick_count  : 0
        },
        
        // Model Constructor
        initialize: function() {
            var competitors = new CollectionsCompetitors(this.get("competitors"));
            this.set("competitors", competitors);

            var ships = new CollectionsShips(this.get("ships"));
            this.set("ships", ships);

            Backbone.on("wsm:recv:/match_tick",     this.match_tick, this);
            Backbone.on("wsm:recv:/match_status",   this.match_status, this);
            this.on('change', this.stats, this);
        },

        stats : function(data) {
            console.log("model stats");
        },

        // It would be nice if the model 'set' method also recursively set the collections
        // but I don't think it does. So we have to do it here.
        match_tick : function(data) {
            var ships = this.get("ships");
            ships.tick();
            ships.set(data.content.ships);

            // updating 'tick_count' ensures that the view is triggered on every model tick
            this.set('tick_count', this.get('tick_count') + 1);
            this.stats();
        },

        match_status : function(data) {
            var ships = this.get("ships");
            ships.tick()
            ships.set(data.content.ships);
        },

        // Propagate the tick down to the components.
        tick : function() {
            this.get("ships").tick();
        },

        // Get's called automatically by Backbone when the set and/or save methods are called (Add your own logic)
        validate: function(attrs) {

        }

    });

    // Returns the Model class
    return Match;
});
