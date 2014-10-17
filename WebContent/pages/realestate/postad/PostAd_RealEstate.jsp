<%@ taglib prefix="s" uri="/struts-tags"%>
<div class=" header_2">
	<div class=""></div>
</div>
<style>
	#postAdCategoriesList li{height:40px;}
	.container_of_imgs{width:100%;}
	#content{width:100%; margin-top:20px; margin-left:-60px;}
	.iconButton{width:20px; height:20px; font-size:10px;}
	.addFileIcon{color:rgb(34,177,76); font-size:16px; margin-right:10px;border:0px; cursor:pointer;}
	.deleteFile{color:rgb(255,14,14); font-size:16px; margin-right:10px;border:0px; cursor:pointer;}
	.thumbnailPreview{max-width:70px; min-width:70px; min-height:70px; max-height:70px; margin-right:10px; margin-top:20%; color:#AAAAAA; cursor:pointer;}
	.postAdHeading{font-size:20px; color:#0099CC; font-weight:normal;}
	.fieldTip{margin-top:5px; color:rgb(255,127,0);display:none;}
</style>
<span class="error" style="margin-left:15%;margin-top:1%;"></span>
<div class="row">
	<div class="col-md-2" style="margin-left:0px;">
		<s:url action="post_RealEstate" var="url_REAL_POST" escapeAmp="false"></s:url>
		<s:url action="post_Automobile" var="url_AUTO_POST" escapeAmp="false"></s:url>
		<s:url action="post_Computers" var="url_COMP_POST" escapeAmp="false"></s:url>
		<s:url action="post_Electronics" var="url_ELEC_POST" escapeAmp="false"></s:url>
		<s:url action="post_Mobiles" var="url_MOBILE_POST" escapeAmp="false"></s:url>
		<s:url action="post_Furniture" var="url_FURNITURE_POST" escapeAmp="false"></s:url>
		<div style="color:#555; height:40px; font-size:16px; margin-top:43px;">Change Category</div>			
		<ul id="postAdCategoriesList" style="margin-left:0px;">
		    <li><span style="margin-right:10px;"><img src="./images/common/icons/home_1.png" width="16" height="16"></span><a href='<s:property value="#url_REAL_POST"/>'>Real Estate</a></li>
		    <li><span style="margin-right:10px;"><img src="./images/common/icons/car_2.png" width="16" height="16"></span><a href='<s:property value="#url_AUTO_POST"/>'>Automobiles</a></li>
		    <li><span style="margin-right:10px;"><img src="./images/common/icons/computer_5.png" width="16" height="16"></span><a href='<s:property value="#url_COMP_POST"/>'>Computers</a></li>
		    <li><span style="margin-right:10px;"><img src="./images/common/icons/tv_3.png" width="16" height="16"></span><a href='<s:property value="#url_ELEC_POST"/>'>Home Appliances</a></li>
		    <li><span style="margin-right:10px;"><img src="./images/common/icons/mobile_4.png" width="16" height="16"></span><a href='<s:property value="#url_MOBILE_POST"/>'>Mobiles</a></li>
		    <li><span style="margin-right:10px;"><img src="./images/common/icons/sofa_1.png" width="16" height="16"></span><a href='<s:property value="#url_FURNITURE_POST"/>'>Furniture</a></li>
		</ul>		
	</div>
	<div class="col-md-8" style="margin-left:-50px;">
		<s:form cssClass="form-horizontal post" id="postContentForm" action="real_estate_postAd.action" enctype="multipart/form-data" onsubmit="return validateForm()">
			<input type="hidden" name="category" value="REAL"/>
			<div class="col-md-12">
				<div class="form-group" >
					<label class="col-sm-10 col-sm-offset-3 postAdHeading">
					<span>Post Ad - Real Estate</span> <span style="font-size:12px;"><s:fielderror fieldName="errorMsg"/></span></label>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">Property Type</label>
					<div class="col-sm-7" style="padding-top:6px;">
						<s:select class="dropDown" style="height:30px;width:190px;" id="propertyType" name="propertyType" theme="simple" onChange="displayPostAdSection()"
								headerKey="-1" headerValue="Select"
								list="#{'2':'Apartment For Rent', '4':'Independent House For Rent', '7':'Roommate Required', '1':'Apartment For Sale', '3':'Independent House For Sale', '5':'PG Accommodation', '6':'Plot for Sale'}"
								value="subCategory" />
						<span id="changePropertyType"><a href="#" onclick="return enablePropertyType()">Change</a></span>
					</div>
				</div>	
				<div class="form-group">
					<label for="title" class="col-sm-3 control-label">Title<span class="mandatory">*</span></label>
					<div class="col-sm-7">
						<input type="text" class="form-control" maxlength="200" id="Title" name="Title" value="<s:property value='title'/>" required
							data-infoTip="" data-validate-type="postTitle" data-validate-errMessage="Title should be at least 10 letters long and should have atleast 2 words">
						<div class="fieldTip" id="TitleTip"></div>
						<div class="fieldTip" id="Title_Error"></div>
					</div>
				</div>
				<%@include file="/locationStrip.jsp" %>
				<div class="form-group">
					<label for="title" class="col-sm-3 control-label">Image</label>
					<div class="col-sm-9">
						<div class="fileinput fileinput-new" data-provides="fileinput" style="float:left;">
							<div class="fileinput-preview thumbnail thumbnailPreview" data-trigger="fileinput">Add Photo</div>
							<div>
								<span class="btn-file">
									<span class="fileinput-new">
										<span class="glyphicon glyphicon-plus-sign addFileIcon"></span>
									</span>
									<input type="file" name="upload" id="upload"/>
								</span>
								<a href="#" class="fileinput-exists iconButton" data-dismiss="fileinput">
									<span class="glyphicon glyphicon-remove-circle deleteFile"></span>
								</a>
						  	</div>
						</div>
						<div class="fileinput fileinput-new" data-provides="fileinput" style="float:left;">
							<div class="fileinput-preview thumbnail thumbnailPreview" data-trigger="fileinput">Add Photo</div>
							<div>
								<span class="btn-file">
									<span class="fileinput-new">
										<span class="glyphicon glyphicon-plus-sign addFileIcon"></span>
									</span>
									<input type="file" name="upload" id="upload"/>
								</span>
								<a href="#" class="fileinput-exists iconButton" data-dismiss="fileinput">
									<span class="glyphicon glyphicon-remove-circle deleteFile"></span>
								</a>
						  	</div>
						</div>
						<div class="fileinput fileinput-new" data-provides="fileinput" style="float:left;">
							<div class="fileinput-preview thumbnail thumbnailPreview" data-trigger="fileinput">Add Photo</div>
							<div>
								<span class="btn-file">
									<span class="fileinput-new">
										<span class="glyphicon glyphicon-plus-sign addFileIcon"></span>
									</span>
									<input type="file" name="upload" id="upload"/>
								</span>
								<a href="#" class="fileinput-exists iconButton" data-dismiss="fileinput">
									<span class="glyphicon glyphicon-remove-circle deleteFile"></span>
								</a>
						  	</div>
						</div>
						<div class="fileinput fileinput-new" data-provides="fileinput" style="float:left;">
							<div class="fileinput-preview thumbnail thumbnailPreview" data-trigger="fileinput">Add Photo</div>
							<div>
								<span class="btn-file">
									<span class="fileinput-new">
										<span class="glyphicon glyphicon-plus-sign addFileIcon"></span>
									</span>
									<input type="file" name="upload" id="upload"/>
								</span>
								<a href="#" class="fileinput-exists iconButton" data-dismiss="fileinput">
									<span class="glyphicon glyphicon-remove-circle deleteFile"></span>
								</a>
						  	</div>
						</div>
						<div class="fileinput fileinput-new" data-provides="fileinput" style="float:left;">
							<div class="fileinput-preview thumbnail thumbnailPreview" data-trigger="fileinput">Add Photo</div>
							<div>
								<span class="btn-file">
									<span class="fileinput-new">
										<span class="glyphicon glyphicon-plus-sign addFileIcon"></span>
									</span>
									<input type="file" name="upload" id="upload"/>
								</span>
								<a href="#" class="fileinput-exists iconButton" data-dismiss="fileinput">
									<span class="glyphicon glyphicon-remove-circle deleteFile"></span>
								</a>
						  	</div>
						</div>
					</div>	
				</div>
				<div id="postContent">
					<s:if test="#action.postDetails.subCategory == 1">
						<%@ include file="PostAd_RealEstate_Apartment_For_Sale.jsp" %>
					</s:if>
					<s:elseif test="#action.postDetails.subCategory == 2">
						<%@ include file="PostAd_RealEstate_Apartment_For_Rent.jsp" %>
					</s:elseif>
					<s:elseif test="#action.postDetails.subCategory == 3">
						<%@ include file="PostAd_RealEstate_Ind_House_For_Sale.jsp" %>
					</s:elseif>
					<s:elseif test="#action.postDetails.subCategory == 4">
						<%@ include file="PostAd_RealEstate_Ind_House_For_Rent.jsp" %>
					</s:elseif>
					<s:elseif test="#action.postDetails.subCategory == 5">
						<%@ include file="PostAd_RealEstate_PG_Accommodation.jsp" %>
					</s:elseif>
					<s:elseif test="#action.postDetails.subCategory == 6">
						<%@ include file="PostAd_RealEstate_Land_For_Sale.jsp" %>
					</s:elseif>
					<s:elseif test="#action.postDetails.subCategory == 7">
						<%@ include file="PostAd_RealEstate_Roommate_Required.jsp" %>
					</s:elseif>
				</div>
			</div>
		</s:form>
	
	</div>
</div>
 

<script>
	function displayPostAdSection(){
		var selectedOption = $("#propertyType").val();
		
		updateToolTip(selectedOption);
		
		$("#subCategory").val(selectedOption);
		
		$.ajax({
			url: "Virat" + "/getDetailsSection?",
			//url:$('#contextPath').text() + "getLocation",
			type: "POST",
			data: {subCategory:$("#propertyType").val()},
			success: function(data) {
				$("#postContent").html(data);
				attachEventHandlers();
				expandOrCollapseAdditionalSection();
			},
			error: function (error) {
				alert('error: ' + error.responseText);
			}
		});
		$("#propertyType").prop("disabled", true);
		$("#propertyType").css("background-color", "#FAFAFA");
		$("#changePropertyType").show();
	}
	$(document).ready(function(){
		if($("#cityBLR").val() !== ""){
			populateApprovalAuthority($("#cityBLR").val());
		}else if($("#cityCHE").val() !== ""){
			populateApprovalAuthority($("#cityCHE").val());
		}
		var x = "<s:property value='ApprovalAuthority'/>";
		$("#ApprovalAuthority").val(x);
	});
	
	function updateToolTip(subCategory){
		if(subCategory == "1"){$("#Title").attr("data-infoTip", "E.g. 'Ready to move in 2BHK for Sale near Electronics City'");}
		else if(subCategory == "2"){$("#Title").attr("data-infoTip", "E.g. 1BHK for Rent in excellent location in BTM");}
		else if(subCategory == "3"){$("#Title").attr("data-infoTip", "E.g. 4BHK for immediate Sale near Silk Board");}
		else if(subCategory == "4"){$("#Title").attr("data-infoTip", "E.g. Fully furnished 2 BHK for Rent (Raja Rajeshwari Nagar)");}
		else if(subCategory == "5"){$("#Title").attr("data-infoTip", "E.g. Reliable Ladies PG in Basavangudi");}
		else if(subCategory == "6"){$("#Title").attr("data-infoTip", "E.g. Agricultural Land for Sale in Kammmanahalli");}
		else if(subCategory == "7"){$("#Title").attr("data-infoTip", "E.g. Looking for a Male Roommate, Electronics City");}
	}
</script>
<script>

function cityChangeNotification(city){
	//Clearing any tooltip/error
	showOrHideErrorTip(true, "city", "");
	populateApprovalAuthority(city);
}


function populateApprovalAuthority(city){
	$("#ApprovalAuthority").html("");
	if(city == 'CHE'){
		$("#ApprovalAuthority").append("<option value='-1'>Select</option>");
		$("#ApprovalAuthority").append("<option value='CMDA'>CMDA</option>");
		$("#ApprovalAuthority").append("<option value='NONE'>No Approval</option>");
		$("#ApprovalAuthority").append("<option value='Others'>Others</option>");
	}else if(city == 'BLR'){
		$("#ApprovalAuthority").append("<option value='-1'>Select</option>");
		$("#ApprovalAuthority").append("<option value='DC'>District Commissioner</option>");
		$("#ApprovalAuthority").append("<option value='BDA'>BDA</option>");
		$("#ApprovalAuthority").append("<option value='BMRDA'>BMRDA</option>");
		$("#ApprovalAuthority").append("<option value='BBMP'>BBMP</option>");
		$("#ApprovalAuthority").append("<option value='NONE'>No Approval</option>");
		$("#ApprovalAuthority").append("<option value='Others'>Others</option>");		
	}else{
		$("#ApprovalAuthority").append("<option value='-1'>Select</option>");
		$("#ApprovalAuthority").append("<option value='NONE'>No Approval</option>");
		$("#ApprovalAuthority").append("<option value='OTH'>Others</option>");
	} 
}
function addOption(selectbox, text, value){
	var optn = document.createElement("OPTION");
	optn.text = text;
	optn.value = value;
	selectbox.options.add(optn);
}
function enablePropertyType(){
	$("#propertyType").prop("disabled", false);
	$("#propertyType option[value='-1']").remove();
	$("#propertyType").css("background-color", "#FFFFFF");
	$("#changePropertyType").hide();
	return false;
}
function deactivatePropertyType(){
	$("#propertyType").prop("disabled", true);
	$("#propertyType option[value='-1']").remove();
	$("#propertyType").css("background-color", "#FAFAFA");
	$("#changePropertyType").show();
	return false;
}
$(document).ready(function(){
	$("#changePropertyType").hide();
	isLoaded = "<s:property value="subCategory" />";
	if (isLoaded == "") {

	}else{
		deactivatePropertyType();
	}
});
</script>

<script src="js/formValidations.js"></script>