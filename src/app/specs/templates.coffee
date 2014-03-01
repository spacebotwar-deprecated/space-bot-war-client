define () ->

    describe 'the Templates module', () ->

        beforeEach (done) ->
            @templates = require 'app/util/templates'
            done()

        describe 'the load() method', () ->

            it 'should return nothing', () ->
                expect @templates.load 'testTemplate', 'testTemplate'
                    .toBeUndefined()

        describe 'the Templates#get() method', () ->
            # console.log 'doing something'
