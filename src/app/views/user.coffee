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

    Templates.load 'login/loggedOut', 'loginLoggedOut'
    Templates.load 'login/loggedIn', 'loginLoggedIn'
    Templates.load 'login/register', 'loginRegister'
    
    class User extends Backbone.Marionette.ItemView
        render: () ->
            names = ['loginLoggedOut', 'loginLoggedIn', 'loginRegister']
            template = Templates.get names[@model.get 'state']
            $ @el
                .html template @model.attributes

        events:
            'click #login'          : 'login'
            'click #logout'         : 'logout'
            'click #register'       : 'register'
            'click #lostPassword'   : 'lostPassword'

        login: () ->
            if @model.get('state') == 0
                username = $ '#username'
                    .val()
                password = $ '#password'
                    .val()
                Backbone.trigger "user:login", {username, password}

        logout: () ->
            if @model.get('state') == 1
                Backbone.trigger "user:logout"
        
        lostPassword: () ->
            if @model.get('state') == 0
                # TODO: implement lost password
                throw new Erorr 'Not implemented!'
        
        register: () ->
            if @model.get('state') == 0
                @model.set 'state', 2

            else if @model.get('state') == 2
                parameters = {}

                _.each ['username', 'password', 'email'], (elName) ->
                    elValue = @$ "##{elName}"
                        .val()
                    parameters[elName] = elValue
                
                Backbone.trigger 'user:register', parameters        

        initialize: () ->
            @model.bind 'change:state', @render, @

    User
