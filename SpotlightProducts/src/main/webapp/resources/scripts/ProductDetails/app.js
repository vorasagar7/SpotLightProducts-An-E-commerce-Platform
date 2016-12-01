var productDetailsApp = angular.module("ProductDetailsApp",[])
productDetailsApp.controller("ProductDetailsCtrl", function($scope, $location, $http){
	$scope.isAlert = false;
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	$scope.productId = parseInt(location.search.split("=")[1]);
	var url = $location.absUrl().replace(window.location.pathname + window.location.hash+window.location.search,'/GetProductById?id=')+$scope.productId;
	$http.get(url)
				.success(function(data, status, headers, config){
					if(data.status == "Success"){
						$scope.productDetails = data.data[0];
						$scope.productReviews = $scope.productDetails.productReviews;
						$scope.productSellers = []
						$scope.productQuantity = 0;
						for(i = 0; i < data.data.length; i++){
							$scope.productSellers.push({sellerId: data.data[i].sellerId, sellerName: data.data[i].sellerName, price: data.data[i].price, quantity: data.data[i].quantity});
							$scope.productQuantity += data.data[i].quantity;
						}
						$scope.inStock = !$scope.productQuantity ? "Sold Out" : "In Stock";
						$scope.productRating = 0;
						for(i = 0; i < $scope.productReviews.length; i++){
							$scope.productRating+=$scope.productReviews[i].rating;
						}
						$scope.productRating = $scope.productRating * (1.0/$scope.productReviews.length)
						$scope.productRating = Math.round($scope.productRating * 100)/100;
					}
					else{
						$scope.alertMessage = data.message;
						$scope.showAlert();
					}
				})
				.error(function(data, status, headers, config){
					$scope.alertMessage = "Technical Error. Please contact the customer service.";
					$scope.showAlert();
				})
				
	$scope.redirectToReview = function(){
		window.location.href = $location.absUrl().replace(window.location.pathname + window.location.hash+window.location.search,'/ProductUserReview?productId='+$scope.productId);
	}
	
	$scope.addToCart = function(sellerId, price){
		var data = {};
		data.sellerId = sellerId;
		data.price = price;
		data.quantity = 1;
		data.productId = $scope.productId;
		data.cartId = -999;
		dataArray = [data];
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash+window.location.search,'/ModifyUserCart');
		$http.post(url, dataArray)
							.success(function(data, status, headers, config){
								if(data.status == "Success"){
									window.location.href = $location.absUrl().replace(window.location.pathname + window.location.hash+window.location.search,'/ShoppingCart');
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
})