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
<spring:url value="/resources/InventoryManagement/Seller/app.js"
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
							<li><a href="/Dashboard">Dashboard</a></li>
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

						<tr ng-repeat="product in sellerProducts"
							ng-class="{ 'danger': (product.quantity <= 10) }"
							ng-hide="product.isDeleted">
							<th scope="row" class="inventory-table-cell">{{product.productName}}</th>
							<td class="inventory-table-cell">{{product.modelId}}</td>
							<td class="inventory-table-cell">{{product.brandName}}</td>
							<td class="inventory-table-cell">{{product.categoryName}}</td>
							<td class=" inventory-cell inventory-table-cell"><input class="form-control"
								ng-model="product.quantity"></td>
							<td class=" inventory-cell inventory-table-cell"><input class="form-control"
								ng-model="product.price"></td>
							<td><div>
									<button type="button" class="btn btn-primary navbar-btn"
										ng-click="viewProduct(product.productId)">View
										Product</button>
									<button type="button" class="btn btn-primary navbar-btn"
										ng-click="deleteProduct(product.productId)">Delete</button>
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


			<div>
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#addProductModal">Add Product</button>
				<button type="button" class="btn btn-primary"
					ng-click="updateChanges()" ng-disabled="isEmpty">Update Changes</button>
			</div>
			<!-- Add Product Modal -->
			<div class="modal fade" id="addProductModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Add Product</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal css-form" name="addProductForm"
								novalidate>
								<div class="form-group"
									ng-class="{ 'has-error' : addProductForm.modelId.$invalid && !addProductForm.modelId.$pristine }">
									<label for="productModelId"
										class="col-xs-2 col-md-2 control-label">Model Id</label>
									<div class="col-xs-8 col-md-8">
										<input name="modelId" type="text" class="form-control"
											id="productModelId" placeholder="Model Id"
											ng-model="product.modelId" required>
										<p
											ng-show="addProductForm.modelId.$invalid && !addProductForm.modelId.$pristine"
											class="help-block">Model Id is required.</p>
									</div>

								</div>

								<div class="form-group"
									ng-class="{ 'has-error' : addProductForm.productName.$invalid && !addProductForm.productName.$pristine }">
									<label for="productName"
										class="col-xs-2 col-md-2 control-label">Name</label>
									<div class="col-xs-8 col-md-8">
										<input name="productName" ng-model="product.productName"
											type="text" class="form-control" id="productName"
											placeholder="Product Name" required>
										<p
											ng-show="addProductForm.productName.$invalid && !addProductForm.productName.$pristine"
											class="help-block">Product Name is required.</p>
									</div>
								</div>
								<div class="form-group">
									<label for="brand" class="col-xs-2 col-md-2 control-label"
										ng-class="{ 'has-error' : !product.brandId && !addProductForm.brand.$pristine }">Brand</label>
									<div class="col-xs-4 col-md-4"
										ng-class="{ 'has-error' : !product.brandId && !addProductForm.brand.$pristine }">
										<select class="form-control" id="productBrand" name="brand"
											ng-model="product.brandId">
											<option value="">Select Brand</option>
											<option ng-repeat="brand in referenceList | filter:{id:10}"
												value="{{brand.objectId}}">{{brand.name}}</option>
										</select>
										<p
											ng-show="!product.brandId && !addProductForm.brand.$pristine"
											class="help-block">Brand is required.</p>
									</div>
									<label for="category" class="col-xs-2 col-md-2 control-label"
										ng-class="{ 'has-error' : !product.categoryId && !addProductForm.category.$pristine }">Category</label>
									<div class="col-xs-4 col-md-4"
										ng-class="{ 'has-error' : !product.categoryId && !addProductForm.category.$pristine }">
										<select class="form-control" id="productCategory"
											name="category" ng-model="product.categoryId">
											<option value="">Select Category</option>
											<option
												ng-repeat="category in referenceList | filter:{id:20}"
												value="{{category.objectId}}">{{category.name}}</option>
										</select>
										<p
											ng-show="!product.categoryId && !addProductForm.category.$pristine"
											class="help-block">Category is required.</p>
									</div>
								</div>
								<div class="form-group">
									<label for="price" class="col-xs-2 col-md-2 control-label"
										ng-class="{ 'has-error' : (addProductForm.price.$invalid && !addProductForm.price.$pristine)}">Price
										($)</label>
									<div class="col-xs-4 col-md-4"
										ng-class="{ 'has-error' : (addProductForm.price.$invalid && !addProductForm.price.$pristine)}">
										<input name="price" ng-model="product.price" type="number"
											class="form-control" id="productPrice" required>
										<p
											ng-show="addProductForm.price.$invalid && !addProductForm.price.$pristine"
											class="help-block">Price is required.</p>
									</div>
									<label for="quantity" class="col-xs-2 col-md-2 control-label"
										ng-class="{ 'has-error' : (addProductForm.quantity.$invalid && !addProductForm.quantity.$pristine)}">Quantity</label>
									<div class="col-xs-4 col-md-4"
										ng-class="{ 'has-error' : (addProductForm.quantity.$invalid && !addProductForm.quantity.$pristine)}">
										<input name="quantity" ng-model="product.quantity"
											type="number" class="form-control" id="productQuantity"
											required>
										<p
											ng-show="addProductForm.quantity.$invalid && !addProductForm.quantity.$pristine"
											class="help-block">Quantity is required.</p>
									</div>
								</div>
								<div class="form-group">
									<label for="imageUpload"
										class="col-xs-2 col-md-2 control-label">Image</label>
									<div class="col-xs-8 col-md-8">
										<input type="file" id="productImageFile"
											class="product-image-input">
									</div>
								</div>
								<div class="form-group product-image-input">
									<label for="spotlightCheckbox"
										class="col-xs-2 col-md-2 control-label">Spotlight?</label>
									<div class="col-xs-8 col-md-8">
										<input type="checkbox" id="productSpotlight"
											ng-model="product.isSpotlight">
									</div>
								</div>

								<div class="form-group"
									ng-class="{ 'has-error' : (addProductForm.description.$invalid && !addProductForm.description.$pristine)}">
									<label for="productDescription"
										class="control-label col-xs-2 col-md-2">Description</label>
									<div class="col-xs-10 col-md-10">
										<textarea name="description" ng-model="product.description"
											class="form-control product-description-input"
											id="productDescription" placeholder="Description" required></textarea>
										<p
											ng-show="addProductForm.description.$invalid && !addProductForm.description.$pristine"
											class="help-block">Description is required.</p>
									</div>

								</div>

							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary"
								ng-disabled="addProductForm.$invalid || !product.brandId || !product.categoryId"
								ng-click="saveProduct()">Save changes</button>
						</div>
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
