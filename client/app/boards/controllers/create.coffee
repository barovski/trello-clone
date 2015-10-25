angular.module('trello-clone').controller 'BoardCreateCtrl', ($meteor, $scope, $state) ->
  $scope.name = ''
  $scope.submit = =>
    board =
      name: $scope.name

    $meteor.call('insertBoard', board).then ->
      $state.go 'boardsList'
    , (err) ->
      console.log(err)
