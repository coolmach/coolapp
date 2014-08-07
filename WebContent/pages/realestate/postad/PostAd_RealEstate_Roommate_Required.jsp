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
	<s:form cssClass="form-horizontal post" action="real_estate_postAd.action" enctype="multipart/form-data">
		<input type="hidden" name="category" value="REAL"/>
		<input type="hidden" name="subCategory" value="7"/>
		<div class="col-md-12 post_title">
			<div style="float:left;">
				Roommate Required
			</div>
			<span class="error"><s:fielderror fieldName="errorMsg"/></span>
		</div>
	   <div class="col-md-8">
			<div class="form-group">
				<label for="title" class="col-sm-4 control-label">Title<span class="mandatory">*</span></label>
				<div class="col-sm-8">
					<input type="text" class="form-control" maxlength="200" id="Title" name="Title" value="Looking for a roommate" required>
				</div>
			</div>
			<%@include file="/locationStrip.jsp" %>
			<div class="form-group">
				<label for="gender" class="col-sm-4 control-label">Gender</label>
				<div class="col-sm-6">
					<input type="radio" class="form-control-radio" name="gender" id="gender" value="M" checked> <span class="form-control-radio-label">Male</span>
					<input type="radio" class="form-control-radio" name="gender" id="gender" value="F"> <span class="form-control-radio-label">Female</span>
				</div>
			</div>
			<div class="form-group">
				<label for="area" class="col-sm-4 control-label">Total Area (sq. ft)<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="5" name="Area" id="Area" value="1200" required> 
				</div>
				<label for="Bedrooms" class="col-sm-3 control-label">Bedrooms<span class="mandatory">*</span></label>
				<div class="col-sm-2">
					<input type="text" class="form-control" maxlength="1" name="Bedrooms" id="Bedrooms" value="2" required>
				</div>	
			</div>			
			<div class="form-group">
				<label for="noOfRoommates" class="col-sm-4 control-label">Number of Occupants</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="1" name="noOfRoommates" id="noOfRoommates" value="3">
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-4 control-label">Rent per person<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="6" name="PriceValue" id="PriceValue" value="20000" required>
				</div>
			</div>		
			<div class="form-group">
				<label for="regionalPreference" class="col-sm-4 control-label">Regional Preference</label>
				<div class="col-sm-6" style="padding-top:6px;">
					<select class="dropDown" name="regionalPreference" id="regionalPreference">
						<option value="No Preference">No Preference</option>
						<option value="Tamil">Tamil</option>
						<option value="Hindi">Hindi</option>
						<option value="Kannada">Kannada</option>
						<option value="Telugu">Telugu</option>
						<option value="Malayalam">Malayalam</option>
						<option value="Punjabi">Punjabi</option>
						<option value="Bengali">Bengali</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-4 control-label">Remarks</label>
				<div class="col-sm-8">
					<textarea class="form-control" maxlength="256" rows="3" name="Description" id="Description">Hello this is description</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button type="submit" class="btn btn-primary pull-right" onClick="history.go(-1);">Back</button>
				</div>
				<div class="col-sm-offset-0 col-sm-3">
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
					<label for="" class="col-sm-6 control-label" style="text-align:left;">Contact Details<span class="mandatory">*</span></label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="30" name="ContactPersonName" placeholder="Contact Person Name" value="MGR" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="15" name="ContactNo" placeholder="Contact Number" value="77777766666" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-8">
					<label for="" class="col-sm-6 control-label" style="text-align:left;">Amenities</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<input type="checkbox" name="carParking" value="Y"><span class="checkBoxText">Car Parking</span><BR>
					<input type="checkbox" name="wiFi" value="Y"><span class="checkBoxText">Wi-Fi</span><BR>
					<input type="checkbox" name="tv" value="Y"><span class="checkBoxText">TV/DTH</span><BR>
				</div>
			</div>	
		</div>
	</s:form>

</div>
<div class="col-md-5"></div>