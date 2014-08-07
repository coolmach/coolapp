<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/Cbuddy.css"/>
<div class=" header_2">
	<div class=""></div>
</div>
<div class="col-md-8" id="my">
	<s:form cssClass="form-horizontal post" action="others_postAd" enctype="multipart/form-data">
		<input type="hidden" name="category" value="ELEC"/>
		<input type="hidden" name="subCategory" value="7"/>
		<div class="col-md-12 post_title">
			<div style="float:left;">
				Item For Sale
			</div>
			<span class="error"><s:fielderror fieldName="errorMsg"/></span>
		</div>
	   <div class="col-md-8">
			<div class="form-group">
				<label for="title" class="col-sm-4 control-label">Title<span class="mandatory">*</span></label>
				<div class="col-sm-8">
					<input type="text" class="form-control" maxlength="200" id="Title" name="Title" value="Available for sale" required>
				</div>
			</div>
			
			<%@include file="locationStrip.jsp" %>
					
			<div class="form-group">
				<label for="brand" class="col-sm-4 control-label">Brand <span class="mandatory">*</span></label>
				<div class="col-sm-6" style="padding-top:6px;">
					<input type="text" maxlength="15" class="form-control" name="brand" id="brand" value="Toshiba" required>
				</div>
			</div>
			<div class="form-group">
				<label for="model" class="col-sm-4 control-label">Model</label>
				<div class="col-sm-6">
					<input type="text" maxlength="30" class="form-control" name="model" id="model" value="25 TW">
				</div>
			</div>
			<div class="form-group">
				<label for="year" class="col-sm-4 control-label">Year of purchase<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" maxlength="4" class="form-control" name="year" id="year" value="2007" required>
				</div>
			</div>
			<div class="form-group">
				<label for="price" class="col-sm-4 control-label">Price<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" maxlength="6" class="form-control" name="price" id="price" value="30000" required>
				</div>
			</div>
			<div class="form-group">
				<label for="billAvailable" class="col-sm-4 control-label">Original Bill<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="radio" class="form-control-radio" name="billAvailable" id="billAvailable" value="Y"> <span class="form-control-radio-label">Available</span>
					<input type="radio" class="form-control-radio" name="billAvailable" id="billAvailable" value="N"> <span class="form-control-radio-label">Not Available</span>
				</div>
			</div>
											
			<div class="form-group">
				<label for="description" class="col-sm-4 control-label">Other Specifications</label>
				<div class="col-sm-8">
					<textarea class="form-control" maxlength="256" rows="3" name="Description" id="Description" placeholder="Please enter other specifications of your laptop"></textarea>
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
					<input type="text" class="form-control" maxlength="30" name="ContactPersonName" placeholder="Contact Person Name" value="Arunachalam" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="11" name="ContactNo" placeholder="Contact Number" value="98431203943" required>
				</div>
			</div>
		</div>
	</s:form>

</div>
<div class="col-md-5"></div>
