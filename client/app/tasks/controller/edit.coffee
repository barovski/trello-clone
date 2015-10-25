angular.module('trello-clone').controller 'TaskEditCtrl', ($scope, $meteor, $modalInstance, task) ->
  $scope.task = task
  $scope.save = =>
    $meteor.call('updateTask', _.pick(task, '_id', 'task', 'lane')).then ->
      $modalInstance.close()
