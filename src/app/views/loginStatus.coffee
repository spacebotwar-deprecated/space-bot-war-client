define [
    'backbone'
    'marionette'
    'jquery'
    'hbs!/templates/main/loggedIn'
    'hbs!/templates/main/loggedOut'
], (
    Backbone
    Marionette
    $
    templateLoggedIn
    templateLoggedOut
) ->
    class LoginStatus extends Backbone.Marionette.ItemView
        render: () ->
            if (@model.get 'logged_in')?
                $(@el).html templateLoggedIn @model.attributes
            else
                $(@el).html templateLoggedOut @model.attributes

        events:
            'click #login'          : 'login'
            'click #logout'         : 'logout'
            'click #register'       : 'register'
            'click #lostPassword'  : 'lostPassword'

        login: () ->
            console.log "Logging in"
            username = $('#username').val()
            password = $('#password').val()
            Backbone.trigger "user:login", {username, password}

        logout: () ->
            console.log "Logging out"
            Backbone.trigger "user:logout"
        
        lostPassword: () ->
            # TODO: implement lost password
            alert 'Not implemented!'
        
        register: () ->
            Backbone.trigger "user:register", {}
            alert 'register'
        
        initialize: () ->
            @model.bind 'change:logged_in', @render, @

    return LoginStatus
