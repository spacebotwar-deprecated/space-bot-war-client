define [
    "backbone"
    "marionette"
    'app/models/images'
    "app/collections/images"
], (
    Backbone
    Marionette
    ModelImages
    ImageCache
) ->
    Ship = Backbone.Model.extend
        defaults:
            id                   : 0
            owner_id             : 0
            direction            : 0
            orientation          : 0
            health               : 100
            rotation             : 0
            speed                : 0
            status               : 'ok'
            x                    : 0
            y                    : 0
            previous_x           : 0
            previous_y           : 0
            previous_orientation : 0.6
            tick                 : 0
            delta_x              : 0
            delta_y              : 0
            delta_orientation    : 0

        # Model Constructor
        initialize: () ->
            ImageCache.add([
                id :        "ship"
                #uri :       "something-or-other"
            ])
            @image = @ImageCache.get 'ship'

        tick: () ->
            # On each 'tick' of the server, record the previous value of x,y and orientation
            # BEFORE updating the other attributes.
            @set "previous_x", @get "x"
            @set "previous_y", @get "y"
            @set "previous_orientation", @get "orientation"

        # It's a bit odd rendering in the model, revist this!
        # TODO: don't render inside the model. WTF?
        render: (context={}, interval=0) ->
            console.log "Model:Ship:render #{@get 'id'} x=#{@get 'x'} y=#{@get 'y'}"
            context.save()
            fraction = interval / 500

            previous_x              = @get "previous_x"
            previous_y              = @get "previous_y"
            previous_orientation    = @get "previous_orientation"
            x                       = @get "x"
            y                       = @get "y"
            orientation             = @get "orientation"

            x = previous_x + (x - previous_x) * fraction
            y = previous_y + (y - previous_y) * fraction
            o = orientation - previous_orientation
            if o > Math.PI
                o = o - Math.PI * 2
            if o < 0 - Math.PI
                o = o + Math.PI * 2

            o = previous_orientation + o * fraction

            #console.log "Model:Ship:render: #{fraction} #{previous_x} #{previous_y} #{x} #{y} #{orientaion}"

            context.translate x + 1000, 1000 - y
            context.rotate 0 - o

            context.drawImage @image, -20, -20
            context.restore()

    return Ship
