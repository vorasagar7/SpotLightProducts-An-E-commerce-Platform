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
<spring:url value="/resources/UserReviews/app.js" var="appJS" />
<script src="${angularJS}"></script>
<script src="${appJS}"></script>

<style>
body {
	font-size: 20px;
	padding: 50px;
}

.myclass {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body ng-app="UserReviewApp" ng-controller="UserReviewCtrl">

	<div class="row">
		<div class="col-md-12 col-xs-12 login-header">
			<h1>SpotLightProducts</h1>
		</div>
	</div>

	<div class="row">

		<div class="col-xs-12 col-md-12">
			<div class="row">
				<div class="col-xs-12 col-md-10">
					<div role="alert" class="alert"
						ng-class="{hideElement: hideElement, 'alert-success showElement': showSuccessAlert, 'alert-danger showElement': showDangerAlert}">
						<button type="button" class="close" aria-label="Close"
							ng-click="hideAlert()">
							<span aria-hidden="true">&times;</span>
						</button>
						{{alertMessage}}
					</div>


					<!-- User Rating Form starts -->
					<div class="panel panel-default credit-card-box">
						<div class="panel-heading display-table">
							<div class="row display-tr">
								<h1>
									User Rating <small>Your feedback is valuable to us....</small>
								</h1>
							</div>
						</div>
						<div class="panel-body">
							<form role="form" id="product-feedback-form" name="reviewForm"
								novalidate>
								<div class="row">
									<div class="col-xs-12">
										<div class="form-group">
											<p>
												Rate this Product: <input type="number" name="rating"
													id="rating-inline" class="rating" data-clearable="remove"
													data-inline ng-model="review.rating" />
											</p>
										</div>
										<div class="form-group">
											<label for="comment">We would appreciate your
												feedback :)</label><small>(minimum 10 characters and up to
												1000 characters)</small>
											<textarea class="form-control" name="comment" rows="7"
												id="comment" ng-model="review.comment" ng-minlength="10"
												ng-maxlength="1000" required></textarea>
											<div role="alert">
												<span class="error"
													ng-show="reviewForm.comment.$error.minlength">Too
													short!</span> <span class="error"
													ng-show="reviewForm.comment.$error.maxlength">Too
													long!</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<button type="submit" class="btn btn-primary"
											ng-disabled="reviewForm.$invalid || reviewForm.comment.$error.minlength || reviewForm.comment.$error.maxlength" ng-click="submitReview()">
											<i class="fa fa-sign-in"></i> Submit
										</button>
									</div>
								</div>
								<div class="row" style="display: none;">
									<div class="col-xs-12">
										<p class="feedback-errors"></p>
									</div>
								</div>
							</form>
						</div>

					</div>
					</br> <br>
				</div>
			</div>
</body>



</html>
