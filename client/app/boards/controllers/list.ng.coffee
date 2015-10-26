angular.module('trello-clone').controller 'BoardListCtrl', ($meteor, $scope, $state, $rootScope) ->
  $scope.boards = []
  $scope.subscription = stop: ->
  $scope.$watch ->
    $rootScope.currentUser
  , (id) ->
    console.log id
    if _.isNull(id)
      $scope.subscription.stop()
    else
      $scope.$meteorSubscribe('my-boards').then =>
        $scope.boards = $meteor.collection(Boards)

  $scope.showBoard = (id) =>
    $state.go 'boardsShow',
     id: id

  $scope.delete = (board) =>
    $meteor.call 'removeBoard', board._id
