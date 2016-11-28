/*Controller for ChangePassword page*/
ChangePasswordApp.controller("ChangeUserPassword", function($scope, $location, $http){ alert("controller");
	$scope.isInvalidCredentials = false;
	
	$scope.showAlert = function(){
		$scope.isInvalidCredentials = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isInvalidCredentials = false;
	}
	
	$scope.ChangeUserPassword = function(){ 
		
		$scope.hideAlert();
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/PostChangePassword');
		var data = $scope.User;
		alert(url);
		alert(data);
		$http.post(url, data)
					.success(function(data, status, headers, config){
						if(data.status == "Success"){
							window.location.href = $location.absUrl().replace(window.location.pathname + window.location.hash, '/homepage');
						}
						else{
							$scope.alertMessage = "Invalid Credentials. Please try again.";
							$scope.showAlert();
						}
					})
					.error(function(data, status, headers, config){
						$scope.alertMessage = "Technical Error. Please contact the customer service.";
						$scope.showAlert();
					})
	}
});