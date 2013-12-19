define([    'jquery',   'hbs!templates/all/main/right_menu',  'backbone', 'marionette'],
function (   $,          template,                       Backbone) {
    //ItemView provides some default rendering logic
    return Backbone.Marionette.ItemView.extend({
        template:template
    });
});
