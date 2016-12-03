var adminDashboardApp = angular.module("AdminDashboardApp", ['ngRoute'])
.config(['$routeProvider',
	function($routeProvider){
		$routeProvider
		.when('/', {
	        templateUrl: '/AdminHomePage.do',
	        controller: "AdminHomeCtrl"
	      })
	      .when('/AdminActions', {
	        templateUrl: '/AdminActionsPage.do',
	        controller: "AdminActionsCtrl"
	      })
	      .otherwise({redirectTo: '/'});
	}]);