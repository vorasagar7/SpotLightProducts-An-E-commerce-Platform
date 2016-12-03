buyerDashboardApp.controller("BuyerHomeCtrl", function($scope, $location, $http, $rootScope){
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

buyerDashboardApp.controller("OrderHistoryCtrl", function($scope, $location, $http, $rootScope){
	$scope.orderEmpty = "No orders to show.";
	$scope.isAlert = false;
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	$scope.showOrderTable = false;
	$scope.getUserOrder = function(){
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/UserOrderGET?userId=')+$rootScope.userId;
		$http.get(url)
						.success(function(data, status, headers, config){
							if(data.status == "Success"){
								$scope.showOrderTable = true;
								$scope.OrderHistory = data.data;
								if(!$scope.OrderHistory.length){
									$scope.isOrderEmpty = true;
								}
								else{
									$scope.isOrderEmpty = false;
								}
							}
							else{
								$scope.alertMessage = data.message;
								$scope.showAlert();
								$scope.showOrderTable = false;
							}
							
							
						})
						.error(function(data, status, headers, config){
							$scope.alertMessage = "Technical Error. Please contact the customer service.";
							$scope.showAlert();
							$scope.showOrderTable = false;
						});
	}
	if(!$rootScope.userId){
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/GetUniqueUserId');
		$http.get(url)
					.success(function(data, status, headers, config){
						$rootScope.userId = data.data[0];
						$scope.showOrderTable = true;
						$scope.getUserOrder();
					})
					.error(function(data, status, headers, config){
						$scope.alertMessage = "Technical Error. Please contact the customer service.";
						$scope.showAlert();
						$scope.showOrderTable = false;
					});
	}
	else{
		$scope.getUserOrder();
	}
	
	$scope.viewProduct = function(productId){
		window.location.href = $location.absUrl().replace(window.location.pathname + window.location.hash,'/ProductDetails?id=')+productId;
	}
	
	
})

buyerDashboardApp.controller("UserReviewHistoryCtrl", function($scope, $location, $http, $rootScope){
	$scope.reviewEmpty = "No review to show.";
	$scope.isAlert = false;
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	$scope.showReviewTable = false;
	$scope.getUserReview = function(){
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/UserReviewsGET?userId=')+$rootScope.userId;
		$http.get(url)
						.success(function(data, status, headers, config){
							if(data.status == "Success"){
								$scope.showReviewTable = true;
								$scope.ReviewHistory = data.data;
								if(!$scope.ReviewHistory.length){
									$scope.isReviewEmpty = true;
								}
								else{
									$scope.isReviewEmpty = false;
								}
							}
							else{
								$scope.alertMessage = data.message;
								$scope.showAlert();
								$scope.showReviewTable = false;
							}
							
							
						})
						.error(function(data, status, headers, config){
							$scope.alertMessage = "Technical Error. Please contact the customer service.";
							$scope.showAlert();
							$scope.showReviewTable = false;
						});
	}
	if(!$rootScope.userId){
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/GetUniqueUserId');
		$http.get(url)
					.success(function(data, status, headers, config){
						$rootScope.userId = data.data[0];
						$scope.showReviewTable = true;
						$scope.getUserReview();
					})
					.error(function(data, status, headers, config){
						$scope.alertMessage = "Technical Error. Please contact the customer service.";
						$scope.showAlert();
						$scope.showReviewTable = false;
					});
	}
	else{
		$scope.getUserReview();
	}
	
})