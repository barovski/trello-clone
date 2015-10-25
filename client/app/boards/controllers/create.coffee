angular.module('trello-clone').controller 'BoardCreateCtrl', ($meteor, $scope, $rootScope, $state) ->
  $scope.name = ''
  $scope.submit = =>
    if $rootScope.currentUser
      $meteor.call('insertBoard', name: $scope.name).then ->
        $scope.name = ''
