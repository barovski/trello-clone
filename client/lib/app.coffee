app = angular.module 'trello-clone', ['angular-meteor', 'ui.router', 'ui.bootstrap']

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
    .state 'boardsShow',
      url: '/show/:id'
      templateUrl: 'client/app/boards/views/show.ng.html'
      controller: 'BoardShowCtrl'

  $urlRouterProvider.otherwise('/');
