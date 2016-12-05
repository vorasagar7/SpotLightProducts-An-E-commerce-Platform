var customerSupportApp = angular.module("CustomerSupportApp", []);
customerSupportApp.controller("customerSupportCtrl", function($scope, $location, $timeout){
	$scope.alertDisplay = false;
	$scope.submitQuery = function(){
		$scope.alertDisplay = true;
		$timeout(function(){
			var url = $location.absUrl().replace('/CustomerSupport','/homepage');
			window.location.href = url;
		},3000);
	}
});