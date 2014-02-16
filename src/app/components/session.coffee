define [

], (

) ->
    class Session
        constructor: () ->
            {@clientCode} = localStorage

        getClientCode: () ->
            return @clientCode

        setClientCode: (newClientCode) ->
            return if !newClientCode
            localStorage.clientCode = newClientCode
            @clientCode = newClientCode
            console.log "Received new clientCode #{newClientCode}"

    new Session
