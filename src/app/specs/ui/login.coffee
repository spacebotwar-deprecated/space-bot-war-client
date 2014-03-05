define [
    'jquery'
    'backbone'
    'marionette'
    'app/app'
    'my-config'
    'app/util/constants'
], (
    $
    Backbone
    Marionette
    App
    MyConfig
    Constants
) ->

    describe 'ui logging in and out =>', () ->

        callback = null
        connected = no

        Backbone.on 'ws:connected', () ->
            connected = yes
            callback()

        beforeEach (done) ->
            callback = done
            callback() if callback? and connected

        loggedIn = no
        login = () ->
            if not loggedIn
                $ '#username'
                    .val MyConfig.user.name
                $ '#password'
                    .val MyConfig.user.password
                $ '#login'
                    .click()
                loggedIn = yes
            else
                null

        loggedOut = no
        logout = () ->
            if not loggedOut
                $ '#logout'
                    .click()
            else
                null

        describe 'logging in', () ->

            beforeEach (done) ->
                login()
                setTimeout done, Constants.DOM_UPDATE_TIME

            it 'should change the hash to #game', () ->
                expect window.location.hash
                    .toEqual '#game'

            it 'should render the game intro screen', () ->
                expect $ App.mainRegion.el
                    .toContainText '
                        This is the main game screen, displayed after logging in.
                    '


        describe 'logging out', ()  ->

            beforeEach (done) ->
                logout()
                setTimeout done, Constants.DOM_UPDATE_TIME

            it 'should change the hash to #welcome', () ->
                expect window.location.hash
                    .toEqual '#welcome'

            it 'should render welcome intro screen', () ->
                expect $ App.mainRegion.el
                    .toContainText '
                        In the 31st Century mankind is exploring the galaxy
                    '
                
