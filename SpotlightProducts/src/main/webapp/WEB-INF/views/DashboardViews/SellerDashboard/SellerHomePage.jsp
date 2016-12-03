<div class="container">
	<div class="row-height">
		<div role="alert" class="alert alert-danger"
				ng-class="{hideElement: !isAlert, showElement: isAlert}">
				<button type="button" class="close" aria-label="Close"
					ng-click="hideAlert()">
					<span aria-hidden="true">&times;</span>
				</button>
				{{alertMessage}}
			</div>
		<div class="row" ng-show="showCards">
			<div class="col-xs-4 col-md-4">
				<div class="col-xs-12 text-center">
					<div class="card">
						<div class="card-block">
							<h2 class="card-title">Seller Statistics</h2>
						</div>
						<a href="#" class="card-link"> <img
							src="http://www.clker.com/cliparts/k/4/Z/I/m/T/light-green-square-md.png"
							class="rounded float-xs-left"></a>
					</div>
				</div>
			</div>
			<div class="col-xs-4 col-md-4">
				<div class="col-xs-12 text-center">
					<div class="card">
						<div class="card-block">
							<h2 class="card-title">Low Stock Items</h2>
						</div>
						<a href="#" class="card-link"> <img
							src="http://www.clker.com/cliparts/U/D/B/J/j/R/red-square-md.png"
							class="rounded float-xs-left"></a>
					</div>
				</div>
			</div>
			<div class="col-xs-4 col-md-4">
				<div class="col-xs-12 text-center">
					<div class="card">
						<div class="card-block">
							<h2 class="card-title">Change Password</h2>
						</div>
						<a href="/ChangePassword" class="card-link"> <img
							src="http://www.clker.com/cliparts/Z/W/N/F/6/p/light-blue-square-md.png"
							class="rounded float-xs-left"></a>
					</div>
				</div>
			</div>
		</div>
		<!-- div ends for ROW -->
	</div>
</div>
<!-- /.container -->
<div class="container">

	<hr>

	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; SpotlightProducts.com 2016</p>
			</div>
		</div>
	</footer>

</div>
<!-- /.container -->