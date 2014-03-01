define [
    'handlebars'
], (
    Handlebars
) ->

    # Handlebars AMD seems to do this for some reason. The Handlebars we all
    # know and love is hidden in this 'default' thing.
    Handlebars = Handlebars.default

    class Templates

        constructor: () ->
            # Cache for the loaded templates. We can't use Handlebars.templates
            # because RequireJs stores modules as singletons, meaning, that
            # a template added to Handlebars.templates here, won't exist next
            # time Handlebars is require()'d.
            @cache = Handlebars.templates or {}

        load: (path, name=path) ->
            if @cache[name]
                undefined
            else
                $.ajax
                    url     : 'templates/' + path + '.html'
                    async   : no
                    cache   : no # Because getting templates like this is for debug
                    success : (template="") =>
                        @save name, template
                undefined

        # Mostly used for testing, checks if a template has been loaded
        loaded: (name="") ->
            if @cache[name] then yes else no

        save: (name, template) ->
            # Remove new lines so that the HTML is smaller, easier to
            # test and if you look at in the Chrome DevTools, it's
            # pretty printed anyway.
            template = template.replace /^\s+|\s+$/g, ''

            @cache[name] = Handlebars.compile template

        templateNotLoaded: (name) ->
            # TODO: log this to the debug console.
            console.log "ERROR: template #{name} is not loaded!"

        # Example usages:
        # template = Templates.get 'template'
        get: (name="") ->
            @cache[name] or @templateNotLoaded(name)

    new Templates
