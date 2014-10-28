<%@ taglib prefix="s" uri="/struts-tags"%>
	<div>
		<input type="hidden" id="subCategory" name="subCategory" value="4">
		<div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Accessory Type<span class="mandatory">*</span></label>
				<div class="col-sm-6" style="padding-top:6px;">
					<s:select class="dropDown" style="height:30px;width:150px;" id="accessoryType" name="accessoryType" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'Pen Drive':'Pen Drive','Hard Disk':'Hard Disk','Memory Card':'Memory Card','Others':'Others'}"
						value="accessoryType" />
					<div class="fieldTip" id="accessoryTypeTip"></div>
					<div class="fieldTip" id="accessoryType_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Price<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="12" name="sprice" id="sprice" value='<s:property value="sprice"/>' 
					required data-validate-type="amount" data-validate-errMessage="Please enter valid Price" data-infoTip="Please enter Price"
					data-minVal="1" data-maxVal="20000">
					<s:checkbox id="negotiable" name="negotiable" fieldValue="true" value="negotiable" label="Negotiable" theme="simple"/><span class="checkBoxText">Negotiable</span><BR>
					<div class="fieldTip" id="spriceTip"></div>
					<div class="fieldTip" id="sprice_Error"></div>
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
		<div class="form-group">
			<label for="description" class="col-sm-3 control-label">Other Features</label>
			<div class="col-sm-7">
				<textarea class="form-control" rows="4" maxlength="250" name="Description" id="Description"><s:property value="Description"/></textarea>
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
	
<script>	
	$(document).ready(function(){
		$("#sprice").on("blur", function(){
			amtStr = $("#sprice").val();
			$("#sprice").val(convertToAmountFormat(amtStr));
		});
	});
</script>
<script>
function localValidations(){
	if($("#accessoryType").val() == "-1"){
		showOrHideErrorTip(false, "accessoryType", "Please choose the Accessory Type");
		return false;
	}
	return validateForm();
}

</script>