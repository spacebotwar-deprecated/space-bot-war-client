define [
    'backbone'
    'marionette'
    'app/util/notify'
    'jquery'
    'jquery.json'
], (
    Backbone
    Marionette
    Notify
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

        onOpen: () =>
            Backbone.trigger "#{@prefix}:connected"
            console.log "Successfully connected to #{@url}"

        onMessage: (e={}) =>
            data    = $.evalJSON e.data
            route   = data.route
            content = data.content

            if content.code == 0
                Backbone.trigger "#{@prefix}:recv:#{route}", data
            else
                # For now, on an error, put up a 'humane' message.
                Notify.error content.message
                # TODO: use a logger for this!
                console.error "ERROR: #{content.code} - #{content.message}"

        send: (data={}) =>
            console.log "Sending #{$.toJSON data} to #{@url}"
            @connection.send $.toJSON data

        getModuleName: () ->
            # Get the module from the url.
            # eg,
            # ws://spacebotwar.com:5000/ws/start == start
            # ws://spacebotwar.com:5000/ws/lobby == lobby
            # ws://spacebotwar.com:5000/ws/match == match
            # etc etc. :D
            @url.substr @url.lastIndexOf('/') + 1, @url.length - 1


    Connection
