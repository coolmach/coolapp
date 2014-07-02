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
	<s:form cssClass="form-horizontal post" action="computers_postAd" enctype="multipart/form-data">
		<input type="hidden" name="category" value="COMP"/>
		<input type="hidden" name="subCategory" value="2"/>
		<div class="col-md-12 post_title">
			<div style="float:left;">
				Desktops For Sale
			</div>
			<span class="error"><s:fielderror fieldName="errorMsg"/></span>
		</div>
	   <div class="col-md-8">
			<div class="form-group">
				<label for="title" class="col-sm-4 control-label">Title<span class="mandatory">*</span></label>
				<div class="col-sm-8">
					<input type="text" class="form-control" maxlength="200" id="Title" name="Title" value="256MB RAM available for Sale" required>
				</div>
			</div>
			<%@include file="locationStrip.jsp" %>		
			<div class="form-group">
				<label for="facingDirection" class="col-sm-4 control-label">Make</label>
				<div class="col-sm-6" style="padding-top:6px;">
					<select class="dropDown" name="make" id="make">
						<option value="SON">Sony</option>
						<option value="ACE">Acer</option>
						<option value="DELL">Dell</option>
						<option value="HP">HP/Compaq</option>
						<option value="SAM">Samsung</option>
						<option value="WIP">Wipro</option>
						<option value="HCL">HCL</option>
						<option value="APP">Apple</option>
						<option value="OTH">Others</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="approvalAuthority" class="col-sm-4 control-label">Year</label>
				<div class="col-sm-3">
					<input type="text" maxlength="4" class="form-control" name="year" id="year" value="2007">
				</div>
			</div>
			<div class="form-group">
				<label for="approvalAuthority" class="col-sm-4 control-label">RAM Size<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" maxlength="4" class="form-control" name="processorSize" id="processorSize" value="2"> GB
				</div>
			</div>
			<div class="form-group">
				<label for="approvalAuthority" class="col-sm-4 control-label">HDD Size<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" maxlength="4" class="form-control" name="hddSize" id="hddSize" value="60"> GB
				</div>
			</div>			
			<div class="form-group">
				<label for="description" class="col-sm-4 control-label">Other Features</label>
				<div class="col-sm-8">
					<textarea class="form-control" maxlength="256" rows="3" name="Description" id="Description">Hello tHis is description</textarea>
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