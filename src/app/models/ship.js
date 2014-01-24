define([    "jquery",   "backbone", 'models/images'],
function(    $,          Backbone,   ModelImages) {
    // Creates a new Backbone Model class object
    var Ship = Backbone.Model.extend({

        defaults : {
            id          : 0,
            owner_id    : 0,
            direction   : 0,
            orientation : 0,
            health      : 100,
            rotation    : 0,
            speed       : 0,
            status      : 'ok',
            x           : 0,
            y           : 0,
            previous_x  : 0,
            previous_y  : 0,
            previous_orientation    : 0.6,
            tick        : 0,
        },
        
        // Model Constructor
        initialize: function() {
            this.images = new ModelImages();
            this.image = this.images.get('ship');
        },
        tick : function() {
            // On each 'tick' of the server, record the previous value of x,y and orientation
            // BEFORE updating the other attributes.
            this.set("previous_x", this.previous("x"));
            this.set("previous_y", this.previous("y"));
            this.set("previous_orientation", this.previous("orientation"));
        },

        // Get's called automatically by Backbone when the set and/or save methods are called (Add your own logic)
        validate: function(attrs) {

        },
        // It's a bit odd rendering in the model, revist this!
        //
        render  : function(context) {
            console.log("Model:Ship:render "+this.get('id')+" x="+this.get('x')+" y="+this.get('y'));
            context.save();
            context.translate(this.get('x')+1000, 1000 - this.get('y'));
            context.rotate( this.get('orientation'));
            context.drawImage(this.image, -20, -20);
            context.restore();
        }

    });

    // Returns the Model class
    return Ship;
});
