<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
	$(document).ready(function(){
		if($('#cityBLR').is(':checked')){
			populateApprovalAuthority("BLR");			
		}else if($('#radio_button').is(':checked')){
			populateApprovalAuthority("CHE");
		}else{
			populateApprovalAuthority("OTHERS");
		}
	});
	
	$(document).ready(function(){
		if(isAnyAdditionalDetailPopulated()){
			//Some details are present in additional details section. Hence EXPAND this section
			$("#collapse_section_1").addClass("in");
		}else{
			//No details are present in additional details section. Hence COLLAPSE this section
			$("#collapse_section_1").removeClass("in");
		}
	});
	
	function isAnyAdditionalDetailPopulated(){
		output = false;
		if(isTextFieldPopulated("BuilderName") || isTextFieldPopulated("FloorNumber")){
			output = true;
		}
		//alert("1 - " + output);
		if(isRadioButtonSelected()){
			output = true;
		}
		//alert("2 - : " + output);
		if(isDropDownSelected("FacingDirection") || isDropDownSelected("ApprovalAuthority")){
			output = true;
		}
		//alert("3 - " + output);
		if(isCheckBoxSelected()){
			output = true;
		}
		//alert("4 - " + output);
		//alert("Returning " + output);
		return output;
	}
	
	function isTextFieldPopulated(fieldName){
		if($("#" + fieldName).val().length === 0){
			return false;
		}else{
			return true;
		}
	}
	
	function isDropDownSelected(fieldName){
		if($("#" + fieldName).val() === "-1"){
			return false;
		}else{
			return true;
		}
	}
	
	function isRadioButtonSelected(){
		if($('#ReadyToOccupyY').is(':checked') || $('#ReadyToOccupyN').is(':checked')) {
			return true;
		}else{
			return false;
		}
	}
	
	function isCheckBoxSelected(){
		if($('#powerBackup').is(':checked') || $('#gym').is(':checked') || $('#carParking').is(':checked')
				 || $('#childrenPlayArea').is(':checked') || $('#clubHouse').is(':checked') || $('#swimmingPool').is(':checked')) {
			return true;
		}else{
			return false;
		}
	}
	
