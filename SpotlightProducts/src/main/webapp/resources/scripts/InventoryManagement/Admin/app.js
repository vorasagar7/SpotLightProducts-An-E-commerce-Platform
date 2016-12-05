var inventoryManagementApp = angular.module("InventoryManagementApp",[]);
inventoryManagementApp.controller("InventoryManagementCtrl", function($scope,$location,$http, $rootScope, $timeout){
	$scope.hideElement = true;
	$scope.showSuccessAlert = false;
	$scope.showDangerAlert = false;
	
	$scope.hideAlert = function(){
		$scope.hideElement = true;
		$scope.showSuccessAlert = false;
		$scope.showDangerAlert = false;
	}
	
	$scope.showAlert = function(status){
		if(status == "Success"){
			$scope.hideElement = false;
			$scope.showSuccessAlert = true;
			$scope.showDangerAlert = false;
		}
		else{
			$scope.hideElement = false;
			$scope.showSuccessAlert = false;
			$scope.showDangerAlert = true;
		}
	}
	$scope.showTable = false;
	
	var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/PendingProductsForApprovalGet');
	$http.get(url)
			.success(function(data, status, headers, config){
				if(data.status == "Success"){
					if(data.data.length > 0){
						$scope.adminAllSellerProducts = data.data;
						$scope.showTable = true;
						$scope.isEmpty = false;
					}
					else{
						$scope.isEmpty = true;
					}
					
					
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
	
	
	$scope.approveProduct = function(productId){
		$scope.hideAlert();
		var url = 	$location.absUrl().replace(window.location.pathname + window.location.hash, '/ApproveProduct');
		var data = {}
		for (i = 0; i < $scope.adminAllSellerProducts.length; i++){
			if($scope.adminAllSellerProducts[i].productId == productId){
				data = $scope.adminAllSellerProducts[i];
			}
		}
		$http.post(url, data)
							.success(function(data, status, headers, config){
								if(data.status == "Success"){
									for (i = 0; i < $scope.adminAllSellerProducts.length; i++){
										if($scope.adminAllSellerProducts[i].productId == productId){
											$scope.adminAllSellerProducts[i].isApproved = true;
										}
									}
									$scope.alertMessage = "The Item was successfully appproved";
									$scope.showAlert("Success");
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
	
	
	$scope.rejectProduct = function(productId){
		$scope.hideAlert();
		var url = 	$location.absUrl().replace(window.location.pathname + window.location.hash, '/RejectPendingProduct');
		var data = {}
		for (i = 0; i < $scope.adminAllSellerProducts.length; i++){
			if($scope.adminAllSellerProducts[i].productId == productId){
				data = $scope.adminAllSellerProducts[i];
			}
		}
		$http.post(url, data)
							.success(function(data, status, headers, config){
								if(data.status == "Success"){
									for (i = 0; i < $scope.adminAllSellerProducts.length; i++){
										if($scope.adminAllSellerProducts[i].productId == productId){
											$scope.adminAllSellerProducts[i].isDeleted = true;
										}
									}
									$scope.alertMessage = "The Item was successfully rejected";
									$scope.showAlert("Success");
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
});