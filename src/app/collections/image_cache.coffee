define [
    "backbone"
    "marionette"
    "app/models/image"
], (
    Backbone
    Marionette
    ModelImage
) ->
    class ImageCache extends Backbone.Collection
        model:  ModelImage

     #   init: () ->
     #       # 'this' refers to the Backbone app
     #       console.log "Debug: creating Image Cache"
     #       @imageCache = new ImageCache

    return ImageCache
