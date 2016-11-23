var loginApp = angular.module("LoginApp", ['ngRoute'])
.config(['$routeProvider',
function($routeProvider){
	$routeProvider
	.when('/', {
        templateUrl: '/LoginPage.do',
        controller: "loginCtrl"
      })
      .when('/RegisterUser', {
        templateUrl: '/NewUserRegister.do',
        controller: "newUserRegisterCtrl"
      })
      .when('/ForgotPassword', {
        templateUrl: '/ForgotPassword.do',
        controller: "forgotPasswordCtrl"
      })
      .otherwise({redirectTo: '/'});
}]);