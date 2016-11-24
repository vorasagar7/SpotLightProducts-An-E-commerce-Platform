/*Controller for Login page*/
loginApp.controller("loginCtrl", function($scope, $location, $http){
	$scope.isInvalidCredentials = false;
	
	$scope.showAlert = function(){
		$scope.isInvalidCredentials = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isInvalidCredentials = false;
	}
	
	$scope.registerUser = function(){
		$location.path('/RegisterUser');
	};
	
	$scope.signIn = function(){
		$scope.hideAlert();
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/AuthenticateUser');
		var data = $scope.user;
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


/*Controller for Register User*/
loginApp.controller("newUserRegisterCtrl", function($scope, $location, $http){
	$scope.isAlert = false;
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	$scope.saveUserDetails = function(){
		$scope.hideAlert();
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash, '/PostUserDetails');
		var data = $scope.registerUser;
		$http.post(url, data)
					.success(function(data, status, headers, config){
						if(data.status == "Success"){
							$location.path('/');
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
});

/*Controller for Forgot Password*/
loginApp.controller("forgotPasswordCtrl", function($scope, $location, $timeout, $http){
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
	
	$scope.sendUserPassword = function(){
		$scope.hideAlert();
		var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/GetUserPassword');
		var data = $scope.forgotPassword;
		$http.post(url, data)
					.success(function(data, status, headers, config){
						if(data.status == "Success"){
							$scope.alertMessage = data.message;
							$scope.showAlert("Success");
							$timeout(function(){
								$location.path('/');
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
});