define( [   'App',  'backbone', 'marionette',   'jquery',   'models/Model', 'hbs!templates/all/main/welcome',   'image!/img/starmap1.jpg',   'jqueryui'],
function(    App,    Backbone,   Marionette,     $,          Model,          template,                           image_starmap) {
    
    return Backbone.Marionette.ItemView.extend( {
        template: template,
        model: new Model({
            mobile: App.mobile
        }),
        initialize : function() {
            this.canvas_image = image_starmap;
        },
        render : function() {
            var self = this;
            this.$el.empty().html(template);
           
//            this.$( ".draggable" ).draggable({containment: "parent"});
            var canvas = this.$("#draggable_canvas")[0];
            // TODO I have no idea why, but at this point canvas is 300x150
            // so I have to set it to this size. Note, default is 300x150
            // so perhaps that has something to do with it
            canvas.height = 1024;
            canvas.width = 1024;
            this.context = canvas.getContext('2d');
            this.starmap = new Image();
            this.starmap.src="/img/starmap1.jpg";
            this.starmap.onload = function() {
                self.context.drawImage(self.starmap, 0, 0, 1024, 1024);
            this.context.fillStyle = "rgb(150,29,28)";
            this.context.beginPath();
            this.context.arc(12,12,20,0,0,true);
            this.context.closePath();

            };

//            this.context.drawImage(image_starmap, 0, 0, 200,200);

        },

        // View Event Handlers
        events: {

        }
    });
});

