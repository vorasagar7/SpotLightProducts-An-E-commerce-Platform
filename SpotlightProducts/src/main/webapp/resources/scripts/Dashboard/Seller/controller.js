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


sellerDashboardApp.controller("SellerStatisticsCtrl", function($scope, $http, $location, $rootScope){
	$scope.isAlert = false;
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	
	$scope.getSellerStatistics = function(){
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/SellerStatisticsGet?sellerId='+$rootScope.userId);
		$http.get(url)
				.success(function(data, status, headers, config){
					if(data.status == "Success"){
						$rootScope.sellerRevenue = data.data[0];
					}
					else{
						$scope.alertMessage = data.message;
						$scope.showAlert();
					}
				})
				.error(function(data, status, headers, config){
					$scope.alertMessage = "Technical Error. Please contact the customer service.";
					$scope.showAlert();
				});
	}
	
	
	if(!$rootScope.userId){
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/GetUniqueUserId');
		$http.get(url)
					.success(function(data, status, headers, config){
						if(data.status == "Success"){
							$rootScope.userId = data.data[0];
							$scope.getSellerStatistics();
						}
						else{
							$scope.alertMessage = data.message;
							$scope.showAlert();
						}
						
					})
					.error(function(data, status, headers, config){
						$scope.alertMessage = "Technical Error. Please contact the customer service.";
						$scope.showAlert();
					});
	}
	else{
		$scope.getSellerStatistics();
	}
	
	$scope.redirectToDashboardHome = function(){
		$location.path('/');
	}
	
})