define( [   'App',  'backbone', 'marionette',   'jquery',   'hbs!templates/all/main/welcome',   'views/dt/main/welcome/intro',  'views/dt/main/welcome/arena',  'models/match'  ],
function(    App,    Backbone,   Marionette,     $,          template_welcome,                   ViewWelcomeIntro,               ViewWelcomeArena,               ModelMatch ) {
    
    return Backbone.Marionette.Layout.extend( {

        template: template_welcome,
        
        regions: {
            intro   : "#intro",
            arena   : "#arena"
        },

        render : function() {
            var self = this;
            this.$el.empty().html(this.template);
            this.intro.show(new ViewWelcomeIntro());
            this.arena.show(new ViewWelcomeArena( {model : new ModelMatch()} ));
        }
     
    });
});

