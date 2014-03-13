define [
    'woodman'
], (
    Woodman
) ->

    logger = Woodman.getLogger 'app/components/logger'

    class Session
        constructor: () ->
            {@clientCode} = localStorage

        getClientCode: () ->
            return @clientCode

        setClientCode: (newClientCode) ->
            return if !newClientCode
            localStorage.clientCode = newClientCode
            @clientCode = newClientCode
            logger.info "Received new clientCode #{newClientCode}"

    new Session
