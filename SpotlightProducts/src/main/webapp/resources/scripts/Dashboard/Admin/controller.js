adminDashboardApp.controller("AdminHomeCtrl", function($scope, $rootScope, $http, $location){
	$scope.isAlert = false;
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	$scope.showCards = false;
	var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/GetUniqueUserId');
	$http.get(url)
				.success(function(data, status, headers, config){
					$rootScope.userId = data.data[0];
					$scope.showCards = true;
				})
				.error(function(data, status, headers, config){
					$scope.alertMessage = "Technical Error. Please contact the customer service.";
					$scope.showAlert();
					$scope.showCards = false;
				});
})
adminDashboardApp.controller("AdminStatisticsCtrl", function($scope, $rootScope, $http, $location){
	$scope.isAlert = false;
	$scope.showAlert = function(){
		$scope.isAlert = true;
	}
	
	$scope.hideAlert = function(){
		$scope.isAlert = false;
	}
	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(drawCurveTypes);
	
	//var statisticsData = [];
	var url = $location.absUrl().replace(window.location.pathname + window.location.hash,'/AdminStatisticsUsersGraphGet');
	$http.get(url)
		.success(function(data, status, headers, config){
			$scope.statisticsData = data.data;
		})
		.error(function(data, status, headers, config){
			$scope.alertMessage = "Technical Error. Please contact the customer service.";
			$scope.showAlert();
		});
	
	
	function drawCurveTypes() {
	      var data = new google.visualization.DataTable();
	      data.addColumn('string', 'X');
	      data.addColumn('number', 'Users');
	      for(i = 0; i < $scope.statisticsData.length; i++){
	    	  data.addRow([$scope.statisticsData[i].month, $scope.statisticsData[i].totalValue]);
	      }
	      
	      /*data.addRows([
	        ["August", 0],    ["September", 10], ["October", 2], ["November", 5]
	      ]);*/

	      var options = {
	        hAxis: {
	          title: 'Months'
	        },
	        vAxis: {
	          title: 'Number of Users'
	        },
	        series: {
	          1: {curveType: 'function'}
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	      chart.draw(data, options);
	    }
})