angular.module('trello-clone').controller 'BoardListCtrl', ($meteor, $scope, $state) ->
  $scope.boards = []
  $scope.$meteorSubscribe('my-boards').then =>
    $scope.boards = $meteor.collection(Boards)

  $scope.showBoard = (id) =>
    $state.go 'boardsShow',
     id: id

  $scope.delete = (board) =>
    $meteor.call 'removeBoard', board._id
