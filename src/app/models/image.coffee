define [
    "backbone"
    "marionette"
    "jquery"
], (
    Backbone
    Marionette
    $
) ->
    class ModelImage extends Backbone.Model
        defaults:
            uri             : ''
            width           : 10
            height          : 10
            image           : 0

        # Class method to return a default image
        @defaultImage : 0

        initialize: () ->
            if not @defaultImage
                # This creates a default image (a red square) until the real image loads
                canvas = document.createElement("canvas")
                canvas.width = 60
                canvas.height = 60
                ctx = canvas.getContext("2d")
                ctx.rect(0,0,60,60)
                ctx.fillStyle = "red"
                ctx.fill()
                img = new Image()
                img.src = canvas.toDataURL("image/png")
                @defaultImage = img


        getImage: () ->
            img = @get("image")
            if not img
                img = new Image
                img.src = @get("uri")
                @set("image", img)

            if not img or not img.complete
                return @defaultImage
            return img

    return ModelImage
