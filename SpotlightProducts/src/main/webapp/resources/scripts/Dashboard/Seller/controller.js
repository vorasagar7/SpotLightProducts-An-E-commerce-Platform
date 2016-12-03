sellerDashboardApp.controller("SellerHomeCtrl", function($scope, $http, $location, $rootScope){
	$scope.isAlert = false;
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	$scope.showCards = false;
	var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/GetUniqueUserId');
	$http.get(url)
				.success(function(data, status, headers, config){
					$rootScope.userId = data.data[0];
					$scope.showCards = true;
				})
				.error(function(data, status, headers, config){
					$scope.alertMessage = "Technical Error. Please contact the customer service.";
					$scope.showAlert();
					$scope.showCards = false;
				});
})