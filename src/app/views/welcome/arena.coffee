define [
    'backbone'
    'marionette'
    'hbs!/templates/welcome/arena'
    'image!/img/starmap1.jpg'
    'jqueryviewport'
], (
    Backbone
    Marionette
    templateWelcomeArena
    imageStarmap
    ViewPort
) ->
    class Arena extends Backbone.Marionette.Layout
        template: templateWelcomeArena

        initialize: () ->
            @canvasImage = imageStarmap
            @listenTo @model, 'change', @canvasTick

        canvasTick: () ->
            if @context?

                console.log '####### arena canvasTick #######'
                @context.clearRect 0, 0, 3000, 3000
                @context.beginPath()
                @context.arc 1500, 1500, 1495, 0, Math.PI * 2, yes
                @context.lineWidth = 2
                @context.strokeStyle = 'red'
                @context.stroke()

                # Render each ship
                ships = @model.get 'ships'
                ships.each () ->
                    ship.render @context

        ## TODO: haven't I seen this code before??????
        render: () ->
            @$el.html this.template()
            console.log "######### arena (welcome) render! ##############"

            @$(".draggable_canvas").draggable
                containment: "parent"
            canvas = @$("#draggable_canvas")[0]

            # TODO I have no idea why, but at this point canvas is 300x150
            # so I have to set it to this size. Note, default is 300x150
            # so perhaps that has something to do with it
            canvas.height = 3000
            canvas.width = 3000
            @context = canvas.getContext '2d'
            @context.scale 0.5, 0.5
