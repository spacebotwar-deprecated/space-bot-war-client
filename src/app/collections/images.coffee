define [
    "backbone"
    "marionette"
    "app/models/image"
], (
    Backbone
    Marionette
    ModelImage
) ->
    class Images extends Backbone.Collection
        model:  ModelImage

    return Images
