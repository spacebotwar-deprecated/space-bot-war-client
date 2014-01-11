define([
    'humane'
],
function(
    Humane
) {
    function setupOtherStuff() {

        /*
         * Humane
         */
        Humane.error = Humane.spawn({
            addnCls: 'humane-libnotify-error',
            timeout : 3000
        });

        
    }

    return setupOtherStuff;
});
