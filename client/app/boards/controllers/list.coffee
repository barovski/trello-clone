angular.module('trello-clone').controller 'BoardListCtrl', ($meteor, $scope) ->
  $scope.boards = []
  $scope.$meteorSubscribe('my-boards').then ->
    $scope.boards = $meteor.collection(Boards)
