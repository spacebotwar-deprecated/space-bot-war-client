define [
    'backbone'
    'marionette'
    'jquery'
    'models/match'
    'jqueryui'
], (
    Backbone
    Marionette
    $
    ModelMatch
) ->

    class Match extends Backbone.Marionette.ItemView
        # TODO: this 'template' var is undefined. Is it doing anything?
        template: template
        # TODO: does this constructor *really* need the empty object?
        model: new ModelMatch {}

        render: () ->
            @$el.html(template);

            @$ ".draggable_canvas" .draggable
                containment: 'parent'

            canvas = @$ "#draggable_canvas"
            context = canvas.getContext '2d'

            canvas.height = 3000
            canvas.width = 3000

            context.scale 1, 1
            context.clearRect 0, 0, 3000, 3000
            context.beginPath()
            context.arc 1500, 1500, 1495, 0, Math.PI * 2, yes
            context.lineWidth = 2
            context.strokeStyle = 'red'
            context.stroke()

    return Match
