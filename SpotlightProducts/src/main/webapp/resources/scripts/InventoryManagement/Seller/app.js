var inventoryManagementApp = angular.module("InventoryManagementApp",[])
inventoryManagementApp.controller("InventoryManagementCtrl", function($scope,$location,$http, $rootScope){
	$scope.isAlert = false;
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	
	$scope.showTable = false;
	
	$scope.getSellerProducts = function(){
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/GetSellerInventoryProducts');
		$http.get(url)
				.success(function(data, status, headers, config){
					if(data.status == "Success"){
						$scope.sellerProducts = data.data;
						$scope.showTable = true;
					}
					else{
						$scope.showTable = false;
						$scope.alertMessage = data.message;
						$scope.showAlert();
					}
					
				})
				.error(function(data, status, headers, config){
					$scope.alertMessage = "Technical Error. Please contact the customer service.";
					$scope.showAlert();
					$scope.showTable = false;
				});
	}
	
	var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/GetUniqueUserId');
	$http.get(url)
				.success(function(data, status, headers, config){
					$rootScope.userId = data.data[0];
					$scope.showTable = true;
					$scope.getSellerProducts();
				})
				.error(function(data, status, headers, config){
					$scope.alertMessage = "Technical Error. Please contact the customer service.";
					$scope.showAlert();
					$scope.showTable = false;
				});
	
	$scope.viewProduct = function(productId){
		window.location.href = $location.absUrl().replace(window.location.pathname + window.location.hash,'/ProductDetails?id=')+productId;
	}
})