</script>

	<!-- Apartment for Sale - START -->
	<div id="APARTMENT_FOR_SALE">
		<input type="hidden" id="subCategory" name="subCategory" value="1">
		<div>
			<div class="form-group">
				<label class="col-sm-5 control-label">New/Re-sale<span class="mandatory">*</span></label>
				<div class="col-sm-6 radioStrip">
					<s:radio label="Choose New or Resale" theme="simple" name="NewOrResale" id="NewOrResale" list="#{'N':'New','R':'Resale'}" value="postDetails.NewOrResale" />
				</div>
			</div>		
			<div class="form-group">
				<label class="col-sm-5 control-label">No. of Bedrooms<span class="mandatory">*</span></label>
				<div class="col-sm-2">
					<s:select class="dropDown" style="height:30px;width:80px;" id="Bedrooms" name="Bedrooms" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'1':'1', '2':'2', '2.5':'2.5', '3':'3', '4':'4'}"
						value="Bedrooms" />			
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Total Area (sq. ft)<span class="mandatory">*</span></label>
				<div class="col-sm-4">
					<s:if test="Area == ''">
						<input type="text" class="form-control" maxlength="5" name="Area" id="Area" required>
					</s:if>
					<s:else>
						<input type="text" class="form-control" maxlength="5" name="Area" id="Area" value='<s:property value="Area"/>' required>
					</s:else> 
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Price<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<s:if test="PriceValue == ''">
						<input type="text" class="form-control" maxlength="8" name="PriceValue" id="PriceValue" required>
					</s:if>
					<s:else>
						<input type="text" class="form-control" maxlength="8" name="PriceValue" id="PriceValue" value='<s:property value="PriceValue"/>' required>
					</s:else>
					
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Contact Person Name<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="30" name="ContactPersonName" value='<s:property value="ContactPersonName"/>' required>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Contact Number<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="15" name="ContactNo" value='<s:property value="ContactNo"/>' required>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-5 control-label">Other Features</label>
				<div class="col-sm-7">
					<textarea class="form-control" rows="2" maxlength="256" name="Description" id="Description"> <s:property value="Description"/> </textarea>
				</div>
			</div>										
		</div>
		
		<div class="row col-md-12" style="background-color:rgb(240,230,175); margin-left:0px; margin-bottom:10px; padding:10px; text-align:center;">
			<h5 style="color:rgb(127,127,127); font-size:14px;">
				<!-- a href="javascript:animatedcollapse.toggle('accordion_1')"></a-->
				<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_section_1">
          			Additional Details
          			<span class="glyphicon glyphicon-chevron-down"></span>
            	</a>
			</h5>
		</div>
		<div id="collapse_section_1" class="collapse" style="border:1px solid rgb(240,230,175);">
			<div class="form-group">
				<label for="builderName" class="col-sm-5 control-label">Builder Name</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="50" name="BuilderName" id="BuilderName" value="<s:property value='BuilderName'/>">
				</div>
			</div>					
			<div class="form-group" id="readyToOccupyParametersBlock">
				<label class="col-sm-5 control-label">Ready To Occupy</label>
				<div class="col-sm-6 radioStrip">
					<s:radio label="Choose Ready To Occupy" theme="simple" name="ReadyToOccupy" id="ReadyToOccupy" list="#{'Y':'Yes','N':'No'}" value="postDetails.ReadyToOccupy" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Floor No (G-Ground Floor)</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" maxlength="2" name="FloorNumber" id="FloorNumber" value='<s:property value="FloorNumber"/>'>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Facing Direction</label>
				<div class="col-sm-2">
					<s:select class="dropDown" style="height:30px;width:100px;" id="FacingDirection" name="FacingDirection" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'E':'East', 'W':'West', 'N':'North', 'S':'South'}"
						value="FacingDirection" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">Approval Authority</label>
				<div class="col-sm-5">
					<s:select class="dropDown" style="height:30px;width:175px;" id="ApprovalAuthority" name="ApprovalAuthority" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'-1':'Select City'}"
						value="ApprovalAuthority" />					
				</div>
			</div>			
			<div class="form-group">
				<label class="col-sm-5 control-label">Amenities</label>
				<div class="col-sm-6" style="padding-top:10px;">
					<s:checkbox id="powerBackup" name="powerBackup" fieldValue="true" value="powerBackup" label="Power Backup" theme="simple"/><span class="checkBoxText">Power Backup </span><BR>
					<s:checkbox id="gym" name="gym" fieldValue="true" value="gym" label="Gym" theme="simple"/><span class="checkBoxText">Gym </span><BR>
					<s:checkbox id="carParking" name="carParking" fieldValue="true" value="carParking" label="Car Parking" theme="simple"/><span class="checkBoxText">Car Parking</span><BR>
					<s:checkbox id="childrenPlayArea" name="childrenPlayArea" fieldValue="true" value="childrenPlayArea" label="Children Park" theme="simple"/><span class="checkBoxText">Children Park</span><BR>
					<s:checkbox id="clubHouse" name="clubHouse" fieldValue="true" value="clubHouse" label="Club House" theme="simple"/><span class="checkBoxText">Club House </span><BR>
					<s:checkbox id="swimmingPool" name="swimmingPool" fieldValue="true" value="swimmingPool" label="Swimming Pool" theme="simple"/><span class="checkBoxText">Swimming Pool</span><BR>
				</div>
			</div>									
		</div>
		<div style="margin-top:15px;"></div>
		<div class="form-group" style="margin-top:25px;">
			<div class="col-sm-offset-2 col-sm-5">
				<button type="submit" class="btn btn-primary pull-right" onClick="history.go(-1);">Back</button>
			</div>
			<div class="col-sm-offset-1 col-sm-3">
				<button type="submit" class="btn btn-primary pull-right">Post Ad</button>
			</div>
		</div>		
	</div>
	<!-- Apartment for Sale - END -->