var ChangePasswordApp = angular.module("ChangePasswordApp", ['ngRoute'])
.config(['$routeProvider',
function($routeProvider){
	$routeProvider
	.when('/', {
        templateUrl: '/ChangeUserPassword.do',
        controller: "ChangeUserPassword"
      })
}]);