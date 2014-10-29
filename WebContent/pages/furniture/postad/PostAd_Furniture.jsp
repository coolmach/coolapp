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
		<s:form cssClass="form-horizontal post" id="postContentForm" action="furniture_postAd.action" enctype="multipart/form-data" onsubmit="return localValidations()">
			<input type="hidden" name="category" value="AUTO"/>
			<div class="col-md-12">
				<div class="form-group" >
					<label class="col-sm-10 col-sm-offset-3 postAdHeading">
					<span>Post Ad - Furniture</span> <span style="font-size:12px;"><s:fielderror fieldName="errorMsg"/></span></label>
				</div>			
				<div class="form-group">
					<label for="title" class="col-sm-3 control-label">Title<span class="mandatory">*</span></label>
					<div class="col-sm-7">
						<input type="text" class="form-control" maxlength="200" id="Title" name="Title" value="<s:property value='title'/>" required
							data-infoTip="E.g. '3 x 6 ft wooden cot available for sale'" data-validate-type="postTitle" 
							data-validate-errMessage="Title should be at least 10 letters long and should have atleast 2 words">
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
					<%@ include file="./PostAd_Furniture_Default.jsp" %>
				</div>
			</div>
		</s:form>
	
	</div>
</div>

<script>
	function cityChangeNotification(city){
		//Clearing any tooltip/error
		showOrHideErrorTip(true, "city", "");
	}

</script>


<script src="js/formValidations.js"></script>
