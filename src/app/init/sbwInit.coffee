define [
    'humane'
], (
    Humane
) ->

    class SBWInit
        constructor: () ->
            @humane()

        humane: () ->
            Humane.error = Humane.spawn
                addnCls: 'humane-libnotify-error'
                timeout: 3000

    return SBWInit
