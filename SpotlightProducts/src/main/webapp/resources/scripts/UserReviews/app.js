var userReviewApp = angular.module("UserReviewApp",[]);

userReviewApp.controller("UserReviewCtrl", function($scope, $location, $http, $timeout){
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
	$scope.productId = parseInt(location.search.split("=")[1]);
	$scope.submitReview = function(){
		$scope.hideAlert();
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash+window.location.search,'/PostUserReview');
		var data = {};
		data.productId = $scope.productId;
		data.productReviews = []
		data.productReviews.push($scope.review)
		$http.post(url, data)
						.success(function(data, status, headers, config){
						if(data.status == "Success"){
							$scope.alertMessage = data.message;
							$scope.showAlert("Success");
							$timeout(function(){
								window.location.href = $location.absUrl().replace(window.location.pathname + window.location.hash + window.location.search, '/ProductDetails?id=' + $scope.productId);
							},3000);
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