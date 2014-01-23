`"use strict"`

express   = require 'express'
app       = express()
http      = require 'http'
path      = require 'path'
port      = if process.env.PORT? then process.env.PORT else 8001
servePath = path.join __dirname, '..', 'public'

# Server Configuration
app.configure () ->

    # Tell express to serve files from /public.
    app.use express.static servePath
    
    # Complain as loudly as possible when an error occurs.
    app.use express.errorHandler
        dumpExceptions:  true
        showStack:       true
    

# Start Node.js Server
server = http.createServer app
server.listen port

console.log 'Welcome to SpaceBotWar!'
console.log "Serving files from #{servePath}."
console.log "Hit http://localhost:#{port} to start debugging!!"
