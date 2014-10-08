<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
	.preview{width:40px; height:40px; border:0px solid #FFFFFF;}
	.highlight{width:50px; height:50px; border:2px solid orange;}
</style>
<div class="col-md-5" style="margin-left:-10px;">
	<div class="fileinput fileinput-new" data-provides="fileinput">
		<s:if test="postDetails.imageFileName != null">
		<div class="fileinput-preview thumbnail" data-trigger="fileinput"
			style="width: 199px; height: 149px;">
			<img class="images_ad" id="postImage"
				src="<s:url value='ImageAction?imageId=%{postDetails.imageFileName}' />"
				style="width: 199px; height: 149px;">
		</div>
		</s:if>
		<s:else>
			<div class="fileinput-preview thumbnail" data-trigger="fileinput"
				style="width: 199px; height: 149px;padding:30%; color:#CCCCCC;">
				No Image
			</div>
		</s:else>
		<div>
			<s:if test="%{postDetails.noOfImages > 1}">
				<s:bean name="org.apache.struts2.util.Counter" var="imgCounter">
					<s:param name="last" value="%{postDetails.noOfImages}" />
				</s:bean>
				<div class="imgPlaceholder" style="cursor:default; margin-top:10px;">
					<s:iterator value="#imgCounter">
						<a href="#" onclick="return changeImage('<s:property value='%{postDetails.imageFileName}'/>', '<s:property/>')">
							<img id="IMG_<s:property value='%{postDetails.imageFileName}'/>_<s:property/>" class="images_ad preview" >			
						</a>
					</s:iterator>
				</div>
			</s:if>
		</div>								
	</div>
</div>

<script>
function changeImage(baseFileName, index){
	//baseFileName = 1411660804916.jpeg
	if(index == 1){
		//Do nothing
	}else{
		indexOfSeparator  = baseFileName.indexOf(".");
		newFileName = baseFileName.substring(0, indexOfSeparator) + "_" + (index - 1)+ "." + baseFileName.substring(indexOfSeparator + 1);
	}
	$("#postImage").attr("src", "ImageAction?imageId=" + newFileName);
	
	//Set highlight to selected thumbnail image
	$(".preview").each(function(){
		$(this).removeClass("highlight");
	});
	imageTagName = "IMG_" + baseFileName + "_" + index; 
	$(document.getElementById(imageTagName)).addClass("highlight");
	
	disableFormSubmit = true;
	return false;
}
</script>
<script>
$(document).ready(function(){
	$(".preview").each(function(){
		imgId = $(this).attr("id");
		//imgId = "IMG_1411660804916.jpeg_1" - To be converted to "1411660804916_1.jpeg"
		imgId = imgId.replace("IMG_", "");
		temp = imgId.indexOf("_");
		imageIndex = imgId.substring(temp + 1);
		imgId = imgId.substring(0, temp);
		if(imageIndex == 1){
			//Do nothing, 1 is default
			$(this).addClass("highlight");
		}else{
			imgId = imgId.replace(".", "_" + (imageIndex - 1) + ".");
		}
		
		$(this).attr("src", "ImageAction?imageId=" + imgId);
	});
});
</script>