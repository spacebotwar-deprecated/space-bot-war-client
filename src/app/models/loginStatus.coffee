define [
    "jquery"
    "backbone"
], (
    $
    Backbone
) ->
    
    class LoginStatus extends Backbone.Model
        defaults:
            username : ''
            userId   : 0
            loggedIn : false
        
        initialize: () ->
            Backbone.on "ws:recv:/login_with_password", @loginSuccess, @
            Backbone.on "ws:recv:/logout", @logoutSuccess, @

        logoutSuccess: () ->
            @set
                username    : ''
                user_id     : 0
                logged_in   : false

            console.log "MODEL: LOGOUT: logout_success"

        loginSuccess: (data={}) ->
            @set
                username    : data.content.username
                user_id     : data.content.user_id
                logged_in   : true

            console.log "MODEL: LOGIN: login_success #{JSON.stringify data}"

    return LoginStatus
