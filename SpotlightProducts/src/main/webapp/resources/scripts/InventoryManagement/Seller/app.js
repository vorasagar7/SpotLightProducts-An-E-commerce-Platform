var inventoryManagementApp = angular.module("InventoryManagementApp",[])
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
	
	$scope.getSellerProducts = function(){
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/GetSellerInventoryProducts');
		$http.get(url)
				.success(function(data, status, headers, config){
					if(data.status == "Success"){
						if(data.data.length > 0){
							$scope.sellerProducts = data.data;
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
	
	var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/GetInventoryManagementReferenceList');
	$http.get(url)
			.success(function(data, status, headers, config){
				if(data.status = "Success"){
					$scope.referenceList = data.data;
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
	
	$scope.viewProduct = function(productId){
		window.location.href = $location.absUrl().replace(window.location.pathname + window.location.hash,'/ProductDetails?id=')+productId;
	}
	
	$scope.deleteProduct = function(productId){
		$scope.hideAlert();
		var url = 	$location.absUrl().replace(window.location.pathname + window.location.hash, '/POSTRemoveProduct');
		var data = {}
		for (i = 0; i < $scope.sellerProducts.length; i++){
			if($scope.sellerProducts[i].productId == productId){
				data = $scope.sellerProducts[i];
			}
		}
		$http.post(url, data)
							.success(function(data, status, headers, config){
								if(data.status == "Success"){
									for (i = 0; i < $scope.sellerProducts.length; i++){
										if($scope.sellerProducts[i].productId == productId){
											$scope.sellerProducts[i].isDeleted = true;
										}
									}
									$scope.alertMessage = "The Item was successfully deleted";
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
	
	$scope.updateChanges = function(){
		$scope.hideAlert();
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash+window.location.search,'/ProductSellerModify');
		var data = [];
		for (i = 0; i < $scope.sellerProducts.length; i++){
			if(!$scope.sellerProducts[i].isDeleted){
				data.push($scope.sellerProducts[i]);
			}
		}
		$http.post(url, data)
						.success(function(data, status, headers, config){
								if(data.status == "Success"){
									$scope.alertMessage = "Changes successfully modified.";
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
							})
	}
	
	$scope.saveProduct = function(){
		$scope.hideAlert();
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash+window.location.search,'/PostAddProduct');
		var data = $scope.product;
		$http.post(url, data)
				.success(function(data, status, headers, config){
					if(data.status == "Success"){
						$scope.alertMessage = "Product added successfully";
						$scope.showAlert("Success");
						$('#addProductModal').modal('hide');
						$timeout(function(){
							location.reload();
						}, 1000);
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
	}
	
})