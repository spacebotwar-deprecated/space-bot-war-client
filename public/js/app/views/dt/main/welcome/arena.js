define( [   'App',  'backbone', 'marionette',   'jquery',   'hbs!templates/all/main/welcome/arena',   'image!/img/starmap1.jpg',   'jqueryui'],
function(    App,    Backbone,   Marionette,     $,          template_welcome_arena,                   image_starmap) {
    
    return Backbone.Marionette.Layout.extend( {

        template: template_welcome_arena,
        
        initialize : function() {
            this.canvas_image = image_starmap;
        },
        
        render : function() {
            this.$el.empty().html(this.template);
           
            this.$( ".draggable_canvas" ).draggable({containment: "parent"});
            var canvas = this.$("#draggable_canvas")[0];
            // TODO I have no idea why, but at this point canvas is 300x150
            // so I have to set it to this size. Note, default is 300x150
            // so perhaps that has something to do with it
            canvas.height = 3000;
            canvas.width = 3000;
            var context = canvas.getContext('2d');
            context.scale(0.5,0.5);
            context.clearRect(0,0,3000,3000);
            context.beginPath();
            context.arc(1500,1500,1495,0,(Math.PI*2), true);
            context.lineWidth = 2;
            context.strokeStyle = "red";
            context.stroke();
        },

        events: {
        }
    });
});

