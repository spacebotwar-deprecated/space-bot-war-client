define [
    'app/app'
    'backbone'
    'marionette'
    'app/util/templates'
], (
    App
    Backbone
    Marionette
    Templates
) ->
    ###
        NOTE: after a few hours of messing around I've not found a way to
        (at the very least) syntax highlight the code every keypress. Ace has
        weird styling problems, CodeMirror - Uh - I don't want to touch that
        thing and others I shall not even mention.

        So right now, if you want syntax highlighting, do it in your own editor.
        Or something. Just don't bother me right now about it. Okay?
    ###
    Templates.load 'game/editor', 'gameEditor'
    class ViewGameEditor extends Backbone.Marionette.ItemView
        # editorElement: null
        template: Templates.get 'gameEditor'

        # events:
        #     'keydown #sbwEditorField' : 'handleHighlight'

        # onRender: () ->
        #     @handleHighlight()

        # handleHighlight: () ->
        #     # The onRender callback gets fired before the HTML hits the road.
        #     # (Contrary to anything the Marionette Docs say)
        #     # TODO: is there any way to avoid doing this?
        #     setTimeout @highlightCode, 50

        # highlightCode: () ->
        #     @editorElement or= document.getElementById 'sbwEditorField'
        #     Highlight.highlightBlock editorElement

    ViewGameEditor
