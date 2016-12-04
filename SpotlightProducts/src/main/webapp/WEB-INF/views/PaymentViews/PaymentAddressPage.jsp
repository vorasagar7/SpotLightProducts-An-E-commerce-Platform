<div class="row">
	<div class="col-xs-8 col-md-offset-4 col-md-4">
		<h1>SpotlightProducts</h1>
	</div>
</div>
<div class="row">
	<div class="col-xs-8 col-md-offset-4 col-md-4">
		<div role="alert" class="alert alert-danger"
			ng-class="{hideElement: !isAlert, showElement: isAlert}">
			<button type="button" class="close" aria-label="Close"
				ng-click="hideAlert()">
				<span aria-hidden="true">&times;</span>
			</button>
			{{alertMessage}}
		</div>
		<div class="panel panel-default">


			<div class="row">
				<div class="col-xs-8 col-md-offset-1 col-md-10">


					<form name="paymentDetailsForm" class="css-form" novalidate>
						<h3>Personal Information</h3>
						<div class="form-group"
							ng-class="{ 'has-error' : paymentDetailsForm.fullName.$invalid && !paymentDetailsForm.fullName.$pristine }">
							<label for="Full Name" class="control-label">Full Name</label> <input
								name="fullName" type="text" class="form-control" id="Full Name"
								placeholder="Full Name" ng-model="paymentDetails.fullName"
								required>
							<p
								ng-show="paymentDetailsForm.fullName.$invalid && !paymentDetailsForm.fullName.$pristine"
								class="help-block">Your Full Name is required.</p>
						</div>

						<div class="form-group"
							ng-class="{ 'has-error' : paymentDetailsForm.address1.$invalid && !paymentDetailsForm.address1.$pristine }">
							<label for="Address Line 1" class="control-label">Address
								Line 1</label> <input type="text" class="form-control" name="address1"
								id="Address line 1" placeholder="Address line 1"
								ng-model="paymentDetails.address1" required>
							<p
								ng-show="paymentDetailsForm.address1.$invalid && !paymentDetailsForm.address1.$pristine"
								class="help-block">Your Address1 is required.</p>
						</div>

						<div class="form-group">
							<label for="Address Line 2" class="control-label">Address
								Line 2</label> <input type="text" class="form-control"
								id="exampleInputEmail1" placeholder="Address line 2"
								ng-model="paymentDetails.address2">
						</div>

						<div class="form-group"
							ng-class="{ 'has-error' : paymentDetailsForm.city.$invalid && !paymentDetailsForm.city.$pristine }">
							<label for="City" class="control-label">City</label> <input
								name="city" type="text" class="form-control" id="city"
								placeholder="City" ng-model="paymentDetails.city" required>
							<p
								ng-show="paymentDetailsForm.city.$invalid && !paymentDetailsForm.city.$pristine"
								class="help-block">Your City is required.</p>
						</div>

						<div class="form-group"
							ng-class="{ 'has-error' : !paymentDetails.state && !paymentDetailsForm.state.$pristine }">
							<label for="state" class="control-label">State</label> <select
								class="form-control" id="state" name="state"
								ng-model="paymentDetails.state" ng-cloak>
								<option value="">Select State</option>
								<option ng-repeat="state in referenceData | filter:{id:10}"
									value="{{state.objectId}}">{{state.name}}</option>
							</select>
							<p
								ng-show="!paymentDetails.state && !paymentDetailsForm.state.$pristine"
								class="help-block">Your State is required.</p>
						</div>

						<div class="form-group"
							ng-class="{ 'has-error' : paymentDetailsForm.country.$invalid && !paymentDetailsForm.country.$pristine }">
							<label for="Country" class="control-label">Country</label> <input
								name="country" type="text" class="form-control" id="Country"
								placeholder="City" ng-disabled="true"
								ng-model="paymentDetails.country" required>
							<p
								ng-show="paymentDetailsForm.country.$invalid && !paymentDetailsForm.country.$pristine"
								class="help-block">Your Country is required.</p>
						</div>

						<div class="form-group"
							ng-class="{ 'has-error' : paymentDetailsForm.zipcode.$invalid && !paymentDetailsForm.zipcode.$pristine }">
							<label for="ZIP" class="control-label">Zip Code</label> <input
								type="text" class="form-control" id="ZIP" name="zipcode"
								placeholder="ZIP" ng-model="paymentDetails.zip_code" required>
							<p
								ng-show="paymentDetailsForm.zipcode.$invalid && !paymentDetailsForm.zipcode.$pristine"
								class="help-block">Your Zip Code is required.</p>
						</div>

						<div class="form-group">
							<label for="Type Of Payment" class="control-label">Type
								of Payment Option</label> </br> <label class="radio-inline"
								ng-repeat="typeOfPayment in referenceData | filter:{id:20}">
								<input type="radio" name="inlineRadioOptions"
								value="{{typeOfPayment.objectId}}"
								ng-model="paymentDetails.typeOfPayment" />{{typeOfPayment.name}}
							</label>
							<p ng-show="!paymentDetails.typeOfPayment" class="help-block"
								ng-class="{ 'invalid-input': !paymentDetails.typeOfPayment }">Please
								select a payment type.</p>
						</div>
						<br> <br>

						<div class="form-group">
							<button type="Submit" class="btn btn-primary"
								ng-disabled="paymentDetailsForm.$invalid || !paymentDetails.typeOfPayment || !paymentDetails.state"
								ng-click="submitPayment()">Continue to Payment</button>
							
						</div>
					</form>

					<br> <br>
				</div>
			</div>
		</div>
	</div>
</div>