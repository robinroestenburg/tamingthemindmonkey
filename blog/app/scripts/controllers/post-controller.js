'use strict';

blog.controller('PostController',
                ['$scope',
                 'Post',
                function ($scope,
                          Post) {

  $scope.posts = Post.query();

}]);
