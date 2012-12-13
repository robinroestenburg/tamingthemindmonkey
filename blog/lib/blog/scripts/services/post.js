'use strict';

taming.factory('Post', function($resource) {

  return $resource('/posts/:postId', { postId: '@id' },
    {
      'create':  { method: 'POST' },
      'index':   { method: 'GET', isArray: true },
      'update':  { method: 'PUT' },
      'destroy': { method: 'DELETE' }
    });

});
