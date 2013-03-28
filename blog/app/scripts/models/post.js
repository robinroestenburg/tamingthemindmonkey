'use strict';

blog.factory('Post',
             ['$resource',
             function($resource) {

  return $resource(
      'http://localhost:port/posts/:postId',
      { port: ':3000', postId: '@id' },
      {
        'create':  { method: 'POST' },
        'index':   { method: 'GET', isArray: true },
        'update':  { method: 'PUT' },
        'destroy': { method: 'DELETE' }
      });

}]);
