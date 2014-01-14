define([
    'my-config',
    'jquery',
    'image!/img/sp_ship.png'
],
function(
    MyConfig,
    $,
    ImageShip
) {

    return {
        ship    : new ImageShip()
    };
});

