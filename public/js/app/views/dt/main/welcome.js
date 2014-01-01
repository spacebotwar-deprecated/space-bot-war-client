define( [   'App',  'backbone', 'marionette',   'jquery',   'models/Model', 'hbs!templates/all/main/welcome',   'image!/img/starmap1.jpg',   'jqueryui'],
function(    App,    Backbone,   Marionette,     $,          Model,          template,                           image_starmap) {
    
    return Backbone.Marionette.ItemView.extend( {
        template: template,
        model: new Model({
            mobile: App.mobile
        }),
        initialize : function() {
            this.canvas_image = new Image();
            this.canvas_image = image_starmap;
            this.context = 0;
        },
        render : function() {
            this.$el.empty().html(template);
           
            this.$( ".draggable" ).draggable({containment: "parent"});
            var canvas = this.$("#draggable_canvas")[0];
            this.context = canvas.getContext('2d');
            this.context.drawImage(this.canvas_image, 0, 0, 1024, 1024, 0, 0, 1024, 1024);
        },

        // View Event Handlers
        events: {

        }
    });
});

