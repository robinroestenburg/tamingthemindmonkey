'use strict';

taming.controller('BlogController', function($scope, Post) {

  $scope.posts = Post.query();

  $scope.removePost = function(post) {
    post.$destroy();
  };

});

taming.controller('PostController', function($scope, $location, $routeParams, Post) {

  var postId = $scope.postId = $routeParams.postId;

  $scope.post = { title: "", body: "" };
  var resource = Post.get({ postId: postId }, function() {
    $scope.post = resource.post;
  });

  $scope.updatePost = function() {
    // Update the post.
    resource.$update({postId: postId});

    // Redirect to index page.
    $location.url("/");
  };
});
