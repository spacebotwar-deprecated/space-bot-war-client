define [
    "backbone"
    "marionette"
], (
    Backbone
    Marionette
) ->
    
    class User extends Backbone.Model
        defaults:
            username : ''
            userId   : 0

            # Used to determine which template to display in the view
            # Note: I tried using constants but was having trouble with Backbone
            # and prototypes. It seems Backbone does some weird stuff with prototypes
            # behind the scenes.
            # 0 = logged out, 1 = logged in, 2 = registering
            state    : 0
        
        initialize: () ->
            # Setup the events for when login or logout requests succeed.
            Backbone.on "ws:recv:/login_with_password", @loginSuccess, @
            Backbone.on "ws:recv:/logout", @logoutSuccess, @

        logoutSuccess: () ->
            @set
                username    : ''
                userId      : 0
                state       : 0

            # TODO: log that we have logged out successfully
            #console.log "MODEL: LOGOUT: logout_success"

        loginSuccess: (data={}) ->
            @set
                state       : 1
                username    : data.content.username
                userId      : data.content.user_id

            # TODO: log that we have logged in successfully
            # console.log "MODEL: LOGIN: login_success #{JSON.stringify data}"

    User
