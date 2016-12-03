<!-- View Orders-->
<div class="container">
	<div class="row">
		<div class="col-md-4">

			<div class="card">
				<div class="card-block">
					<h2 class="card-title">View Orders</h2>
				</div>
				<a ng-href="#/{{'OrderHistory'}}" class="card-link"> <img
					src="http://www.clker.com/cliparts/9/q/S/7/c/D/light-yellow-square-md.png"
					class="rounded float-xs-left"></a>
				<div class="card-block"></div>
			</div>



		</div>
	</div>



</div>


<br />
<br />
<br />
<br />

<div class="container">

	<div class="row">
		<div class="col-md-4">

			<div class="card">
				<div class="card-block">
					<h2 class="card-title">View User Ratings</h2>
				</div>
				<a href="#/{{'UserReviewHistory'}}" class="card-link"> <img
					src="http://www.clker.com/cliparts/w/x/m/w/d/D/green-square-md.png"
					class="rounded float-xs-left"></a>
				<div class="card-block"></div>
			</div>

		</div>
	</div>



</div>

<br />
<br />
<br />
<br />

<!--Settings-->
<div class="container">
	<div class="row">
		<div class="col-md-offset-4 col-md-4">
			<div role="alert" class="alert alert-danger"
				ng-class="{hideElement: !isAlert, showElement: isAlert}">
				<button type="button" class="close" aria-label="Close"
					ng-click="hideAlert()">
					<span aria-hidden="true">&times;</span>
				</button>
				{{alertMessage}}
			</div>
		</div>
	</div>
</div>
<div ng-show="showCards">
	<div class="container">

		<div class="row">
			<div class="col-md-8">

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

	<br /> <br /> <br /> <br />

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
</div>
<!-- /.container -->