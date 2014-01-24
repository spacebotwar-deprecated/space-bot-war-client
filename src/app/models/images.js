define([    "jquery",   "backbone", 'image!/img/sp_ship.png'],
function(    $,          Backbone,   ImageShip) {
    var Images = Backbone.Model.extend({

        defaults : {
            id      : 0,
            ship    : ImageShip,
        },
        
        initialize: function() {
            ship    : ImageShip
        },

        validate: function(attrs) {
        }

    });

    return Images;
});
