define () ->

    describe 'module app/util/templates =>', () ->

        beforeEach () ->
            @templates = require 'app/util/templates'

        describe 'load()', () ->

            it 'should return nothing', (done) ->
                expect @templates.load 'testTemplate', 'testTemplate'
                    .toBeUndefined()
                done()

            it 'should load the template', (done) ->
                expect @templates.loaded 'testTemplate'
                    .toBe yes
                done()

        describe 'get()', () ->

            it 'should return a function', () ->
                expect typeof @templates.get 'testTemplate'
                    .toMatch /function/i

            it 'should generate the correct HTML when called', () ->
                expect @templates.get('testTemplate').call()
                    .toEqual '<p>Test</p>'
