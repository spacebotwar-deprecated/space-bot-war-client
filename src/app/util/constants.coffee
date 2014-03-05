define () ->
    
    Constants =
        
        # Used in testing, the time in milliseconds to wait for the DOM to
        # update. Note: this is probably too long to wait (if ever needed) in
        # a non-testing use-case. If you need to wait for the DOM to update
        # when not testing, you're probably doing something wrong.
        DOM_UPDATE_TIME: 1000


    Constants
