<div role="alert" class="alert alert-danger"
	ng-class="{hideElement: !isAlert, showElement: isAlert}">
	<button type="button" class="close" aria-label="Close"
		ng-click="hideAlert()">
		<span aria-hidden="true">&times;</span>
	</button>
	{{alertMessage}}
</div>

<div class="seller-statistics">The total revenue generated is: {{sellerRevenue || 0}}</div>

<div class="chart-element"><button class="btn btn-primary" ng-click="redirectToDashboardHome()">Back to Dashboard</button></div>