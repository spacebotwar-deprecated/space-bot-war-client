define [
    'jquery'
    'backbone'
    'marionette'
    'my-config'
], (
    $
    Backbone
    Marionette
    MyConfig
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
                setTimeout done, 1000

            it 'should change the hash to #game', () ->
                expect window.location.hash
                    .toEqual '#game'

            it 'should render the ViewGameIntro view', () ->
                expect require('app/app').mainRegion.currentView.name
                    .toEqual 'ViewGameIntro'

        describe 'logging out', ()  ->

            beforeEach (done) ->
                logout()
                setTimeout done, 1000

            it 'should change the hash to #welcome', () ->
                expect window.location.hash
                    .toEqual '#welcome'

            it 'should render the ViewWelcome view', () ->
                expect require('app/app').mainRegion.currentView.name
                    .toEqual 'ViewWelcome'

            ## Note: apparently you break stuff if you define custom view props
            #
            # it 'should render the ViewWelcomeArena region of ViewWelcome', () ->
            #     expect require('app/app').mainRegion.currentView.regions.arena.name
            #         .toEqual 'ViewWelcomeArena'

            # it 'should render the ViewWelcomeIntro region of ViewWelcome', () ->
            #     expect require('app/app').mainRegion.currentView.regions.intro.name
            #         .toEqual 'ViewWelcomeIntro'
