define([    "jquery",   "backbone", "models/competitor"],
function(   $,          Backbone,   Competitor) {
    var Competitors = Backbone.Collection.extend({
        model: Competitor
    });

    return Competitors;
});
