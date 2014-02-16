define [
    'my-config'
    'jquery'
    'backbone'
    'app/components/connection'
    'app/components/session'
    'humane'
], (
    MyConfig
    $
    Backbone
    Connection
    Session
    Humane
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

            # The user has pressed the almighty logout button.
            Backbone.on "user:logout", () =>
                console.log 'BACKBONE: user:logout'
                message =
                    route   : '/logout'
                    content :
                        client_code : Session.getClientCode()
                @connection.send message

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
