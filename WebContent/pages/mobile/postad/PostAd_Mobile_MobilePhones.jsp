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
	<s:form cssClass="form-horizontal post" action="mobile_postAd" enctype="multipart/form-data">
		<input type="hidden" name="category" value="MOBILE"/>
		<input type="hidden" name="subCategory" value="1"/>
		<div class="col-md-12 post_title">
			<div style="float:left;">
				Mobile for Sale
			</div>
			<span class="error"><s:fielderror fieldName="errorMsg"/></span>
		</div>
	   <div class="col-md-8">
			<div class="form-group">
				<label for="title" class="col-sm-4 control-label">Title<span class="mandatory">*</span></label>
				<div class="col-sm-8">
					<input type="text" class="form-control" maxlength="200" id="Title" name="Title" value="Samsung Galaxy available for sale" required>
				</div>
			</div>
			
			<%@include file="/locationStrip.jsp" %>
					
			<div class="form-group">
				<label for="brand" class="col-sm-4 control-label">Brand <span class="mandatory">*</span></label>
				<div class="col-sm-6" style="padding-top:6px;">
					<select class="dropDown" name="brand" id="brand">
						<option value="Sony">Sony</option> 
						<option value="Nokia">Nokia</option>  
						<option value="Samsung">Samsung</option> 
						<option value="Micromax">Micromax</option>
						<option value="LG">LG</option> 
						<option value="Apple">Apple</option>
						<option value="Blackberry">Blackberry</option>
						<option value="HTC">HTC</option> 
						<option value="Karbonn">Karbonn</option> 
						<option value="Xolo">Xolo</option> 
						<optgroup label="Other Brands">
							<option value="Maxx">Maxx</option> 
	 						<option value="Motorola">Motorola</option> 
							<option value="Tata">Tata</option> 
							<option value="Spice">Spice</option> 
							<option value="iBall">iBall</option> 
							<option value="Lenovo">Lenovo</option> 
							<option value="Intex">Intex</option> 
							<option value="Fly">Fly</option> 
							<option value="Videocon">Videocon</option> 
							<option value="Lava">Lava</option> 
							<option value="MTS">MTS</option>
						</optgroup> 
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="approvalAuthority" class="col-sm-4 control-label">Model<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" class="locationTextBox" maxlength="16" placeholder="Enter Area (e.g. JP Nagar)" name="userEnteredModelStr" id="userEnteredModelStr" required>
					<input type="hidden" name="model" id="model">
					<input type="hidden" name="selectedModelStr" id="selectedModelStr">
					<input type="hidden" name="selectedBrand" id="selectedBrand">
				</div>
			</div>			
			<div class="form-group">
				<label for="year" class="col-sm-4 control-label">Year of purchase<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" maxlength="4" class="form-control" name="year" id="year" value="2007" required>
				</div>
			</div>
			<div class="form-group">
				<label for="brand" class="col-sm-4 control-label">Operating System <span class="mandatory">*</span></label>
				<div class="col-sm-6" style="padding-top:6px;">
					<select class="dropDown" name="operatingSystem" id="operatingSystem">
						<option value="Android">Android</option>
						<option value="Symbian">Symbian (Nokia)</option> 
						<option value="Windows">Windows</option>  
						<option value="Apple-iOS">Apple-iOS</option>
						<option value="Blackberry">Blackberry</option>
						<option value="Others">Others</option> 
					</select>
				</div>
			</div>			
			<div class="form-group">
				<label for="color" class="col-sm-4 control-label">Color<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" maxlength="16" class="form-control" name="color" id="color" value="Black" required>
				</div>
			</div>
			<div class="form-group">
				<label for="touchScreen" class="col-sm-4 control-label">Touch Screen<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="radio" class="form-control-radio" name="touchScreen" id="touchScreen" value="Y"> <span class="form-control-radio-label">Yes</span>
					<input type="radio" class="form-control-radio" name="touchScreen" id="touchScreen" value="N"> <span class="form-control-radio-label">No</span>
				</div>
			</div>
			<div class="form-group">
				<label for="dualSim" class="col-sm-4 control-label">Dual Sim<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="radio" class="form-control-radio" name="dualSim" id="dualSim" value="Y"> <span class="form-control-radio-label">Yes</span>
					<input type="radio" class="form-control-radio" name="dualSim" id="dualSim" value="N"> <span class="form-control-radio-label">No</span>
				</div>
			</div>		
			<div class="form-group">
				<label for="price" class="col-sm-4 control-label">Price<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" maxlength="6" class="form-control" name="price" id="price" value="30000" required>
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
					<input type="text" class="form-control" maxlength="30" name="ContactPersonName" placeholder="Contact Person Name" value="MGR" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="11" name="ContactNo" placeholder="Contact Number" value="77777766666" required>
				</div>
			</div>
		</div>
	</s:form>

</div>
<div class="col-md-5"></div>
