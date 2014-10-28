<%@ taglib prefix="s" uri="/struts-tags"%>

	<div>
		<input type="hidden" id="subCategory" name="subCategory" value="1">
		<div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Make<span class="mandatory">*</span></label>
				<div class="col-sm-6" style="padding-top:6px;">
					<s:select class="dropDown" style="height:30px;width:80px;" id="make" name="make" theme="simple"
					headerKey="-1" headerValue="Select" 
					list="#{'Acer':'Acer','Compaq':'Compaq','Dell':'Dell','HP':'HP','IBM':'IBM','LG':'LG','Wipro':'Wipro','Others':'Others'}" 
					value="make" />
					<div class="fieldTip" id="makeTip"></div>
					<div class="fieldTip" id="make_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Age in Years<span class="mandatory">*</span></label>
				<div class="col-sm-3" style="padding-top:6px;">
					<s:select class="dropDown" style="height:30px;width:120px;" id="year" name="year" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'1':'< 1 year old','2':'1-2 years old','3':'2-3 years old','4':'3-4 years old','5':'4-5 years old','6':'> 5 years old'}"
						value="year" />				
					<div class="fieldTip" id="yearTip"></div>
					<div class="fieldTip" id="year_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Price<span class="mandatory">*</span></label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="12" name="sprice" id="sprice" value='<s:property value="sprice"/>' 
					required data-validate-type="amount" data-validate-errMessage="Please enter valid Price" data-infoTip="Please enter Price"
					data-minVal="1000" data-maxVal="100000">
					<s:checkbox id="negotiable" name="negotiable" fieldValue="true" value="negotiable" label="Negotiable" theme="simple"/><span class="checkBoxText">Negotiable</span><BR>
					<div class="fieldTip" id="spriceTip"></div>
					<div class="fieldTip" id="sprice_Error"></div>
				</div>
			</div>			
			<div class="form-group">
				<label class="col-sm-3 control-label">RAM Size (in GB)<span class="mandatory">*</span></label>
				<div class="col-sm-4">
					<s:select class="dropDown" style="height:30px;width:120px;" id="processorSize" name="processorSize" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'1':'< 1 GB','2':'1 GB','3':'2 GB','4':'3 GB','5':'4 GB','6':'8 GB','7':'16 GB','8':'32 GB','9':'64 GB'}"
						value="processorSize" />	
					<div class="fieldTip" id="processorSizeTip"></div>
					<div class="fieldTip" id="processorSize_Error"></div>
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
				<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_section_2">
          			<span class="glyphicon glyphicon-info-sign" style="color:rgb(255,201,14); font-size:16px; margin-right:10px;"></span>Click here to fill Additional Details
          			<span class="glyphicon glyphicon-chevron-down"></span>
            	</a>
			</h5>
		</div>
		<div id="collapse_section_2" class="collapse">
			<div class="form-group">
				<label class="col-sm-3 control-label">HDD Size (in GB)</label>
				<div class="col-sm-3">
					<s:if test="hddSize == \"0\"">
						<input type="text" class="form-control" maxlength="4" name="hddSize" id="hddSize" value='' 
						data-validate-type="number" data-validate-errMessage="Please enter valid HDD Size" data-infoTip="Please enter Hardisk Capacity"
						data-minVal="1" data-maxVal="4000">	
					</s:if>
					<s:else>
						<input type="text" class="form-control" maxlength="4" name="hddSize" id="hddSize" value='<s:property value="hddSize"/>' 
						data-validate-type="number" data-validate-errMessage="Please enter valid HDD Size" data-infoTip="Please enter Hardisk Capacity"
						data-minVal="1" data-maxVal="4000">	
					</s:else>
					
					<div class="fieldTip" id="hddSizeTip"></div>
					<div class="fieldTip" id="hddSize_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Model</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" maxlength="20" name="model" id="model" value='<s:property value="model"/>' 
					 data-infoTip="Please enter the Model"> 
					<div class="fieldTip" id="modelTip"></div>
					<div class="fieldTip" id="model_Error"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-3 control-label">Other Features</label>
				<div class="col-sm-7">
					<textarea class="form-control" rows="4" maxlength="250" name="Description" id="Description"><s:property value="Description"/></textarea>
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
	
	<script>
	$(document).ready(function(){
		if(isAnyAdditionalDetailPopulated()){
			//Some details are present in additional details section. Hence EXPAND this section
			$("#collapse_section_2").addClass("in");
		}else{
			//No details are present in additional details section. Hence COLLAPSE this section
			$("#collapse_section_2").removeClass("in");
		}
	});
	
	function isAnyAdditionalDetailPopulated(){
		output = false;
		if(isTextFieldPopulated("hddSize", "Description", "model")){
			output = true;
		}

		return output;
	}
	
	$(document).ready(function(){
		$("#sprice").on("blur", function(){
			amtStr = $("#sprice").val();
			$("#sprice").val(convertToAmountFormat(amtStr));
		});
	});
</script>
<script>

function localValidations(){
	if($("#cityBLR").attr("checked") != "checked" && $("#cityCHE").attr("checked") != "checked"){
		showOrHideErrorTip(false, "city", "Please select a City");
		$("#cityBLR").focus();
		return false;
	}
	if($("#make").val() == "-1"){
		showOrHideErrorTip(false, "make", "Please choose a Make");
		return false;
	}
	if($("#processorSize").val() == "-1"){
		showOrHideErrorTip(false, "processorSize", "Please specify Processor Size");
		return false;
	}
	if($("#year").val() == "-1"){
		showOrHideErrorTip(false, "year", "How old is your Computer?");
		return false;
	}

	return validateForm();
}

function attachClearEventsToDropDown(){
	$("select").each(function(){
		//HTML to JQuery Element
		var jqueryElement = $(this);
		var elementId = $(jqueryElement).attr("id");
		var infoTipDivTagName = "#" + elementId + "Tip";
		var errorDivTagName = "#" + elementId + "_Error";
		var third = "Hello";
		
		$(jqueryElement).change({elementId:elementId}, function (event){
			info = "#" + event.data.elementId + "Tip";
			err = "#" + event.data.elementId + "_Error";

			$(info).html("");
			$(err).html("");
		});
	});
}

$(document).ready(function(){
	//To reset error/info messages of SELECT elements, on change event.
	attachClearEventsToDropDown();
});

</script>



