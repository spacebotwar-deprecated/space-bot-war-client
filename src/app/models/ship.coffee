define [
    "backbone"
    "marionette"
    "app/models/image_cache"
], (
    Backbone
    Marionette
    ImageCache
) ->
    class Ship extends Backbone.Model
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

        tick: () ->
            # On each 'tick' of the server, record the previous value of x,y and orientation
            # BEFORE updating the other attributes.
            @set "previous_x", @get "x"
            @set "previous_y", @get "y"
            @set "previous_orientation", @get "orientation"

        # It's a bit odd rendering in the model, revist this!
        # TODO: don't render inside the model. WTF?
        render: (context={}, interval=0) ->
#            console.log "Model:Ship:render #{@get 'id'} x=#{@get 'x'} y=#{@get 'y'}"
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

            # translate and scale from server co-ordinate system to canvas system
            x = x + 1000
            y = 1000 - y
            x *= 1.5
            y *= 1.5
            context.translate x, y
            context.rotate 0 - o
            image = ImageCache.getImage('/img/sp_ship.png')
            context.drawImage(image, -30, -30)
            context.restore()

            # Draw a circle where the ship should be.
            context.beginPath()
            context.arc x, y, 30, 0, Math.PI * 2, yes
            context.lineWidth = 2
            context.strokeStyle = 'red'
            context.setLineDash([1,2])
            context.stroke()


    return Ship
