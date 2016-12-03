<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>

<title>Buyer Dashboard</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<spring:url value="/resources/custom.css" var="customCSS" />
<link href="${customCSS}" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!--   <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<spring:url value="/resources/AngularJS/angular.js" var="angularJS" />
<spring:url value="/resources/AngularJS/angular-route.min.js"
	var="angularRouteJS" />
<spring:url value="/resources/Dashboard/Seller/app.js" var="appJS" />
<spring:url value="/resources/Dashboard/Seller/controller.js"
	var="controllerJS" />
<script src="${angularJS}"></script>
<script src="${angularRouteJS}"></script>
<script src="${appJS}"></script>
<script src="${controllerJS}"></script>



<!-- <style>
#navBarSearchForm input[type=text] {
	width: 500px !important;
}

.navbar {
	margin-bottom: 0;
}

.borderless li {
	border-top: none;
}
</style> -->



</head>
<body ng-app="SellerDashboardApp">
	<div class="row">
		<div class="col-xs-8 col-md-offset-4 col-md-4">
			<h1>SpotLightProducts</h1>
		</div>
	</div>
	<div ng-view></div>

	<!-- <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    Brand and toggle get grouped for better mobile display
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">SP</a>
    </div>

     <form class="navbar-form navbar-left" role="search" id="navBarSearchForm">
        <div class="form-group" >
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="button" class="btn btn-primary btn">
          <i class="fa fa-search"></i>
        </button>
      </form>




      <ul class="nav navbar-nav navbar-right">

        <li><button type="button" class="btn btn-primary navbar-btn" >
            <i class="fa fa-shopping-cart"></i> Shopping Cart</button>
          </li>



        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">User Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Setting</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>/.navbar-collapse
  </div>/.container-fluid
</nav>


<ul class="nav nav-pills">
  <li role="presentation" class="active"><a href="#">Home</a></li>
  <li role="presentation"><a href="#">Electronics</a></li>
  <li role="presentation"><a href="#">Clothes</a></li>
  <li role="presentation"><a href="#">Movies, Music, Games</a></li>
  <li role="presentation"><a href="#">Books</a></li>
  <li role="presentation"><a href="#">Furniture</a></li>
  <li role="presentation"><a href="#">Home and Garden</a></li>
  <li role="presentation"><a href="#">SpotLightProducts</a></li>
</ul>

<ol class="breadcrumb">
  <li><a href="#">Home</a></li>
</ol>

<br />
<br />
 -->




</body>
</html>
