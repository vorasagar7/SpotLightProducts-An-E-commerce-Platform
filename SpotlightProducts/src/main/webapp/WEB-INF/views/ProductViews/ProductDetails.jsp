<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Product Page</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rating/1.4.0/bootstrap-rating.min.js"></script>

<spring:url value="/resources/custom.css" var="customCSS" />
<link href="${customCSS}" rel="stylesheet" />

<spring:url value="/resources/AngularJS/angular.js" var="angularJS" />
<spring:url value="/resources/AngularJS/angular-route.min.js" var="angularRouteJS" />
<spring:url value="/resources/ProductDetails/app.js" var="appJS" />
<script src="${angularJS}"></script>
<script src="${angularRouteJS}"></script>
<script src="${appJS}"></script>

<style>
body {
	font-size: 20px;
	padding: 50px;
}

</style>
</head>
<body ng-app="ProductDetailsApp" ng-controller="ProductDetailsCtrl">

	<div class="login-header">
		<h1>SpotLightProducts</h1>
	</div>

	<div class="row">
		<div class="col-md-12 col-xs-12 row">
		<div role="alert" class="alert alert-danger"
			ng-class="{hideElement: !isAlert, showElement: isAlert}">
			<button type="button" class="close" aria-label="Close"
				ng-click="hideAlert()">
				<span aria-hidden="true">&times;</span>
			</button>
			{{alertMessage}}
		</div>
			<div class="col-md-3 col-xs-3">
				<img src="" />
			</div>
			<div class="col-md-9 col-xs-9">
				<div>Product Name</div>
				<div>Product Rating</div>
				<hr>
				<div>In Stock</div>
				<div>Product Description</div>
				<div>Sellers</div>
				<div>
					<span>Seller 1:</span> <span>Price: {{Price}}</span>
					<button class="btn btn-primary">Add Product</button>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-md-12 row">
			<div>Customer Reviews</div>
			<div class="col-md-7 col-xs-9">
				<div>On {{Date}} by {{Person}}</div>
				<br>
				<div>{{Message}}</div>
			</div>
		</div>
	</div>

</body>



</html>
