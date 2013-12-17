define([    'jquery',	'backbone', 'marionette',   'underscore',   'handlebars', 'jquery.json'],
function (   $,		 Backbone,   Marionette,     _,		     Handlebars) {
    var App = new Backbone.Marionette.Application();

    function isMobile() {
	var userAgent = navigator.userAgent || navigator.vendor || window.opera;
	return ((/iPhone|iPod|iPad|Android|BlackBerry|Opera Mini|IEMobile/).test(userAgent));
    }

    //Organize Application into regions corresponding to DOM elements
    //Regions can contain views, Layouts, or subregions nested as necessary
    App.addRegions({
	headerRegion:"header",
	mainRegion:"#main"
    });

    App.addInitializer(function () {
	Backbone.history.start();
    });

    App.mobile = isMobile();
    var ws;

    // Set up an event aggregator for the web socket
    //
    var init_web_socket = function() {
	var wsUrl = window.wsUrl || "ws://spacebotwar.com:5000/ws/game/lobby";
	ws = new WebSocket(wsUrl);

	ws.onerror = function(e) {
	    App.vent.trigger("ws:error", e);
	    console.log("ws:error",e);
	};

	ws.onopen = function() {
	    App.vent.trigger("ws:connected");
	    console.log("ws:connected");
	};

	ws.onmessage = function(e) {
	    var data	= $.evalJSON(e.data);
	    var type	= data.type;
	    var content = data.content;
	    App.vent.trigger("ws:"+type, content);
	    console.log("ws:"+type, content);
	};

    }

    App.addInitializer(init_web_socket);

    App.vent.on("ws:connected", function(data) {
	console.log("ws:connected - triggered");
    });

    return App;
});

