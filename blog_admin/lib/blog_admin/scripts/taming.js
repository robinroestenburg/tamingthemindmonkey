'use strict';

var taming =
  angular
    .module('taming', ['ngResource'])
    .config(['$routeProvider', function($routeProvider) {
      $routeProvider
        .when('/', { templateUrl: 'views/blog.html' })
        .when('/posts/:postId', { templateUrl: 'views/post.html', controller: 'PostController' });

      $routeProvider.otherwise({ redirectTo: '/' });
    }]);
