define([    'jquery',   'hbs!templates/dt/main/footer', 'backbone', 'marionette'],
function (   $,          template,                       Backbone) {
    //ItemView provides some default rendering logic
    return Backbone.Marionette.ItemView.extend({
        template:template
    });
});
