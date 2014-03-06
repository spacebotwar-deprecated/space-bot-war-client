define [
    'underscore'
], (
    _
) ->
    # NOTE: update these arrays when you add more unit tests!
    moduleTests = [
        'templates'
        'connection'
    ]

    uiTests = [
        'login'
    ]

    # Fix the paths
    moduleTests = _.map moduleTests, (val) -> "app/specs/module/#{val}"
    uiTests     = _.map uiTests,     (val) -> "app/specs/ui/#{val}"

    # Go, go, GO! :D
    require _.flatten([moduleTests, uiTests]), () ->
        window.startJasmineTests()
