define([    "jquery",   "backbone", "models/ship"],
function(   $,          Backbone,   Ship) {
    var Ships = Backbone.Collection.extend({
        model       : Ship,
        initialize  : function() {
        },
        // Let the collection know that a tick has occurred
        // Perhaps we should do this with an event, but I am not sure
        // if the set is guaranteed to happen before the event is processed.
        // 
        tick        : function() {
            this.each(function(ship) {
                ship.tick();
            });
        }
    });

    return Ships;
});
