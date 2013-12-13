define( [   'App',  'backbone', 'marionette',   'jquery',   'models/Model', 'hbs!templates/all/main/welcome'],
function(    App,    Backbone,   Marionette,     $,          Model,          template) {
    
    return Backbone.Marionette.ItemView.extend( {
        template: template,
        model: new Model({
            mobile: App.mobile
        }),

        // View Event Handlers
        events: {

        }
    });
});

