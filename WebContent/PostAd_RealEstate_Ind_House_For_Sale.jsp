<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/Cbuddy.css"/>
<script>
	function toggle(newOrResale){
		if(newOrResale == "New"){
			$("#ageBlock").hide();
			$("#completionBlock").hide();
			$("#readyToOccupyParametersBlock").show();
			$("#readyToOccupy_Y").attr("checked", true);
			$("#readyToOccupy_N").attr("checked", false);
			
		}else{
			$("#readyToOccupyParametersBlock").hide();
			$("#completionDateBlock").hide();
			$("#ageBlock").show();
		}
	}
	function toggleNew(isReadyToOccupy){
		if(isReadyToOccupy == "No"){
			$("#completionDateBlock").show();
		}else{
			$("#completionDateBlock").hide();
		}
	}
</script>
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
		<input type="hidden" name="subCategory" value="3"/>
		<div class="col-md-12 post_title">Individual House for Sale</div>
	   <div class="col-md-8">
			<div class="form-group">
				<label for="title" class="col-sm-4 control-label">Title</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="Title" name="Title" value="2BHK For Sale">
				</div>
			</div>
			<div class="form-group">
				<label for="location" class="col-sm-4 control-label">City</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="City" id="City" value="BLR">
				</div>
			</div>			
			<div class="form-group">
				<label for="location" class="col-sm-4 control-label">Location</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="Location" id="Location" value="46">
				</div>
			</div>
			<div class="form-group">
				<label for="rent" class="col-sm-4 control-label">New/Re-sale</label>
				<div class="col-sm-6 radioStrip">
					<input type="radio" id="newOrResale_N" name="NewOrResale" value="N" checked onClick="toggle('New')"><span class="radioText">New</span>
					<input type="radio" id="newOrResale_R" name="NewOrResale" value="R" onClick="toggle('Resale')"><span class="radioText">Re-sale</span>
				</div>
			</div>	
			<div class="form-group" id="readyToOccupyParametersBlock">
				<label for="rent" class="col-sm-4 control-label">Ready To Occupy</label>
				<div class="col-sm-6 radioStrip">
					<input type="radio" id="readyToOccupy_Y" name="ReadyToOccupy" value="Y" checked onClick="toggleNew('Yes')"><span class="radioText">Yes</span>
					<input type="radio" id="readyToOccupy_N" name="ReadyToOccupy" value="N" onClick="toggleNew('No')"><span class="radioText">No</span>
				</div>
			</div>				
			<div class="form-group" id="ageBlock" style="display:none;">
				<label for="ageValue" class="col-sm-4 control-label">&nbsp;</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="AgeValue" id="AgeValue" placeholder="Age (in years)">
				</div>
			</div>
			<div class="form-group" id="completionDateBlock" style="display:none;">
				<label for="expectedCompletionDate" class="col-sm-4 control-label">&nbsp;</label>
				<div class="col-sm-6"> 
					<input type="text" class="form-control" name="ExpectedCompletionDate" id="ExpectedCompletionDate" placeholder="Expected Completion Date">
				</div>
			</div>
			<div class="form-group">
				<label for="area" class="col-sm-4 control-label">Total Area (sq. ft)</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="Area" id="Area" value="1200"> 
				</div>
			</div>
			<div class="form-group">
				<label for="bedrooms" class="col-sm-4 control-label">Bedrooms</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="Bedrooms" id="Bedrooms" value="2">
				</div>
			</div>
			<div class="form-group">
				<label for="floorNumber" class="col-sm-4 control-label">Floor No</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="FloorNumber" id="FloorNumber" value="G">
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-4 control-label">Price</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="PriceValue" id="PriceValue" value="3000000">
				</div>
			</div>
			<div class="form-group">
				<label for="facingDirection" class="col-sm-4 control-label">Facing Direction</label>
				<div class="col-sm-6" style="padding-top:6px;">
					<select class="dropDown" name="FacingDirection" id="FacingDirection">
						<option value="N">North</option>
						<option value="S">South</option>
						<option value="E">East</option>
						<option value="W">West</option>
					</select>
				</div>
			</div>		
			<div class="form-group">
				<label for="approvalAuthority" class="col-sm-4 control-label">Approval Authority</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="ApprovalAuthority" id="ApprovalAuthority" value="BDA">
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