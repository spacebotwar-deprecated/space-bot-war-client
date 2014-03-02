# define [
#     'jquery'
#     'backbone'
#     'marionette'
#     'my-config'
# ], (
#     $
#     Backbone
#     Marionette
#     MyConfig
# ) ->

#     beforeEach (done) ->
#         Backbone.on 'ws:connected', () ->
#             done()

#     describe 'ui test login =>', () ->
#         it 'should work', () ->
#             expect true
#                 .toBe true

#     # Backbone.on 'ws:connected', () ->
#         # $('#username').val('Vasari')
#         # $('#password').val('Perlyboy168')
#         # $('#login').click()

#     undefined

#`define(function(){return {foo: 'bar'}});`
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

    describe 'ui login =>', () ->

        describe 'logging in', () ->

            callback = (() ->)
            Backbone.on 'ws:connected', () -> callback()
            beforeEach (done) -> callback = done

            it 'should display the main game screen', () ->
                # TODO: actually test something!
                expect yes
                    .toBe yes
