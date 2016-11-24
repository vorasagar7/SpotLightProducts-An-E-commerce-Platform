/*Controller for Login page*/
paymentApp.controller("paymentCtrl", function($scope, $location, $http){
	//$scope.referenceData = {}
	$scope.isAlert = false;
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	$scope.showAlert = function(){
		$scope.isALert = true;
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
});


