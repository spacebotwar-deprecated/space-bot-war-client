define [
    "backbone"
    "marionette"
    "app/models/image"
], (
    Backbone
    Marionette
    Image
) ->
    class ImageCache extends Backbone.Model
        @cache : {}

        @getImage : (id) ->
            if @cache.id
                console.log "existing cached image"
            else
                console.log "new cached image"
                @cache.id = new Image
            return @cache.id

    return ImageCache
