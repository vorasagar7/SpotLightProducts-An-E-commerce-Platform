var paymentApp = angular.module("PaymentApp", ['ngRoute'])
.config(['$routeProvider',
function($routeProvider){
	$routeProvider
	.when('/', {
        templateUrl: '/PaymentAddressPage.do',
        controller: "paymentAddressCtrl"
      })
      .when('/CardDetails', {
        templateUrl: '/PaymentCardPage.do',
        controller: "PaymentCardCtrl"
      })
      .when('/Confirmation', {
        templateUrl: '/ConfirmationPage.do',
        controller: "ThankYouCtrl"
      })
      .otherwise({redirectTo: '/'});
}]);