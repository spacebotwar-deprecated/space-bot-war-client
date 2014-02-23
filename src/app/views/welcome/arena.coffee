define [
    'jquery'
    'jqueryui'
    'backbone'
    'marionette'
    'image!/img/starmap1.jpg'
    'jqueryviewport'
    'app/util/templates'
], (
    $
    JqueryUi
    Backbone
    Marionette
    imageStarmap
    ViewPort
    Templates
) ->
    Templates.load 'welcome/arena', 'welcomeArena'
    class Arena extends Backbone.Marionette.Layout
        template: Templates.get 'welcomeArena'

        initialize: () ->
            @canvasImage = imageStarmap
            @listenTo @model, 'change', @modelChange
            @canvasTick()

        modelChange: () ->
            # The model changes every 500ms (typically)
            @lastTickTime  = Date.now()

        canvasTick: () =>
            # The canvas ticks 60 times a second (every 16.7 ms)
            if @context?
                interval = Date.now() - @lastTickTime

#                console.log "####### arena canvasTick #{Date.now()} #{interval} #{@lastTickTime} #######"
                @context.clearRect 0, 0, 3000, 3000
                @context.beginPath()
                @context.arc 1500, 1500, 1495, 0, Math.PI * 2, yes
                @context.lineWidth = 2
                @context.strokeStyle = 'red'
                @context.stroke()

                # Render each ship
                ships = @model.get 'ships'
                ships.each (ship) =>
                    ship.render(@context, interval)
            requestAnimationFrame(@canvasTick)

        # TODO: also appears in view/match.coffee at some point we should
        #   factor it out...
        #
        render: () ->
            @$el.html this.template()
            # console.log "######### arena (welcome) render! ##############"

            @$(".draggable_canvas").draggable
                containment: "parent"
            canvas = @$("#draggable_canvas")[0]

            canvas.height = 3000
            canvas.width = 3000
            @context = canvas.getContext '2d'
            @context.scale 0.5, 0.5
