<%@ taglib prefix="s" uri="/struts-tags"%>

<script>

	$(document).ready(function(){
		if(isAnyAdditionalDetailPopulated()){
			//Some details are present in additional details section. Hence EXPAND this section
			$("#collapse_section_7").addClass("in");
		}else{
			//No details are present in additional details section. Hence COLLAPSE this section
			$("#collapse_section_7").removeClass("in");
		}
	});
	
	function isAnyAdditionalDetailPopulated(){
		output = false;
		if(isTextFieldPopulated()){
			output = true;
		}
		
		/*if(isRadioButtonSelected()){
			output = true;
		}*/
		
		if(isDropDownSelected()){
			output = true;
		}
		
		if(isCheckBoxSelected()){
			output = true;
		}
		
		return output;
	}
	
	function isTextFieldPopulated(){
		var a = $("#Deposit").val().length;
		var c = $("#noOfRoommates").val().length;
		
		if(a !== 0 || c !== 0){
			return true;
		}else{
			return false;
		}
	}
	
	function isDropDownSelected(fieldName){
		if($("#regionalPreference").val() === "-1"){
			return false;
		}else{
			return true;
		}
	}
	
	/*function isRadioButtonSelected(){
		if($('#foodY').is(':checked') || $('#foodN').is(':checked')) {
			return true;
		}else{
			return false;
		}
	}*/
	
	function isCheckBoxSelected(){
		if($('#powerBackup').is(':checked') || $('#gym').is(':checked') || $('#carParking').is(':checked')
				 || $('#wifi').is(':checked')) {
			return true;
		}else{
			return false;
		}
	}
	
</script>

	<!-- Roommate Required - START -->
	<div id="ROOMMATE_REQUIRED">
		<input type="hidden" id="subCategory" name="subCategory" value="7">
		<div>
			<div class="form-group">
				<label for="gender" class="col-sm-3 control-label">Gender<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<s:radio label="Choose Preference" theme="simple" name="gender" id="gender" list="#{'M':'Male','F':'Female'}" value="postDetails.gender" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Rent (per person)<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<s:if test="PriceValue == ''">
						<input type="text" class="form-control" maxlength="5" name="PriceValue" id="PriceValue" required>
					</s:if>
					<s:else>
						<input type="text" class="form-control" maxlength="5" name="PriceValue" id="PriceValue" value='<s:property value="PriceValue"/>' required>
					</s:else>
					
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Contact Person Name<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="30" name="ContactPersonName" value='<s:property value="ContactPersonName"/>' required>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Contact Number<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="15" name="ContactNo" value='<s:property value="ContactNo"/>' required>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-3 control-label">Other Features</label>
				<div class="col-sm-7">
					<textarea class="form-control" rows="2" maxlength="256" name="Description" id="Description"> <s:property value="Description"/> </textarea>
				</div>
			</div>										
		</div>
		
		<div class="row col-md-12" style="margin-left:0px; margin-bottom:10px; padding:10px; text-align:center;">
			<h5 style="color:rgb(127,127,127); font-size:14px;">
				<!-- a href="javascript:animatedcollapse.toggle('accordion_1')"></a-->
				<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_section_7">
          			<span class="glyphicon glyphicon-info-sign" style="color:rgb(255,201,14); font-size:16px; margin-right:10px;"></span>Click here to fill Additional Details
          			<span class="glyphicon glyphicon-chevron-down"></span>
            	</a>
			</h5>
		</div>
		<div id="collapse_section_7" class="collapse">
			<div class="form-group">
				<label for="noOfRoommates" class="col-sm-3 control-label">Number of Occupants</label>
				<div class="col-sm-3">
					<s:if test="noOfRoommates == ''">
						<input type="text" class="form-control" maxlength="1" name="noOfRoommates" id="noOfRoommates">
					</s:if>
					<s:else>
						<input type="text" class="form-control" maxlength="1" name="noOfRoommates" id="noOfRoommates" value="<s:property value='noOfRoommates'/>">
					</s:else>
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-3 control-label">Security Deposit</label>
				<div class="col-sm-3">
					<s:if test="Deposit== ''">
						<input type="text" class="form-control" maxlength="6" name="Deposit" id="Deposit" value=''>
					</s:if>
					<s:else>
						<input type="text" class="form-control" maxlength="6" name="Deposit" id="Deposit" value='<s:property value="Deposit"/>'>
					</s:else>
				</div>
			</div>			
			<div class="form-group">
				<label for="regionalPreference" class="col-sm-3 control-label">Language Preference</label>
				<div class="col-sm-6" style="padding-top:6px;">
					<s:select class="dropDown" style="height:30px;width:190px;" id="regionalPreference" name="regionalPreference" theme="simple"
							headerKey="-1" headerValue="Select"
							list="#{'No Preference':'No Preference', 'Hindi':'Hindi', 'Kannada':'Kannada', 'Tamil':'Tamil', 'Telugu':'Telugu', 'Malayalam':'Malayalam'}"
							value="regionalPreference" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Amenities</label>
				<div class="col-sm-6" style="padding-top:10px;">
					<s:checkbox id="powerBackup" name="powerBackup" fieldValue="true" value="powerBackup" label="Power Backup" theme="simple"/><span class="checkBoxText">Power Backup </span><BR>
					<s:checkbox id="carParking" name="carParking" fieldValue="true" value="carParking" label="Car Parking" theme="simple"/><span class="checkBoxText">Car Parking</span><BR>
					<s:checkbox id="wifi" name="wifi" fieldValue="true" value="wifi" label="Wi-Fi" theme="simple"/><span class="checkBoxText">Wi-Fi / Internet</span><BR>
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
	<!-- Roommate Required- END -->