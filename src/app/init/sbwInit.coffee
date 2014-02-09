define [
    'humane'
], (
    Humane
) ->

    class SbwInit
        constructor: () ->
            @humane()

        humane: () ->
            # TODO: this doesn't actually get save in the Humane object when
            # called later on.
            Humane.error = Humane.spawn
                addnCls: 'humane-libnotify-error'
                timeout: 3000

    return SbwInit
