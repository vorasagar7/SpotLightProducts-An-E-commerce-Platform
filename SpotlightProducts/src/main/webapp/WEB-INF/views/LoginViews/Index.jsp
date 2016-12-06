<!-- <html>
<head>
<title>Yahoo!!</title>
</head>
<body>
    <p><font color="red">${errorMessage}</font></p>
    <form action="/login" method="POST">
        Name : <input name="name" type="text" /> Password : <input name="password" type="password" /> <input type="submit" />
    </form>
</body>
</html>-->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>

<title>SpotLightProducts_Login.html</title>
<!--   <link rel="stylesheet" type = "text/css" href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" /> -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<!--   <link rel="stylesheet" type = "text/css" href="/resources/font-awesome-4.7.0/css/font-awesome.min.css" /> -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<!--   <script src="scripts/jquery-3.1.1.min.js"></script> -->
<spring:url value="/resources/custom.css" var="customCSS"/>
<link href="${customCSS}" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!--   <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<spring:url value="/resources/AngularJS/angular.js" var="angularJS" />
<spring:url value="/resources/AngularJS/angular-route.min.js" var="angularRouteJS" />
<spring:url value="/resources/Login/app.js" var="appJS" />
<spring:url value="/resources/Login/controller.js" var="controllerJS" />
<script src="${angularJS}"></script>
<script src="${angularRouteJS}"></script>
<script src="${appJS}"></script>
<script src="${controllerJS}"></script>
	<style>
	body{
	background-image: url("/resources/spotlightbg1.jpg");
	background-size: 100%;
	}
	h1{
		color: white;
		text-align: center;
	}
	</style>
</head>



<body ng-app="LoginApp">
	<div ng-view></div>
</body>
</html>
