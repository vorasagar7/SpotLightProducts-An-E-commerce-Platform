<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>Customer Support</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<spring:url value="/resources/custom.css" var="customCSS"/>
<link href="${customCSS}" rel="stylesheet" />
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<spring:url value="/resources/AngularJS/angular.min.js" var="angularJS" />
<spring:url value="/resources/CustomerSupport/app.js" var="appJS" />
<script src="${angularJS}"></script>
<script src="${appJS}"></script>

</head>
<body>
	<div class="customer-support-container">
		<div class="row">
			<div class="col-sm-12">
				<h1>SpotLightProducts Customer Support Page</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<h4>
					Contact Us At: <b>spotlightproducts@indiana.edu</b>
				</h4>
				<h4>
					Or Call Us @ +1(812) 369-8537
					</hr>
			</div>
		</div>
		<div class="row" ng-app="CustomerSupportApp" ng-controller="customerSupportCtrl">
			<div class="col-xs-12 col-md-8">
				<div class="row">
					<div class="col-xs-12 col-md-10">
						<div class="alert alert-success" role="alert" ng-show="alertDisplay">
  								Your query has been recorded. Someone will look into it and get back to you soon.
						</div>
						<div class="panel panel-default credit-card-box">
							<div class="panel-heading display-table">
								<div class="row display-tr col-xs-12">

									<h2>
										Have A Query? <small>We are there to help you
											24*7.....</small>
										</h1>
								</div>
							</div>
							<div class="panel-body">
								<form role="form" id="product-feedback-form"
									name="customerSupportForm" class="css-form" novalidate>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group"
												ng-class="{ 'has-error' : customerSupportForm.fullName.$invalid && !customerSupportForm.fullName.$pristine }">
												<label for="comment" class="customer-support-label">Full Name</label> <input
													name="fullName" class="form-control col-sm-4" rows="7"
													id="fullName" ng-model="user.fullName" required>
												<p
													ng-show="customerSupportForm.fullName.$invalid && !customerSupportForm.fullName.$pristine"
													class="help-block">Your Full Name is required.</p>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group"
												ng-class="{ 'has-error' : customerSupportForm.email.$invalid && !customerSupportForm.email.$pristine }">
												<label for="comment" class="customer-support-label">Email Id</label> <input name="email"
													type="email" class="form-control" rows="7" id="emailId"
													ng-model="user.Email" required>
												<p
													ng-show="customerSupportForm.email.$invalid && !customerSupportForm.email.$pristine"
													class="help-block">Enter a valid Email.</p>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<label for="comment" class="customer-support-label">Submit your Query</label><span class="customer-support-indtructions">(minimum 10 characters and upto
													1000 characters)</span>
												<textarea name="Query" class="form-control" rows="7"
													id="query" ng-model="Query" ng-minlength="10"
													ng-maxlength="1000" required></textarea>
												<div role="alert">
													<span class="error"
														ng-show="customerSupportForm.Query.$error.minlength">Too
														short!</span> <span class="error"
														ng-show="customerSupportForm.Query.$error.maxlength">Too
														long!</span>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<button type="submit" class="btn btn-primary"
												ng-disabled="customerSupportForm.$invalid || customerSupportForm.Query.$error.minlength || customerSupportForm.Query.$error.maxlength" ng-click="submitQuery()">
												<i class="fa fa-sign-in"></i>Submit
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
			</div>
		</div>
	</div>
</body>



</html>
