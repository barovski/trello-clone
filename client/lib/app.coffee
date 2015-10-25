app = angular.module 'trello-clone', ['angular-meteor', 'ui.router']

app.config ($urlRouterProvider, $stateProvider, $locationProvider) ->
  $locationProvider.html5Mode(true);
  $stateProvider
    .state 'boardsList',
      url: '/'
      templateUrl: 'client/app/boards/views/list.ng.html'
      controller: 'BoardListCtrl'
    .state 'boardsCreate',
      url: '/create'
      templateUrl: 'client/app/boards/views/create.ng.html'
      controller: 'BoardCreateCtrl'

  $urlRouterProvider.otherwise('/');
