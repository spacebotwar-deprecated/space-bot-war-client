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
    class ViewGameEditor extends Backbone.Marionette.ItemView
        editorElement: null
        template: Templates.get 'gameEditor'

        events:
            'keydown #sbwEditorField' : 'handleHighlight'

        onRender: () ->
            @handleHighlight()

        handleHighlight: () ->
            # The onRender callback gets fired before the HTML hits the road.
            # (Contrary to anything the Marionette Docs say)
            # TODO: is there any way to avoid doing this?
            setTimeout @highlightCode, 50

        highlightCode: () ->
            @editorElement or= document.getElementById 'sbwEditorField'
            Highlight.highlightBlock editorElement

    ViewGameEditor
