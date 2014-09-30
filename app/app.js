(function(){
	'use strict';

	angular.module('space-bot-war-client', [ 'ngRoute','space-bot-war-client-main','templates' ])
	  .config(function ($routeProvider) {
	    $routeProvider
	      .otherwise({
	        redirectTo: '/'
	      });
	  });
	  
})();