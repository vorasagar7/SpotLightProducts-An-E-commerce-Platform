var sellerDashboardApp = angular.module("SellerDashboardApp",['ngRoute'])
.config(['$routeProvider',
	function($routeProvider){
		$routeProvider
		.when('/', {
	        templateUrl: '/SellerHomePage.do',
	        controller: "SellerHomeCtrl"
	      })
	      .when('/LowStockItems', {
	        templateUrl: '/SellerLowStockPage.do',
	        controller: "SellerLowStockPageCtrl"
	      })
	      .when('/SellerStatistics', {
	        templateUrl: '/SellerStatisticsPage.do',
	        controller: "SellerStatisticsCtrl"
	      })
	      .otherwise({redirectTo: '/'});
	}]);