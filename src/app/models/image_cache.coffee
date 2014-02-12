define [
    "backbone"
    "marionette"
    "app/models/image"
], (
    Backbone
    Marionette
    ModelImage
) ->
    class ImageCache extends Backbone.Model
        @cache : {}

        @getImage : (uri) ->
            if not @cache.id
                @cache.id = new ModelImage uri : uri
            return @cache.id.getImage()

    return ImageCache
