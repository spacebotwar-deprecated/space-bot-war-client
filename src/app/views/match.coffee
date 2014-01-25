define [
    'App'
    'backbone'
    'marionette'
    'jquery'
    'models/match'
    'jqueryui'
], (
    App
    Backbone
    Marionette
    $
    ModelMatch
) ->
    
    class Match extends Backbone.Marionette.ItemView
        template: template
        # TODO: does this constructor *really* need the empty object?
        model: new ModelMatch({})

        render: () ->
            @$el.html(template);
           
            @$ ".draggable_canvas" .draggable 
                containment: 'parent'

            canvas = @$ "#draggable_canvas"
            context = canvas.getContext '2d'
            
            # TODO: I have no idea why, but at this point canvas is 300x150
            # so I have to set it to this size. Note, default is 300x150
            # so perhaps that has something to do with it
            canvas.height = 3000
            canvas.width = 3000
            
            context.scale 0.5, 0.5
            context.clearRect 0, 0, 3000, 3000
            context.beginPath()
            context.arc 1500, 1500, 1495, 0, Math.PI * 2, yes
            context.lineWidth = 2
            context.strokeStyle = 'red'
            context.stroke()

    return Match
