define [
    'jquery'
    # NOTE: Add any extra jQueryUI components as you need them!
    'jqui-dir/jquery.ui.widget'
    'jqui-dir/jquery.ui.mouse'
    'jqui-dir/jquery.ui.effect'
    'jqui-dir/jquery.ui.core'
    'jqui-dir/jquery.ui.draggable' # This one needs to load *after*, the others
], (
    Foo
) ->

    # Foo  should have all the properties that the components define attached
    # to them.
    return Foo
