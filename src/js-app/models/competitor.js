define([    "jquery",   "backbone"],
function(    $,          Backbone) {
    // Creates a new Backbone Model class object
    var Competitor = Backbone.Model.extend({

        defaults : {
            id      : 0,
            name    : "foo"
        },
        
        // Model Constructor
        initialize: function() {
        },

        // Get's called automatically by Backbone when the set and/or save methods are called (Add your own logic)
        validate: function(attrs) {

        }

    });

    // Returns the Model class
    return Competitor;
});
