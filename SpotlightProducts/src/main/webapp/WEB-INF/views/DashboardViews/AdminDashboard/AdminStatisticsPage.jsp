<div role="alert" class="alert alert-danger"
	ng-class="{hideElement: !isAlert, showElement: isAlert}">
	<button type="button" class="close" aria-label="Close"
		ng-click="hideAlert()">
		<span aria-hidden="true">&times;</span>
	</button>
	{{alertMessage}}
</div>
<div id="chart_div" style="width: 900px; height: 500px"></div>