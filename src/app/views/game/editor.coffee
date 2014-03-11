define [
    'app/app'
    'backbone'
    'marionette'
    'app/util/templates'
    'highlight'
], (
    App
    Backbone
    Marionette
    Templates
    Highlight
) ->
    Templates.load 'game/editor', 'gameEditor'
    class ViewGameEditor extends Backbone.Marionette.Layout
        template: Templates.get 'gameEditor'

        events:
            'keydown #sbwEditorField' : 'highlightCode'

        onRender: () ->
            @highlightCode()

        highlightCode: () ->
            console.log 'highlightCode() called'
            Highlight.highlightBlock @el

    ViewGameEditor
