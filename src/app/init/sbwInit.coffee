define [
    'humane'
], (
    Humane
) ->

    class SbwInit
        constructor: () ->
            @humane()

        humane: () ->
            Humane.error = Humane.spawn
                addnCls: 'humane-libnotify-error'
                timeout: 3000

    return SbwInit
