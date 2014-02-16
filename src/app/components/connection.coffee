define [
    'backbone'
    'marionette'
    'humane'
    'jquery'
    'jquery.json'
], (
    Backbone
    Marionette
    Humane
    $
    JSON
) ->

    class Connection

        constructor: (@url, @prefix) ->
            @module = @getModuleName @url

        init: () ->
            console.log "Attempting connection to #{@url}"
            @connection = new WebSocket @url

            @connection.onerror     = @onError
            @connection.onopen      = @onOpen
            @connection.onmessage   = @onMessage

        onError: (e={}) =>
            console.log "#{@prefix}:error", e
            Backbone.trigger "#{@prefix}:error", e

        onOpen: (e={}) =>
            Backbone.trigger "#{@prefix}:connected"
            console.log "Successfully connected to #{@url}"

        onMessage: (e={}) =>
            data    = $.evalJSON e.data
            route   = data.route
            content = data.content
            #console.log "#{@prefix}:recv:#{route}", e.data

            if content.code == 0
                Backbone.trigger "#{@prefix}:recv:#{route}", data
            else
                # For now, on an error, put up a 'humane' message.
                Humane.error content.message
                console.error "ERROR: #{content.code} - #{content.message}"

        send: (data={}) =>
            console.log "Sending #{$.toJSON data} to #{@url}"
            @connection.send $.toJSON data

        # TODO: this looks like a simple method to play with unit testing.
        getModuleName: (name="") ->
            # Get the module from the url.
            # eg,
            # ws://spacebotwar.com:5000/ws/start == start
            # ws://spacebotwar.com:5000/ws/lobby == lobby
            # ws://spacebotwar.com:5000/ws/match == match
            # etc etc. :D
            name.substr name.lastIndexOf('/') + 1, name.length - 1


    Connection
