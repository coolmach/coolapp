<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/Cbuddy.css"/>
<div class=" header_2">
	<div class=""></div>
	<!--div class="col-md-11">
		<a class="grey_link" href="<s:url action=""  />"></a>
		<s:property value="category" />
	</div-->
</div>
<div class="col-md-8" id="my">
	<s:form cssClass="form-horizontal post" action="automobile_postAd" enctype="multipart/form-data">
		<input type="hidden" name="category" value="AUTO"/>
		<input type="hidden" name="subCategory" value="2"/>
		<div class="col-md-12 post_title">Car For Sale</div>
	   <div class="col-md-8">
			<div class="form-group">
				<label for="title" class="col-sm-4 control-label">Title</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="Title" name="Title" value="Maruti Swift (TN Registration) available for Sale immediately">
				</div>
			</div>
			<%@include file="locationStrip.jsp" %>		
			<div class="form-group">
				<label for="facingDirection" class="col-sm-4 control-label">Make</label>
				<div class="col-sm-6" style="padding-top:6px;">
					<select class="dropDown" name="make" id="make">
						<option value="BAJ">Bajaj</option>
						<option value="HER">Hero Honda</option>
						<option value="HON">Honda</option>
						<option value="TVS">TVS</option>
						<option value="SUZ">Suzuki</option>
						<option value="YAM">Yamaha</option>
						<option value="ROY">Royal Enfield</option>
						<option value="LML">LML</option>
						<option value="OTH">Others</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="facingDirection" class="col-sm-4 control-label">Model</label>
				<div class="col-sm-6" style="padding-top:6px;">
					<select class="dropDown" name="model" id="model">
						<option value="M1">Model 1</option>
						<option value="M2">Model 2</option>
						<option value="M3">Model 3</option>
						<option value="M4">Model 4</option>
						<option value="M5">Model 5</option>
					</select>
				</div>
			</div>				
			<div class="form-group">
				<label for="approvalAuthority" class="col-sm-4 control-label">Year</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="year" id="year" value="2007">
				</div>
			</div>
			<div class="form-group">
				<label for="approvalAuthority" class="col-sm-4 control-label">Kms Driven</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="kms" id="kms" value="10000">
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-4 control-label">Price</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="price" id="price" value="30000">
				</div>
			</div>			
			<div class="form-group">
				<label for="approvalAuthority" class="col-sm-4 control-label">Color</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="color" id="color" value="Pearl Gray">
				</div>
			</div>	
			<div class="form-group">
				<label for="carParking" class="col-sm-4 control-label">Insurance Renewed</label>
				<div class="col-sm-6">
					<input type="radio" class="form-control-radio" name="insuranceAvailable" id="insuranceAvailable" value="Y"> <span class="form-control-radio-label">Yes</span>
					<input type="radio" class="form-control-radio" name="insuranceAvailable" id="insuranceAvailable" value="N"> <span class="form-control-radio-label">No</span>
				</div>
			</div>							
			<div class="form-group">
				<label for="description" class="col-sm-4 control-label">Remarks</label>
				<div class="col-sm-8">
					<textarea class="form-control" rows="3" name="Description" id="Description">Hello tHis is description</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary pull-right">Post Ad</button>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="fileinput fileinput-new" data-provides="fileinput">
			  <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
			  <div>
			    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span>
			    <input type="file" name="upload" id="upload"></span>
			    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
			  </div>
			</div>
			<div class="form-group">
				<div class="col-sm-8">
					<label for="" class="col-sm-6 control-label" style="text-align:left;">Contact Details</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<input type="text" class="form-control" name="ContactPersonName" placeholder="Contact Person Name" value="MGR">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<input type="text" class="form-control" name="ContactNo" placeholder="Contact Number" value="77777766666">
				</div>
			</div>
		</div>
	</s:form>

</div>
<div class="col-md-5"></div>