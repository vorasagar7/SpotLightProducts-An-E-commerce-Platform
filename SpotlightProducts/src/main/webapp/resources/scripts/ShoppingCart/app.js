var shoppingCart = angular.module("ShoppingCartApp", []);
shoppingCart.controller("shoppingCartCtrl", function($scope, $location, $http, $timeout){
	$scope.isAlert = false;
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	var url = 	$location.absUrl().replace(window.location.pathname + window.location.hash, '/GetUserId');
	$http.get(url)
				.success(function(data, status, headers, config){
					$scope.username = data.data[0];
					$scope.fetchUserCart();
				})
				.error(function(data, status, headers, config){
					$scope.alertMessage = "Technical Error. Please contact the customer service.";
					$scope.showAlert();
				});
	
	$scope.fetchUserCart = function(){
		var url = 	$location.absUrl().replace(window.location.pathname + window.location.hash, '/ViewShoppingCart');
		$http.get(url)
					.success(function(data, status, headers, config){
							$scope.userShoppingCart = {};
							if(data.data.length > 0){
								$scope.userShoppingCart = data.data;
								$scope.isCartEmpty = false;
								$scope.totalPrice = 0;
								for(i = 0; i < $scope.userShoppingCart.length; i++){
									$scope.totalPrice += $scope.userShoppingCart[i].price;
								}
							}
							else{
								$scope.isCartEmpty = true;
							}
						})
						.error(function(data, status, headers, config){
							$scope.alertMessage = "Technical Error. Please contact the customer service.";
							$scope.showAlert();
						});	
	}
	
	$scope.redirectToHome = function(){
		window.location.href = $location.absUrl().replace(window.location.pathname + window.location.hash, '/homepage');
	}
	
	$scope.deleteCartItem = function(cartId){
		$scope.hideAlert();
		var url = 	$location.absUrl().replace(window.location.pathname + window.location.hash, '/DeleteCartItem');
		var data = {}
		for (i = 0; i < $scope.userShoppingCart.length; i++){
			if($scope.userShoppingCart[i].cartId == cartId){
				data = $scope.userShoppingCart[i];
			}
		}
		$http.post(url, data)
							.success(function(data, status, headers, config){
								if(data.status == "Success"){
									for (i = 0; i < $scope.userShoppingCart.length; i++){
										if($scope.userShoppingCart[i].cartId == cartId){
											$scope.userShoppingCart[i].isDeleted = true;
										}
									}
									$scope.alertMessage = "The Item was successfully deleted";
									$scope.showAlert();
									$timeout(function(){
										$scope.hideAlert();
										console.log(cartId);
									}, 3000)
								}
								else{
									$scope.alertMessage = "Technical Error. Please contact the customer service.";
									$scope.showAlert();
								}
							})
							.error(function(data, status, headers, config){
								$scope.alertMessage = "Technical Error. Please contact the customer service.";
								$scope.showAlert();
							});
	}
	
});