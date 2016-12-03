<!-- View Orders-->
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
			<div ng-show="showOrderTable">
				<h2>View Orders</h2>
				<h4>Most Recent Orders</h4>
				<div ng-show="isOrderEmpty">{{orderEmpty}}</div>
				<table class="table table-striped" ng-hide="isOrderEmpty">
					<thead>
						<tr>
							<th>Order Date</th>
							<th>Order ID</th>
							<th>Cost</th>
							<th>Quantity</th>
							<th></th>
						</tr>
					</thead>
					<!-- These are the seller's product -->
					<tbody>
						<tr ng-repeat="order in OrderHistory" class="order-row">
							<th scope="row">{{order.modifiedOn}}</th>
							<td>{{order.orderID}}</td>
							<td>{{order.price}}</td>
							<td>{{order.quantity}}</td>
							<td><div>
									<button type="button" class="btn btn-primary navbar-btn" ng-click="viewProduct(order.productId)">
										View Product</button>
								</div></td>
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
