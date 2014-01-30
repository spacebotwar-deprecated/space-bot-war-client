define [
    "backbone"
    "marionette"
    'image!img/sp_ship.png'
], (
    Backbone
    Marionette
    ImageShip
) ->
    # class Images extends Backbone.Model
    #     defaults:
    #         id   : 0
    #         ship : ImageShip

    Images = Backbone.Model.extend
        defaults:
            id   : 0
            ship : ImageShip
    
    return Images
