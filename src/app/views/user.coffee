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

    Templates.load 'login/loggedOut', 'show_login'
    Templates.load 'login/loggedIn', 'show_logout'
    Templates.load 'login/register', 'show_register'
    Templates.load 'login/forgotPassword', 'show_lost_password'

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
            'click #to_register'            : 'toRegister'
            'click #to_lost_password'       : 'toLostPassword'

            'click #cancel'                 : 'toLogin'

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

        keyPressed: (event={}) ->
            if event.keyCode == 13 # 'enter' key
                event.preventDefault()
                if @model.get('state') == 'show_login'
                    @triggerLogin()
                else if @model.get('state') == 'show_register'
                    @inRegister()
                else if @model.get('state') == 'show_lost_password'
                    @inLostPassword()

        toLogin: () ->
            @model.set 'state', 'show_login'

        toLostPassword: () ->
            @model.set 'state', 'show_lost_password'

        toRegister: () ->
            @model.set 'state', 'show_register'


        initialize: () ->
            @model.bind 'change:state', @render, @

    User
