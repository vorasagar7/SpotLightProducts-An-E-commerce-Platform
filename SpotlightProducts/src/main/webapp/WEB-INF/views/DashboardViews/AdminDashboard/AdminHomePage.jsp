<div class="container">

	<div class="row" ng-show="showCards">
		<div role="alert" class="alert alert-danger"
			ng-class="{hideElement: !isAlert, showElement: isAlert}">
			<button type="button" class="close" aria-label="Close"
				ng-click="hideAlert()">
				<span aria-hidden="true">&times;</span>
			</button>
			{{alertMessage}}
		</div>
		<div class=" col-xs-offset-4 col-xs-4 col-md-offset-0 col-md-4">

			<div class="card">
				<div class="card-block">
					<h2 class="card-title">SpotLightProducts Statistics</h2>
				</div>
				<a href="#" class="card-link"> <img
					src="http://www.clker.com/cliparts/d/F/Q/R/g/d/maroon-square-md.png"
					class="rounded float-xs-left"></a>
				<div class="card-block"></div>
			</div>



		</div>
		<div class="col-xs-offset-4 col-xs-4 col-md-offset-0 col-md-4">

			<div class="card">
				<div class="card-block">
					<h2 class="card-title">Administrator Actions</h2>
				</div>
				<a href="#" class="card-link"> <img
					src="http://www.clker.com/cliparts/4/u/l/C/i/P/lime-square-md.png"
					class="rounded float-xs-left"></a>
				<div class="card-block"></div>
			</div>

		</div>

		<div class="col-xs-offset-4 col-xs-4 col-md-offset-0 col-md-4">

			<div class="card">
				<div class="card-block">
					<h2 class="card-title">Change Password</h2>
				</div>
				<a href="/ChangePassword" class="card-link"> <img
					src="http://www.clker.com/cliparts/Z/W/N/F/6/p/light-blue-square-md.png"
					class="rounded float-xs-left"></a>
				<div class="card-block"></div>
			</div>

		</div>
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
