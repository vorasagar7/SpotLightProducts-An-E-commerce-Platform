<!--View User Ratings-->
<div class="container">

	<div class="row">
		<div class="col-md-9">
			<div role="alert" class="alert alert-danger"
				ng-class="{hideElement: !isAlert, showElement: isAlert}">
				<button type="button" class="close" aria-label="Close"
					ng-click="hideAlert()">
					<span aria-hidden="true">&times;</span>
				</button>
				{{alertMessage}}
			</div>
			<div ng-show="showReviewTable">
				<h2>View User Ratings</h2>
				<h4>Most Recent Ratings</h4>
				<div ng-show="isReviewEmpty">{{reviewEmpty}}</div>
				<table class="table table-striped" ng-hide="isReviewEmpty">

					<thead>
						<tr>
							<th>Publish Date</th>
							<th>Comment</th>
							<th>Rating</th>
							<th>Product Name</th>
							<th>Model ID</th>
							<th>Brand Name</th>
						</tr>
					</thead>
					<!-- These are the seller's product -->
					<tbody>
						<tr ng-repeat="review in ReviewHistory" class="review-row">
							<th scope="row">{{review.modifiedOn}}</th>
							<td>{{review.comment}}</td>
							<td>{{review.rating}}</td>
							<td>{{review.productName}}</td>
							<td>{{review.modelID}}</td>
							<td>{{review.brandName}}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<br />
<br />
<br />
<br />



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
