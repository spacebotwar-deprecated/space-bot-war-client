var express = require("express"),
    http = require("http"),
    port = (process.env.PORT || 8001),
    server = module.exports = express(),
    path = require('path')
;

// Server Configuration
server.configure(function () {

    // Tell express to serve files from /public.
    server.use(express.static(path.join(__dirname, '..', 'public')));
    
    // Complain as loudly as possible when an error occurs.
    server.use(express.errorHandler({
        dumpExceptions: true,
        showStack: true
    }));

    // The Dev server seems to work without these defined. Not sure what they
    // actually do. Any documentation I've found is rather limited.
    //
    //server.use(express.bodyParser());
    //server.use(server.router);
});

// Start Node.js Server
http.createServer(server).listen(port);

console.log('Welcome to SpaceBotWar!');
console.log('Hit http://localhost:' + port + ' to start debugging!!');
