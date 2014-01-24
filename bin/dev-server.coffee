`"use strict"`

express  = require 'express'
app      = express()
http     = require 'http'
path     = require 'path'
port     = if process.env.PORT? then process.env.PORT else 8001
pathBase = path.join __dirname, '..'

app.configure () ->

    # Serve files from /public and /src.
    for directory in ['src', 'public']
        app.use express.static path.join pathBase, directory
    
    # Complain as loudly as possible when an error occurs.
    app.use express.errorHandler
        dumpExceptions:  true
        showStack:       true
    

# Start Node.js Server
server = http.createServer app
server.listen port

console.log 'Welcome to SpaceBotWar!'
console.log "Hit http://localhost:#{port} and git to work!!"
console.log '...see what I did there? :P'
