define( [   'App',  'backbone', 'marionette',   'jquery',   'models/Model', 'hbs!templates/all/main/welcome', 'jqueryui'],
function(    App,    Backbone,   Marionette,     $,          Model,          template) {
    
    return Backbone.Marionette.ItemView.extend( {
        template: template,
        model: new Model({
            mobile: App.mobile
        }),
        render : function() {
            this.$el.empty().html(template);
           
            this.$( "#draggable" ).draggable({containment: "parent"});

            
        },

        // View Event Handlers
        events: {

        }
    });
});

