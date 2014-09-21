<%@ taglib prefix="s" uri="/struts-tags"%>

	<!-- Apartment for Sale - START -->
	<div id="APARTMENT_FOR_SALE">
		<input type="hidden" id="subCategory" name="subCategory" value="3">
		<div>
			<div class="form-group">
				<label class="col-sm-3 control-label">New/Re-sale<span class="mandatory">*</span></label>
				<div class="col-sm-6 radioStrip">
					<s:radio label="Choose New or Resale" theme="simple" name="NewOrResale" id="NewOrResale" list="#{'N':'New','R':'Resale'}" value="postDetails.NewOrResale" />
				</div>
			</div>		
			<div class="form-group">
				<label class="col-sm-3 control-label">No. of Bedrooms<span class="mandatory">*</span></label>
				<div class="col-sm-2">
					<s:select class="dropDown" style="height:30px;width:80px;" id="Bedrooms" name="Bedrooms" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'1':'1', '2':'2', '2.5':'2.5', '3':'3', '4':'4'}"
						value="Bedrooms" />			
				</div>
			</div>
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
					data-minVal="100000" data-maxVal="500000000">
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
				<a class="heading_link" data-toggle="collapse" data-parent="#accordion" href="#collapse_section_3">
          			<span class="glyphicon glyphicon-info-sign" style="color:rgb(255,201,14); font-size:16px; margin-right:10px;"></span>Click here to fill Additional Details
          			<span class="glyphicon glyphicon-chevron-down"></span>
            	</a>
			</h5>
		</div>
		<div id="collapse_section_3" class="collapse">
			<div class="form-group">
				<label for="builderName" class="col-sm-3 control-label">Builder Name</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" maxlength="50" name="BuilderName" id="BuilderName" value="<s:property value='BuilderName'/>">
				</div>
			</div>					
			<div class="form-group" id="readyToOccupyParametersBlock">
				<label class="col-sm-3 control-label">Ready To Occupy</label>
				<div class="col-sm-6 radioStrip">
					<s:radio label="Choose Ready To Occupy" theme="simple" name="ReadyToOccupy" id="ReadyToOccupy" list="#{'Y':'Yes','N':'No'}" value="postDetails.ReadyToOccupy" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">No. of Bathrooms</label>
				<div class="col-sm-2">
					<s:select class="dropDown" style="height:30px;width:80px;" id="Bathrooms" name="Bathrooms" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'1':'1', '2':'2', '3':'3', '4':'4'}"
						value="Bathrooms" />			
				</div>
			</div>			
			<div class="form-group">
				<label class="col-sm-3 control-label">Floor No</label>
				<div class="col-sm-2">
					<s:select class="dropDown" style="height:30px;width:80px;" id="FloorNumber" name="FloorNumber" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'G':'Ground', '1':'1', '2':'2', '3':'3', '4':'4', '5':'5', '6':'6', '7':'7', '8':'8', '9':'9', '10':'10',
								'11':'11', '12':'12', '13':'13', '14':'14', '15':'15', '16':'16', '17':'17', '18':'18', '19':'19', '20':'20',
								'21':'21', '22':'22', '23':'23', '24':'24', '25':'25'}"
						value="FloorNumber" />	
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Facing Direction</label>
				<div class="col-sm-2">
					<s:select class="dropDown" style="height:30px;width:100px;" id="FacingDirection" name="FacingDirection" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'E':'East', 'W':'West', 'N':'North', 'S':'South', 'NE':'North East', 'NW':'North West', 'SE':'South East', 'SW':'South West'}"
						value="FacingDirection" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">Approval Authority</label>
				<div class="col-sm-5">
					<s:select class="dropDown" style="height:30px;width:175px;" id="ApprovalAuthority" name="ApprovalAuthority" theme="simple"
						headerKey="-1" headerValue="Select"
						list="#{'-1':'Select City'}"
						value="ApprovalAuthority" />					
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
	<!-- Apartment for Sale - END -->
	
	<script>
	$(document).ready(function(){
		if(isAnyAdditionalDetailPopulated()){
			//Some details are present in additional details section. Hence EXPAND this section
			$("#collapse_section_3").addClass("in");
		}else{
			//No details are present in additional details section. Hence COLLAPSE this section
			$("#collapse_section_3").removeClass("in");
		}
	});
	
	function isAnyAdditionalDetailPopulated(){
		output = false;
		if(isTextFieldPopulated("BuilderName")){
			output = true;
		}
		//alert("1 - " + output);
		if(isRadioButtonSelected()){
			output = true;
		}
		//alert("2 - : " + output);
		if(isDropDownSelected("FacingDirection") || isDropDownSelected("ApprovalAuthority") 
				|| isDropDownSelected("Bathrooms") || isDropDownSelected("FloorNumber")){
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
	
	$(document).ready(function(){
		$("#sprice").on("blur", function(){
			amtStr = $("#sprice").val();
			$("#sprice").val(convertToAmountFormat(amtStr));
		});
	});
</script>
