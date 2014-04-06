define [
    'backbone'
    'marionette'
    'jquery'
    'app/util/templates'
], (
    Backbone
    Marionette
    $
    Templates
) ->

    Templates.load 'login/loggedOut',       'show_login'
    Templates.load 'login/loggedIn',        'show_logout'
    Templates.load 'login/register',        'show_register'
    Templates.load 'login/forgotPassword',  'show_lost_password'
    Templates.load 'login/emailLogin',      'show_email_login'

    class User extends Backbone.Marionette.ItemView

        render: () ->
            template = Templates.get @model.get 'state'
            $ @el
                .html template @model.attributes

        events:
            'click #login'                  : 'triggerLogin'
            'click #logout'                 : 'triggerLogout'
            'click #register'               : 'triggerRegister'
            'click #send_reminder'          : 'triggerLostPassword'
            'click #change_password'        : 'triggerChangePassword'
            'click #to_register'            : 'toRegister'
            'click #to_lost_password'       : 'toLostPassword'
            'click #to_email_login'         : 'toEmailLogin'

            'click #cancel'                 : 'toLogin'
            'click #cancel_email_login'     : 'toLogin'

            'keydown #username, #password'  : 'keyPressed'

        triggerLogin: () ->
            username = $ '#username'
                .val()
            password = $ '#password'
                .val()
            Backbone.trigger "user:login", {username, password}

        triggerLogout: () ->
            Backbone.trigger "user:logout"

        triggerRegister: () ->
            parameters = {}
            parameters[name] = @$("##{name}").val() for name in ['username', 'password', 'email']

            Backbone.trigger 'user:register', parameters

        triggerLostPassword: () ->
            username_or_email = $ '#username_or_email'
                .val()
            Backbone.trigger 'user:lost_password', {username_or_email}

        triggerChangePassword: () ->
            email_code = $ '#email_key'
                .val()
            new_password  = $ '#password'
                .val()
            Backbone.trigger 'user:login_with_email_code', {email_code, new_password}

        keyPressed: (event={}) ->
            if event.keyCode == 13 # 'enter' key
                event.preventDefault()
                state = @model.get('state')

                if state == 'show_login'
                    @triggerLogin()
                else if state == 'show_register'
                    @triggerRegister()
                else if state == 'show_lost_password'
                    @triggerLostPassword()
                else if state == 'show_email_login'
                    @triggerEmailLogin()

        # Show the standard login form
        toLogin: () ->
            @model.set 'state', 'show_login'

        # Show the users name, and a logout option
        toLogout: () ->
            @model.set 'state', 'show_logout'

        # Show the form to request a password reminder
        toLostPassword: () ->
            @model.set 'state', 'show_lost_password'

        # Show the registration form
        toRegister: () ->
            @model.set 'state', 'show_register'

        # Show the login which uses an email token
        toEmailLogin: () ->
            @model.set 'state', 'show_email_login'

        initialize: () ->
            @model.bind 'change:state', @render, @

    User
