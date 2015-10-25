angular.module('trello-clone').controller 'BoardShowCtrl', ($scope, $stateParams, $meteor, $modal) ->
  id = $stateParams.id
  $scope.board = {}
  $scope.lanes = []
  $scope.tasks = []
  $scope.$meteorSubscribe('board', id).then ->
    $scope.board = $scope.$meteorObject(Boards, id, no)
    $scope.lanes = $scope.$meteorCollection ->
      Lanes.find()
    , no
    $scope.tasks = $scope.$meteorCollection ->
      Tasks.find()
    , no

  $scope.addLane = =>
    $meteor.call 'insertLane', board: id

  $scope.addTask = (id) =>
    $meteor.call 'insertTask', task: 'do something', lane: id

  $scope.openTaskModal = (task) =>
    $modal.open
     templateUrl: 'client/app/tasks/views/modal-edit.ng.html'
     controller: 'TaskEditCtrl'
     resolve:
       task: ->
         _.clone task
