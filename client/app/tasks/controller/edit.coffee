angular.module('trello-clone').controller 'TaskEditCtrl', ($scope, $meteor, $modalInstance, task, lanes) ->
  $scope.task = task
  $scope.lane = task.lane
  $scope.lanes = lanes
  $scope.save = =>
    task =
      _id:  $scope.task._id
      task: $scope.task.task
      lane: $scope.lane
    $meteor.call('updateTask', task).then ->
      $scope.close()
      
  $scope.close = =>
    $modalInstance.close()
