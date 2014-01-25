###
    TODO: does this shit mean anything??
###
define [
    "jquery"
    "backbone"
    "models/Model"
], (
    $
    Backbone
    Model
) ->
    # Creates a new Backbone Collection class object
    class Collection extends Backbone.Collection
        # Tells the Backbone Collection that all of it's models will be of 
        # type Model (listed up top as a dependency)
        model: Model

    return Collection
