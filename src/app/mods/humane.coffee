define [
    'humane-js'
], (
    Humane
) ->

    Humane.error = Humane.spawn
        addnCls: 'humane-libnotify-error'
        timeout: 3000

    Humane
