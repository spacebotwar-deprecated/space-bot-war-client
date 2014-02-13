define [
    "backbone"
    "marionette"
], (
    Backbone
    Marionette
) ->
    
    class LoginStatus extends Backbone.Model
        defaults:
            username : ''
            userId   : 0
            loggedIn : false
        
        initialize: () ->
            # Setup the events for when login or logout requests succeed.
            Backbone.on "ws:recv:/login_with_password", @loginSuccess, @
            Backbone.on "ws:recv:/logout", @logoutSuccess, @

        logoutSuccess: () ->
            @set
                username    : ''
                userId      : 0
                loggedIn    : false

            console.log "MODEL: LOGOUT: logout_success"

        loginSuccess: (data={}) ->
            @set
                username    : data.content.username
                userId      : data.content.user_id
                loggedIn    : true

            console.log "MODEL: LOGIN: login_success #{JSON.stringify data}"

    return LoginStatus
