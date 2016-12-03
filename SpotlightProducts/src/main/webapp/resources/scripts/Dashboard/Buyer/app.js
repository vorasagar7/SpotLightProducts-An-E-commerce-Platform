var buyerDashboardApp = angular.module("BuyerDashboardApp", ['ngRoute'])
.config(['$routeProvider',
function($routeProvider){
	$routeProvider
	.when('/', {
        templateUrl: '/BuyerHomePage.do',
        controller: "BuyerHomeCtrl"
      })
      .when('/OrderHistory', {
        templateUrl: '/OrderHistoryPage.do',
        controller: "OrderHistoryCtrl"
      })
      .when('/UserReviewHistory', {
        templateUrl: '/UserReviewHistory.do',
        controller: "UserReviewHistoryCtrl"
      })
      .otherwise({redirectTo: '/'});
}]);