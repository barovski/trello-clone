angular.module('trello-clone').controller 'BoardCreateCtrl', ($meteor, $scope, $state) ->
  $scope.name = ''
  $scope.submit = =>
    $meteor.call('insertBoard', name: $scope.name).then ->
      $scope.name = ''
