'use strict';

var blog = angular.module('blog', ['ngResource']);

blog.config(function ($routeProvider) {

  $routeProvider.when('/', {
    templateUrl: 'views/main.html',
    controller: 'PostController'
  })

  $routeProvider.otherwise({
    redirectTo: '/'
  });

});
