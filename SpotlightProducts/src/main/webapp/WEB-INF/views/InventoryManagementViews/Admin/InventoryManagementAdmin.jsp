<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>

<title>Inventory Management</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<spring:url value="/resources/custom.css" var="customCSS" />
<link href="${customCSS}" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<spring:url value="/resources/AngularJS/angular.js" var="angularJS" />
<spring:url value="/resources/InventoryManagement/Admin/app.js"
	var="appJS" />
<script src="${angularJS}"></script>
<script src="${appJS}"></script>



</head>
<body ng-app="InventoryManagementApp"
	ng-controller="InventoryManagementCtrl">
	<div class="row">
		<div
			class="col-xs-offset-4 col-xs-4 col-md-offset-4 col-md-4 login-header">
			<h1>SpotLightProducts</h1>
		</div>
	</div>

	<div>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/homepage">SP</a>
				</div>

				<form class="navbar-form navbar-left" role="search"
					id="navBarSearchForm" action="/search" method="POST">
					<div class="form-group">
						<input type="text" name="searchQuery" class="form-control"
							placeholder="Search">
					</div>
					<button type="submit" class="btn btn-primary btn">
						<i class="fa fa-search"></i>
					</button>
				</form>




				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">${email} <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#/">Dashboard</a></li>
							<li><a href="/ChangePassword">Change Password</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="/Logout">Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</nav>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->

	<div class="row">
		<div class="col-md-offset-1 col-md-8 col-xs-offset-1 col-xs-8">
			<div role="alert" class="alert"
				ng-class="{hideElement: hideElement, 'alert-success showElement': showSuccessAlert, 'alert-danger showElement': showDangerAlert}">
				<button type="button" class="close" aria-label="Close"
					ng-click="hideAlert()">
					<span aria-hidden="true">&times;</span>
				</button>
				{{alertMessage}}
			</div>
			<div ng-hide="!showTable || isEmpty">
				<h2>Inventory</h2>
				<table class="table">

					<thead>
						<tr>
							<th>Product Name</th>
							<th>Model Id</th>
							<th>Brand</th>
							<th>Category</th>
							<th>Quantity</th>
							<th>Price</th>
							<th></th>
						</tr>
					</thead>
					<!-- These are the seller's product -->
					<tbody>

						<tr ng-repeat="product in adminAllSellerProducts"
							ng-hide="product.isDeleted || product.isApproved">
							<th scope="row" class="inventory-table-cell">{{product.productName}}</th>
							<td class="inventory-table-cell">{{product.modelId}}</td>
							<td class="inventory-table-cell">{{product.brandName}}</td>
							<td class="inventory-table-cell">{{product.categoryName}}</td>
							<td class="inventory-table-cell">{{product.quantity}}</td>
							<td class="inventory-table-cell">{{product.price}}</td>
							<td><div>
									<button type="button" class="btn btn-primary navbar-btn"
										ng-click="approveProduct(product.productId)">Approve
										Product</button>
									<button type="button" class="btn btn-primary navbar-btn"
										ng-click="rejectProduct(product.productId)">Reject Product</button>
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row" ng-show="isEmpty">
				<div class="text-center">
					<div class="col-xs-9">
						<h6 class="text-left no-product-font">No Products.</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- </div> -->






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
</body>


</html>
