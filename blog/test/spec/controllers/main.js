'use strict';

describe('Controller: PostController', function () {

  // load the controller's module
  beforeEach(module('blog'));

  var PostController,
      scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller) {
    scope = {};
    PostController = $controller('PostController', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
