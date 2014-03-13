define [
    'backbone'
    'marionette'
    'woodman'
    'app/util/notify'
    'jquery'
], (
    Backbone
    Marionette
    Woodman
    Notify
    $
) ->

    logger = Woodman.getLogger 'app/components/connection'

    class Connection

        constructor: (@url, @prefix) ->
            @module = @getModuleName

        init: () ->
            logger.info "Attempting connection to #{@url}"
            @connection = new WebSocket @url

            @connection.onerror     = @onError
            @connection.onopen      = @onOpen
            @connection.onmessage   = @onMessage

        onError: (e={}) =>
            logger.error "#{@prefix}:error", e
            Backbone.trigger "#{@prefix}:error", e

        onOpen: () =>
            logger.info "Successfully connected to #{@url}"
            Backbone.trigger "#{@prefix}:connected"

        onMessage: (e={}) =>
            data    = $.parseJSON e.data
            route   = data.route
            content = data.content

            if content.code == 0
                logger.info 'Call succeeded, received data:', data
                Backbone.trigger "#{@prefix}:recv:#{route}", data
            else
                # For now, on an error, put up a big notification.
                Notify.error content.message
                logger.error "ERROR: #{content.code} - #{content.message}"

        send: (data={}) =>
            logger.info 'Sending', data, 'to', @url
            @connection.send JSON.stringify data

        getModuleName: () ->
            # Get the module from the url.
            # eg,
            # ws://spacebotwar.com:5000/ws/start == start
            # ws://spacebotwar.com:5000/ws/lobby == lobby
            # ws://spacebotwar.com:5000/ws/match == match
            # etc etc. :D
            @url.substr @url.lastIndexOf('/') + 1, @url.length - 1


    Connection
