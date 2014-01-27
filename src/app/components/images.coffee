define [
    'my-config'
    'jquery'
    'image!/img/sp_ship.png'
], (
    MyConfig
    $
    ImageShip
) ->

    images =
        ship : new ImageShip

    return images
