define( [   'App',  'backbone', 'marionette',   'jquery',   'hbs!templates/all/main/welcome/intro'],
function(    App,    Backbone,   Marionette,     $,          template_intro) {
    
    return Backbone.Marionette.Layout.extend( {

        template: template_intro,
        
        initialize : function() {
        },
        
        render : function() {
            this.$el.empty().html(this.template);
        },

        events: {
        }
    });
});

