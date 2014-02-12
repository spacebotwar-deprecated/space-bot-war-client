define [
    "backbone"
    "marionette"
], (
    Backbone
    Marionette
) ->
    class Image extends Backbone.Model
        defaults:
            width   : 10
            height  : 10
            image   : 0

        # Class method to return a default image
        @defaultImage : 0

        initialize: () ->
            if not @defaultImage
                # This creates a default image (a red square) until the real image loads
                canvas = document.createElement("canvas")
                canvas.width = 10
                canvas.height = 10
                ctx = canvas.getContext("2d")
                ctx.rect(0,0,10,10)
                ctx.fillStyle = "red"
                ctx.fill()
                img = new Image()
                @defaultImage = canvas.toDataURL("image/png")

            @image = @defaultImage

    return Image
