define [
    "backbone"
    "marionette"
    'app/models/images'
], (
    Backbone
    Marionette
    ModelImages
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

        # Model Constructor
        initialize: () ->
            @images = new ModelImages
            @image = @images.get 'ship'

        tick: () ->
            # On each 'tick' of the server, record the previous value of x,y and orientation
            # BEFORE updating the other attributes.
            @set "previous_x", @x
            @set "previous_y", @y
            @set "previous_orientation", @orientation

        # It's a bit odd rendering in the model, revist this!
        # TODO: don't render inside the model. WTF?
        render: (context={}) ->
            console.log "Model:Ship:render #{@get 'id'} x=#{@get 'x'} y=#{@get 'y'}"
            context.save()
            context.translate @get('x') + 1000, 1000 - @get 'y'
            context.rotate 0 - @get 'orientation'
            context.drawImage @image, -20, -20
            context.restore()

    return Ship
