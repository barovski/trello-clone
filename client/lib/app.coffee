app = angular.module 'trello-clone', ['angular-meteor', 'ui.router']

app.config ($urlRouterProvider, $stateProvider, $locationProvider) ->
  $locationProvider.html5Mode(true);
  $stateProvider.state 'boards',
    url: '/'
    templateUrl: 'client/app/boards/views/list.ng.html'
    controller: 'BoardListCtrl'

  $urlRouterProvider.otherwise('/');
