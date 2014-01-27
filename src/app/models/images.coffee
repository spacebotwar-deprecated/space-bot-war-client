define [
    "jquery"
    "backbone"
    'image!/img/sp_ship.png'
], (
    $
    Backbone
    ImageShip
) ->
    class Images extends Backbone.Model
        defaults:
            id   : 0
            ship : ImageShip

    return Images
