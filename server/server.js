var express = require("express"),
    http = require("http"),
    port = (process.env.PORT || 8001),
    server = module.exports = express();

// Server Configuration
server.configure(function () {

    // Tell express to serve files from /public.
    server.use(express["static"](__dirname + "/../public"));
    
    // Complain as loundly as possible when an  error occurs.
    server.use(express.errorHandler({
        dumpExceptions:true,
        showStack:true
    }));

    // Extra server stuff.
    server.use(express.bodyParser());
    server.use(server.router);
});

// Start Node.js Server
http.createServer(server).listen(port);

console.log('Welcome to SpaceBotWar!\n\nPlease go to http://localhost:' + port + ' to start playing it.');
