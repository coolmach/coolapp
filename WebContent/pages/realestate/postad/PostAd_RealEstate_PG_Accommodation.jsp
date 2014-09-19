<%@ taglib prefix="s" uri="/struts-tags"%>


	<!-- PG Accommodation - START -->
	<div id="PG_ACCOMMODATION">
		<input type="hidden" id="subCategory" name="subCategory" value="5">
		<div>
			<div class="form-group">
				<label for="gender" class="col-sm-3 control-label">Gender<span class="mandatory">*</span></label>
				<div class="col-sm-6">
					<s:radio label="Choose Preference" theme="simple" name="gender" id="gender" list="#{'M':'Male','F':'Female'}" value="postDetails.gender" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Rent<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="12" name="sprice" id="sprice" value='<s:property value="sprice"/>' 
					required data-validate-type="amount" data-validate-errMessage="Please enter valid Rent" data-infoTip="Please enter Rent"
					data-minVal="3000" data-maxVal="50000">
					<div class="fieldTip" id="spriceTip"></div>
					<div class="fieldTip" id="sprice_Error"></div>
					<!--div id="amtInWords" style="margin-left:10px; font-size:12px; color:#AAAAAA;"></div-->
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Contact Person Name<span class="mandatory">*</span></label>
				<div class="col-sm-4">
					<input type="text" class="form-control" maxlength="30" name="ContactPersonName" id="ContactPersonName" value='<s:property value="ContactPersonName"/>' required data-validate-type="personName" data-validate-errMessage="Please enter valid Name" data-infoTip="Please enter Contact Person Name">
					<div class="fieldTip" id="ContactPersonNameTip"></div>
					<div class="fieldTip" id="ContactPersonName_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Contact Number<span class="mandatory">*</span></label>
				<div class="col-sm-4">
					<input type="text" class="form-control" maxlength="15" name="ContactNo" id="ContactNo" value='<s:property value="ContactNo"/>' required data-validate-type="phoneNumber" data-validate-errMessage="Please enter valid Phone Number" data-infoTip="Please enter Phone number">
					<div class="fieldTip" id="ContactNoTip"></div>
					<div class="fieldTip" id="ContactNo_Error"></div>
				</div>
			</div>									
		</div>
		
		<div class="row col-md-12" style="margin-left:0px; margin-bottom:10px; padding:10px;">
			<h5 style="color:rgb(127,127,127); font-size:14px;">
				<!-- a href="javascript:animatedcollapse.toggle('accordion_1')"></a-->
				<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_section_5">
          			<span class="glyphicon glyphicon-info-sign" style="color:rgb(255,201,14); font-size:16px; margin-right:10px;"></span>Click here to fill Additional Details
          			<span class="glyphicon glyphicon-chevron-down"></span>
            	</a>
			</h5>
		</div>
		<div id="collapse_section_5" class="collapse">
			<div class="form-group">
				<label for="gender" class="col-sm-3 control-label">Food</label>
				<div class="col-sm-6">
					<s:radio label="Choose Preference" theme="simple" name="food" id="food" list="#{'Y':'Yes','N':'No'}" value="postDetails.food" />
				</div>
			</div>
			<div class="form-group">
				<label for="builderName" class="col-sm-3 control-label">PG Name</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="50" name="BuilderName" id="BuilderName" value="<s:property value='BuilderName'/>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Amenities</label>
				<div class="col-sm-6" style="padding-top:10px;">
					<s:checkbox id="powerBackup" name="powerBackup" fieldValue="true" value="powerBackup" label="Power Backup" theme="simple"/><span class="checkBoxText">Power Backup </span><BR>
					<s:checkbox id="gym" name="gym" fieldValue="true" value="gym" label="Gym" theme="simple"/><span class="checkBoxText">Gym </span><BR>
					<s:checkbox id="carParking" name="carParking" fieldValue="true" value="carParking" label="Car Parking" theme="simple"/><span class="checkBoxText">Car Parking</span><BR>
					<s:checkbox id="wifi" name="wifi" fieldValue="true" value="wifi" label="Wi-Fi" theme="simple"/><span class="checkBoxText">Wi-Fi / Internet</span><BR>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-3 control-label">Other Features</label>
				<div class="col-sm-7">
					<textarea class="form-control" rows="4" maxlength="256" name="Description" id="Description"> <s:property value="Description"/> </textarea>
				</div>
			</div>													
		</div>
		<div style="margin-top:15px;"></div>
		<div class="form-group" style="margin-top:25px;">
			<div class="col-sm-5">
				<button type="submit" class="btn btn-primary pull-right" onClick="history.go(-1);">Back</button>
			</div>
			<div class="col-sm-3">
				<button type="submit" class="btn btn-primary pull-right">Post Ad</button>
			</div>
		</div>		
	</div>
	<!-- PG Accommodation - END -->
	
	<script>

	$(document).ready(function(){
		if(isAnyAdditionalDetailPopulated()){
			//Some details are present in additional details section. Hence EXPAND this section
			$("#collapse_section_5").addClass("in");
		}else{
			//No details are present in additional details section. Hence COLLAPSE this section
			$("#collapse_section_5").removeClass("in");
		}
	});
	
	function isAnyAdditionalDetailPopulated(){
		output = false;
		if(isTextFieldPopulated()){
			output = true;
		}
		
		if(isRadioButtonSelected()){
			output = true;
		}
		
		/*if(isDropDownSelected()){
			output = true;
		}*/
		
		if(isCheckBoxSelected()){
			output = true;
		}
		
		return output;
	}
	
	function isTextFieldPopulated(){
		if($("#BuilderName").val().length === 0){
			return false;
		}else{
			return true;
		}
	}
	
	/*function isDropDownSelected(fieldName){
		if($("#FacingDirection").val() === "-1"){
			return false;
		}else{
			return true;
		}
	}*/
	
	function isRadioButtonSelected(){
		if($('#foodY').is(':checked') || $('#foodN').is(':checked')) {
			return true;
		}else{
			return false;
		}
	}
	
	function isCheckBoxSelected(){
		if($('#powerBackup').is(':checked') || $('#gym').is(':checked') || $('#carParking').is(':checked')
				 || $('#wifi').is(':checked')) {
			return true;
		}else{
			return false;
		}
	}
	
	$(document).ready(function(){
		$("#sprice").on("blur", function(){
			amtStr = $("#sprice").val();
			$("#sprice").val(convertToAmountFormat(amtStr));
		});
		$("#smaintenance").on("blur", function(){
			amtStr = $("#smaintenance").val();
			$("#smaintenance").val(convertToAmountFormat(amtStr));
		});
		$("#sdeposit").on("blur", function(){
			amtStr = $("#sdeposit").val();
			$("#sdeposit").val(convertToAmountFormat(amtStr));
		});
	});
</script>