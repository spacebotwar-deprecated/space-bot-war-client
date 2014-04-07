define [
    'my-config'
    'jquery'
    'backbone'
    'app/components/connection'
    'app/components/session'
], (
    MyConfig
    $
    Backbone
    Connection
    Session
) ->

    # The Start Module is responsible for handling login and registration
    #
    class Start
        init: () =>

            @connection = new Connection MyConfig.webSocketUrls.start, 'ws'
            @connection.init()

            @initEvents()

        initEvents: () ->

            # Triggered when the user hits the login button.
            Backbone.on "user:login", (data={}) =>
                message =
                    route   : '/login_with_password'
                    content :
                        password    : data.password
                        username    : data.username
                        client_code : Session.getClientCode()
                @connection.send message

            Backbone.on 'ws:recv:/login_with_password', (data={}) ->
                # When we log in, change to the main game screen.
                window.location.hash = 'game'

            # The user has pressed the almighty logout button.
            Backbone.on "user:logout", () =>
                # console.log 'BACKBONE: user:logout'
                message =
                    route   : '/logout'
                    content :
                        client_code : Session.getClientCode()
                @connection.send message

            Backbone.on 'ws:recv:/logout', () ->
                # Move to welcome screen
                window.location.hash = 'welcome'

            Backbone.on 'user:register', (data={}) =>
                message =
                    route   : '/register'
                    content :
                        client_code : Session.getClientCode()
                        username    : data.username
                        password    : data.password
                        email       : data.email
                @connection.send message

            # User changes their password from an email code
            Backbone.on 'user:login_with_email_code', (data={}) =>
                message =
                    route   : '/login_with_email_code'
                    content :
                        client_code     : Session.getClientCode()
                        email_code      : data.email_code
                        new_password    : data.new_password
                @connection.send message

            # User (who is logged in) changes their password
            Backbone.on 'user:change_password', (data={}) =>
                message =
                    route   : '/change_password'
                    content :
                        client_code         : Session.getClientCode()
                        current_password    : data.current_password
                        new_password        : data.new_password
                @connection.send message

            # User sends a lost password notification
            Backbone.on 'user:lost_password', (data={}) =>
                message =
                    route   : '/forgot_password'
                    content :
                        client_code         : Session.getClientCode()
                        username_or_email   : data.username_or_email
                @connection.send message

            Backbone.on 'ws:recv:/register', (data={}) =>
                # console.log  data ## DEBUG!!!

            # Called when a start/get_client_code request succeeds
            Backbone.on "ws:recv:/get_client_code", (data={}) =>
                clientCode = data.content.client_code
                Session.setClientCode clientCode

            # TODO: is this defined in the right place to work with our
            # 'separation of concerns' development model?
            Backbone.on "ws:connected", () =>
                if not Session.getClientCode()? and @connection.module == 'start'
                    message =
                        route   : '/get_client_code'
                        content :
                            client_code : Session.getClientCode()
                    @connection.send message

    Start
