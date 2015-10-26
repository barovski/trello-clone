angular.module('trello-clone').controller 'LaneEditCtrl', ($scope, $meteor, $modalInstance, lane) ->
  $scope.lane = lane
  $scope.save = =>
    lane = _.pick lane, '_id', 'name'
    $meteor.call('updateLane', lane).then $scope.close

  $scope.close = =>
    $modalInstance.close()

  $scope.delete = =>
    $meteor.call('removeLane', lane._id).then $scope.close
