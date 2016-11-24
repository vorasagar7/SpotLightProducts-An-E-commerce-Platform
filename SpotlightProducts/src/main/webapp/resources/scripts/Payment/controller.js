/*Controller for Login page*/
paymentApp.controller("paymentAddressCtrl", function($scope, $location, $http, $rootScope){
	$scope.paymentDetails = $rootScope.paymentDetails ? $rootScope.paymentDetails : {};
	$scope.paymentDetails.country = "United States"
	$scope.isAlert = false;
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	
	var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/GetPaymentReferenceData');
	$http.get(url)
				.success(function(data, status, headers, config){
					if(data.status == "Success"){
						$scope.referenceData = data.data;
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
	
	$scope.submitPayment = function(){
		$scope.hideAlert();
		if($scope.paymentDetails.typeOfPayment == 12){
			var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/SaveUserOrder');
			var data = $scope.paymentDetails;
			$http.post(url, data)
						.success(function(data, status, headers, config){
							if(data.status == "Success"){
								$location.path("/Confirmation");
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
		else{
			$rootScope.paymentDetails = $scope.paymentDetails;
			$location.path('/CardDetails');
		}
	}
	
});


paymentApp.controller("PaymentCardCtrl", function($scope, $location, $http, $rootScope){
	$scope.isAlert = false;
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	$scope.finalPayment = function(){
		$scope.hideAlert();
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/SaveUserOrder');
		var data = $rootScope.paymentDetails;
		$http.post(url, data)
					.success(function(data, status, headers, config){
						if(data.status == "Success"){
							$location.path("/Confirmation");
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
	
	$scope.redirectPage = function(){
		$location.path('/');
	}
});

paymentApp.controller("ThankYouCtrl", function($scope, $location, $http){

});