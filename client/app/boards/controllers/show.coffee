angular.module('trello-clone').controller 'BoardShowCtrl', ($scope, $stateParams, $meteor) ->
  id = $stateParams.id
  $scope.board = {}
  $scope.lanes = []
  $scope.$meteorSubscribe('board', id).then ->
    $scope.board = $scope.$meteorObject(Boards, id, no)
    $scope.lanes = $scope.$meteorCollection ->
      Lanes.find()

  $scope.addLane = =>
    $meteor.call 'insertLane', board: id
