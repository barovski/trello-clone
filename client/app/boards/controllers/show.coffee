angular.module('trello-clone').controller 'BoardShowCtrl', ($scope, $stateParams, $meteor) ->
  id = $stateParams.id
  $scope.board = {}
  $scope.lanes = []
  $scope.tasks = []
  $scope.$meteorSubscribe('board', id).then ->
    $scope.board = $scope.$meteorObject(Boards, id, no)
    $scope.lanes = $scope.$meteorCollection ->
      Lanes.find()
    $scope.tasks = $scope.$meteorCollection ->
      Tasks.find()

  $scope.addLane = =>
    $meteor.call 'insertLane', board: id

  $scope.addTask = (id) =>
    $meteor.call 'insertTask', task: 'do something', lane: id
