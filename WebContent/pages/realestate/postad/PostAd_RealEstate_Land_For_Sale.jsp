<%@ taglib prefix="s" uri="/struts-tags"%>

	<!-- Plot For Sale - START -->
	<div id="LAND_FOR_SALE">
		<input type="hidden" id="subCategory" name="subCategory" value="6">
		<div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Total Area (sq. ft)<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<s:if test="Area == ''">
						<input type="text" class="form-control" maxlength="5" name="Area" id="Area" required data-validate-type="numeric" data-validate-errMessage="Please enter valid Area" data-infoTip="Please enter Area in sq.ft">
					</s:if>
					<s:else>
						<input type="text" class="form-control" maxlength="5" name="Area" id="Area" value='<s:property value="Area"/>' required data-validate-type="numeric" data-validate-errMessage="Please enter valid Area" data-infoTip="Please enter Area in sq.ft">
					</s:else>
					<div class="fieldTip" id="AreaTip"></div>
					<div class="fieldTip" id="Area_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Price<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="12" name="sprice" id="sprice" value='<s:property value="sprice"/>' 
					required data-validate-type="amount" data-validate-errMessage="Please enter valid Price" data-infoTip="Please enter Price"
					data-minVal="20000" data-maxVal="500000000">
					<s:checkbox id="negotiable" name="negotiable" fieldValue="true" value="negotiable" label="Negotiable" theme="simple"/><span class="checkBoxText">Negotiable</span><BR>
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
				<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_section_6">
          			<span class="glyphicon glyphicon-info-sign" style="color:rgb(255,201,14); font-size:16px; margin-right:10px;"></span>Click here to fill Additional Details
          			<span class="glyphicon glyphicon-chevron-down"></span>
            	</a>
			</h5>
		</div>
		<div id="collapse_section_6" class="collapse">
			<div class="form-group">
				<label class="col-sm-3 control-label">Approval Authority</label>
				<div class="col-sm-5">
					<s:select class="dropDown" style="height:30px;width:175px;" id="ApprovalAuthority" name="ApprovalAuthority" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'-1':'Select City'}"
						value="<s:property value='ApprovalAuthority'/>" />		
				</div>
			</div>
			<div class="form-group">
				<label for="builderName" class="col-sm-3 control-label">Promoter's Name</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" maxlength="50" name="BuilderName" id="BuilderName" value="<s:property value='BuilderName'/>">
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
	<!-- Plot For Sale - END -->
	
	<script>

	$(document).ready(function(){
		if(isAnyAdditionalDetailPopulated()){
			//Some details are present in additional details section. Hence EXPAND this section
			$("#collapse_section_6").addClass("in");
		}else{
			//No details are present in additional details section. Hence COLLAPSE this section
			$("#collapse_section_6").removeClass("in");
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
		
		/*if(isCheckBoxSelected()){
			output = true;
		}*/
		
		return output;
	}
	
	function isTextFieldPopulated(){
		if($("#BuilderName").val().length === 0){
			return false;
		}else{
			return true;
		}
	}
	
	function isDropDownSelected(fieldName){
		if($("#ApprovalAuthority").val() === "-1"){
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
	}
	
	function isCheckBoxSelected(){
		if($('#powerBackup').is(':checked') || $('#gym').is(':checked') || $('#carParking').is(':checked')
				 || $('#wifi').is(':checked')) {
			return true;
		}else{
			return false;
		}
	}*/
	
</script>