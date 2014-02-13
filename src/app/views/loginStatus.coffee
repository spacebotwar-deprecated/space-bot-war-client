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

    Templates.load 'main/loggedIn', 'mainLoggedIn'
    Templates.load 'main/loggedOut', 'mainLoggedOut'
    Templates.load 'login/register', 'loginRegister'
    
    class LoginStatus extends Backbone.Marionette.ItemView
        render: () ->
            if @model.get 'loggedIn'
                template = Templates.get 'mainLoggedIn'
            else
                template = Templates.get 'mainLoggedOut'
            $ @el 
                .html template @model.attributes

        events:
            'click #login'          : 'login'
            'click #logout'         : 'logout'
            'click #register'       : 'register'
            'click #lostPassword'   : 'lostPassword'

        login: () ->
            console.log "Logging in"
            username = $ '#username'
                .val()
            password = $ '#password'
                .val()
            Backbone.trigger "user:login", {username, password}

        logout: () ->
            console.log "Logging out"
            Backbone.trigger "user:logout"
        
        lostPassword: () ->
            # TODO: implement lost password
            alert 'Not implemented!'
        
        register: () ->
            #Backbone.trigger "user:register", {}
            template = Templates.get 'loginRegister'
            $ @el
                .html template()
        
        initialize: () ->
            @model.bind 'change:loggedIn', @render, @

    LoginStatus
