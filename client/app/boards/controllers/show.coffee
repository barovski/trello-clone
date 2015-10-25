angular.module('trello-clone').controller 'BoardShowCtrl', ($scope, $stateParams) ->
  id = $stateParams.id
  $scope.board = $scope.$meteorObject(Boards, id, no).subscribe('board', id)
