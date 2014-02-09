define [
    'handlebars'
], (
    Handlebars
) ->
    
    class Templates

        constructor: () ->
            # Cache for the loaded templates. We can't use Handlebars.templates
            # because RequireJs stores modules as singletons, meaning, that
            # a template added to Handlebars.templates here, won't exist next
            # time Handlebars is require()'d.
            @cache = Handlebars.templates or {}

        load: (path, name=path) ->
            return if @cache[name]
            $.ajax
                url     : 'templates/' + path + '.html'
                async   : no
                cache   : no # because getting templates like this is for debug
                success : (data="") =>
                    @cache[name] = Handlebars.compile data

        templateNotLoaded: (name) ->
            # TODO: log this to the debug console.
            console.log "ERROR: template #{name} is not loaded!"

        # Example usages:
        # template = Templates.get 'template'
        # {template1, template2} = Templates.get 'template1', 'template2'
        get: (name="") ->
            @cache[name] or @templateNotLoaded(name)

    new Templates
