var productDetailsApp = angular.module("ProductDetailsApp",[])
productDetailsApp.controller("ProductDetailsCtrl", function($scope, $location, $http){
	$scope.isAlert = false;
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	var idParam = parseInt(location.search.split("=")[1]);
	console.log(idParam);
	var url = $location.absUrl().replace(window.location.pathname + window.location.hash+window.location.search,'/GetProductById?id=')+idParam ;
	$http.get(url)
				.success(function(data, status, headers, config){
					if(data.status == "Success"){
						console.log(data.data);
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
})