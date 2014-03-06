define [
    'app/util/templates'
    'jquery'
    'notify-lib'
], (
    Templates
    $
) ->

    Templates.load 'notify/message', 'notifyMessage'
    class Notify

        constructor: () ->
            @template = Templates.get 'notifyMessage'
            @queue = []
            @rendering = no

            # setTimeout (() =>
            #     console.log 'rendering test messages'
            #     @error 'foo1'
            #     @error 'foo2'
            #     @error 'foo3'
            #     @error 'foo4'
            #     console.log  @queue
            # ), 10 * 1000 # 10  secs

        ###
            Queue stuff
        ###
        addToQueue: (message, containerClass) ->
            @queue.push {message, containerClass}
            @checkQueue()

        checkQueue: () ->
            if not @rendering and @queue[0]?
                @rendering = yes
                item = @queue.shift()
                @out item.message, item.containerClass


        ###
            Output stuff
        ###
        error: (message='') ->
            @addToQueue message, 'error'

        info: (message='') ->
            @addToQueue message, 'info'

        out: (message, containerClass) ->
            # TODO: do something with class?

            $ 'body'
                .append @template {message}

            $ '#notification'
                .miniNotification
                    hideOnClick: yes
                    onHidden: () =>
                        $ '#notification'
                            .remove()
                        @rendering = no
                        @checkQueue()

    new Notify
