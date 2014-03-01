# NOTE: update this array when you add more unit tests!
tests = [
    'testSpec'
    'templates'
]

# Fix the paths
tests = tests.map (val) -> "app/specs/#{val}"

# Go, go, GO! :D
require tests, () ->
    window.startJasmineTests()
