var paymentApp = angular.module("PaymentApp", ['ngRoute'])
.config(['$routeProvider',
function($routeProvider){
	$routeProvider
	.when('/', {
        templateUrl: '/PaymentAddressPage.do',
        controller: "paymentCtrl"
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