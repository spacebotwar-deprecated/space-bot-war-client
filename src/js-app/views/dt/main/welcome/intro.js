define( [   'App',  'backbone', 'marionette',   'jquery',   'hbs!templates/all/main/welcome/intro'],
function(    App,    Backbone,   Marionette,     $,          template_welcome_intro) {
    
    return Backbone.Marionette.Layout.extend( {

        template: template_welcome_intro,
        
        initialize : function() {
        },
        
        render : function() {
            var self = this;
            this.$el.empty().html(template_welcome_intro);
        },

        events: {
        }
    });
});

