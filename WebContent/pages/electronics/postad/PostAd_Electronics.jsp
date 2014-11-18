<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
$(document).ready(function(){
	updateFormAction();
});

function updateFormAction(){
	postAd_formAction = "";
	var itemType = $("#itemType").val();
	if(itemType == "1"){postAd_formAction = "television_postAd";}
	else if(itemType == "2"){postAd_formAction = "dvd_postAd";}
	else if(itemType == "3"){postAd_formAction = "camera_postAd";}
	else if(itemType == "4"){postAd_formAction = "fridge_postAd";}
	else if(itemType == "5"){postAd_formAction = "washingMachine_postAd";}
	else if(itemType == "6"){postAd_formAction = "airCooler_postAd";}
	
	if($('form').get(0) != null){
		$('form').get(0).setAttribute('action', postAd_formAction);
	}
}
</script>

<script>
	//To retain the form action when the form is reloaded (because of any error during form submit)
	updateFormAction();
</script>

<div class=" header_2">
	<div class=""></div>
</div>
<style>
	#postAdCategoriesList li{height:40px;}
	.container_of_imgs{width:100%;}
	#content{width:100%; margin-top:20px; margin-left:10px;}
	.iconButton{width:20px; height:20px; font-size:10px;}
	.addFileIcon{color:rgb(34,177,76); font-size:16px; margin-right:10px;border:0px; cursor:pointer;}
	.deleteFile{color:rgb(255,14,14); font-size:16px; margin-right:10px;border:0px; cursor:pointer;}
	.thumbnailPreview{max-width:70px; min-width:70px; min-height:70px; max-height:70px; margin-right:10px; margin-top:20%; color:#AAAAAA; cursor:pointer;}
	.postAdHeading{font-size:20px; color:#0099CC; font-weight:normal;}
	.fieldTip{margin-top:5px; color:rgb(255,127,0);display:none;}
</style>
<span class="error" style="margin-left:15%;margin-top:1%;float:none;"></span>
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
		<s:form cssClass="form-horizontal post" id="postContentForm" action="" enctype="multipart/form-data" onsubmit="return localValidations()">
			<input type="hidden" name="category" value="MOBILE"/>
			<div class="col-md-12">
				<div class="form-group" >
					<label class="col-sm-10 col-sm-offset-3 postAdHeading">
					<span>Post Ad - Electronics and Home Appliances</span> <span style="font-size:12px;"><s:fielderror fieldName="errorMsg"/></span></label>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">Item to Sell</label>
					<div class="col-sm-7" style="padding-top:6px;">
						<s:select class="dropDown" style="height:30px;width:190px;" id="itemType" name="itemType" theme="simple" onChange="displayPostAdSection()"
								headerKey="-1" headerValue="Select"
								list="#{'1':'Television', '2':'DVD/Music Player', '3':'Camera, Camcorder','4':'Fridge','5':'Washing Machine','6':'Air Cooler/Conditioner'}"
								value="subCategory" />
						<span id="changeItemType"><a href="#" onclick="return enableItemType()">Change</a></span>
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
					<s:if test="subCategory == 1">
						<%@ include file="./PostAd_Electronics_Television.jsp" %>
					</s:if>
					<s:elseif test="subCategory == 2">
						<%@ include file="./PostAd_Electronics_DVD.jsp" %>
					</s:elseif>
					<s:elseif test="subCategory == 3">
						<%@ include file="./PostAd_Electronics_Camera.jsp" %>
					</s:elseif>
					<s:elseif test="subCategory == 4">
						<%@ include file="./PostAd_Electronics_Fridge.jsp" %>
					</s:elseif>
					<s:elseif test="subCategory == 5">
						<%@ include file="./PostAd_Electronics_WashingMachine.jsp" %>
					</s:elseif>
					<s:elseif test="subCategory == 6">
						<%@ include file="./PostAd_Electronics_AirCooler.jsp" %>
					</s:elseif>																				
				</div>
			</div>
		</s:form>
	
	</div>
</div>

<script>
	function displayPostAdSection(){
		var itemType = $("#itemType").val();
		var formURL = "";
		
		updateToolTip(itemType);
		
		$("#subCategory").val(itemType);
		
		//Chaging form action based on the Appliance selected
		postAd_formAction = "";
		details_formAction = "";
		if(itemType == "1"){details_formAction = "getDetailsSection_Television";}
		else if(itemType == "2"){details_formAction = "getDetailsSection_DVD";}
		else if(itemType == "3"){details_formAction = "getDetailsSection_Camera";}
		else if(itemType == "4"){details_formAction = "getDetailsSection_Fridge";}
		else if(itemType == "5"){details_formAction = "getDetailsSection_WashingMachine";}
		else if(itemType == "6"){details_formAction = "getDetailsSection_AirCooler";}
		
		updateFormAction();
		
		$.ajax({
			url: "Virat" + "/" + details_formAction + "?",
			//url:$('#contextPath').text() + "getLocation",
			type: "POST",
			data: {subCategory:$("#itemType").val()},
			success: function(data) {
				$("#postContent").html(data);
				attachEventHandlers();
				expandOrCollapseAdditionalSection();
			},
			error: function (error) {
				alert('error: ' + error.responseText);
				alert('error: ' + error.message);
				alert('error: ' + error.Message);
			}
		});
		
		$("#itemType").prop("disabled", true);
		$("#itemType").css("background-color", "#FAFAFA");
		$("#changeItemType").show();
	}
	function updateToolTip(subCategory){
		if(subCategory == "1"){$("#Title").attr("data-infoTip", "E.g. 'Samsung LCD TV (3 year old) available for sale'");}
		else if(subCategory == "2"){$("#Title").attr("data-infoTip", "E.g. Sony DVD Player available for sale.");}
		else if(subCategory == "3"){$("#Title").attr("data-infoTip", "E.g. Nikkon SLR Camera available in good condition.");}
		else if(subCategory == "4"){$("#Title").attr("data-infoTip", "E.g. Whirlpool Fridge - Double Door - available for immediate sale.");}
		else if(subCategory == "5"){$("#Title").attr("data-infoTip", "E.g. IFB Fully automatic washing machine, rarely used.");}
		else if(subCategory == "6"){$("#Title").attr("data-infoTip", "E.g. 2 Ton Split AC - Godrej - available for sale.");}
	}
	function enableItemType(){
		$("#itemType").prop("disabled", false);
		$("#itemType option[value='-1']").remove();
		$("#itemType").css("background-color", "#FFFFFF");
		$("#changeItemType").hide();
		return false;
	}
	function cityChangeNotification(city){
		//Clearing any tooltip/error
		showOrHideErrorTip(true, "city", "");
	}

</script>


<script src="js/formValidations.js"></script>