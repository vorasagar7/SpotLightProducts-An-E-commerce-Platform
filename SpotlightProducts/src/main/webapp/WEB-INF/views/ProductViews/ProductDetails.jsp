<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
	
	background-image: url("/resources/texture5.jpg"); 
	background-size: 100%;
	}
	h1{
		
		text-align: center;
	}
	</style>
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
<spring:url value="/resources/ProductDetails/app.js" var="appJS" />
<script src="${angularJS}"></script>
<script src="${appJS}"></script>

<style>
body {
	font-size: 20px;
	padding: 50px;
}
</style>
</head>
<body ng-app="ProductDetailsApp" ng-controller="ProductDetailsCtrl">

	<div class="login-header col-xs-9 col-md-9">
		<h1>SpotLightProducts</h1>
	</div>
	<div class="col-xs-3 col-md-3">
		<form action="/homepage">
			<button type="submit" class="btn btn-info">
				<span class="glyphicon glyphicon-share-alt"></span> Continue
				shopping
			</button>
		</form>
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
				<img ng-src="/resources/{{productImage}}" class="product-image" />
			</div>
			<div class="col-md-9 col-xs-9">
				<div>{{productDetails.productName}}</div>
				<div>Product Rating: {{productRating}}</div>
				<hr>
				<div
					ng-class="{'custom-has-error' : isSoldOut, 'custom-has-success' : !isSoldOut}">{{inStock}}</div>
				<div>{{productDetails.description}}</div>
				<hr>
				<h3>Sellers</h3>
				<div ng-repeat="seller in productSellers" class="row">
					<div class="col-md-3">{{seller.sellerName}}</div>
					<div class="col-md-offset-1 col-md-2">Price: {{seller.price | currency:"USD$":0 }}</div>
					<div class="col-md-offset-1 col-md-2">
						<button class="btn btn-primary"
							ng-click="addToCart(seller.sellerId, seller.price)">Add
							to Cart</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-md-12 row">
			<div>
				<button class="btn btn-primary" ng-click="redirectToReview()">Write
					a review</button>
			</div>
			<h2>Customer Reviews</h2>
			<hr>
			<div ng-repeat="review in productReviews" class="col-xs-6 col-md-5">
				<div>
					On <span class="review-header">{{review.modifiedOn}}</span> by <span
						class="review-header">{{review.username}}</span>
				</div>
				<div>Rating: {{review.rating}}</div>
				<div>{{review.comment}}</div>
				<hr>
			</div>
		</div>
	</div>

</body>



</html>
