define [
    'my-config'
], (
    MyConfig
) ->

    describe 'module app/components/connection =>', () ->

        beforeEach () ->
            @connection = require 'app/components/connection'
            # Note: we are not init()'ing the connection, because there's not
            # really anything to test that requires a connection.
            @testConnection = new @connection MyConfig.webSocketUrls.start
            # @testConnection.init() # or something

        describe 'getModuleName()', () ->

            it 'should return the module that the url specifies', () ->

                expect @testConnection.getModuleName()
                    .toEqual 'start'
