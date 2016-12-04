var shoppingCart = angular.module("ShoppingCartApp", []);
shoppingCart.controller("shoppingCartCtrl", function($scope, $location, $http, $timeout){
	$scope.isAlert = false;
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	$scope.totalPrice = 0;
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
								$scope.calculateTotal();
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
	$scope.calculateTotal = function(){
		$scope.totalPrice = 0;
		for(i = 0; i < $scope.userShoppingCart.length; i++){
			$scope.totalPrice += $scope.userShoppingCart[i].price*$scope.userShoppingCart[i].quantity;
		}
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
	
	
	$scope.updateUserCart = function(){
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash+window.location.search,'/ModifyUserCart');
		var data = [];
		for (i = 0; i < $scope.userShoppingCart.length; i++){
			if(!$scope.userShoppingCart[i].isDeleted){
				data.push($scope.userShoppingCart[i]);
			}
		}
		$http.post(url, data)
						.success(function(data, status, headers, config){
								if(data.status == "Success"){
									$scope.alertMessage = "Changes successfully modified.";
									$scope.showAlert();
									$scope.calculateTotal();
									//window.location.href = $location.absUrl().replace(window.location.pathname + window.location.hash+window.location.search,'/ShoppingCart');
								}
								else{
									$scope.alertMessage = "Technical Error. Please contact the customer service.";
									$scope.showAlert();
								}
							})
							.error(function(data, status, headers, config){
								$scope.alertMessage = "Technical Error. Please contact the customer service.";
								$scope.showAlert();
							})
	}
	
	$scope.checkOut = function(){
		window.location.href = $location.absUrl().replace(window.location.pathname + window.location.hash,'/PaymentPage');
	}
	
});