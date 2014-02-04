define [
    'backbone',
    'marionette',
    'humane'
], (
    Backbone,
    Marionette,
    Humane
) ->

    class Connection

        constructor: (url, prefix) ->
            @url    = url
            @prefix = prefix
        
        init: () ->
            console.log "Debug: attempting connection to #{@url}"
            @connection = new WebSocket @url

            @connection.onerror     = @onError
            @connection.onopen      = @onOpen
            @connection.onmessage   = @onMessage

        onError: (e={}) ->
            console.log "#{@prefix}:error", e
            Backbone.trigger "#{@prefix}:error", e

        onOpen: (e={}) ->
            Backbone.trigger "#{@prefix}:connected"
            console.log "#{@prefix}:connected"
            console.log "Successfully connected to #{@url}"

        onMessage: (e={}) ->
            data    = $.evalJSON e.data
            route   = data.route
            content = data.content
            console.log "#{@prefix}:recv:#{route}", e.data

            if content.code == 0
                Backbone.trigger "#{@prefix}:recv:#{route}", data
            else
                # For now, on an error, put up a 'humane' message.
                Humane.error content.message
                console.error "ERROR: #{content.code} - #{content.message}"

        send: () ->
            @connection.send JSON.stringify data

    return Connection
