<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
	#categoryList ul li{height:30px; font-weight:normal; font-size:14px; padding-top:3px; padding-left:5px;}
	#categoryList ul li:hover{background-color:rgb(255,255,170);}
	#categoryList{display:none; position:absolute; margin-top:20px; margin-left:200px; 
					box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2); cursor:pointer; border:1px solid #CCCCCC;
					background-color:#FFFFFF;
					padding:0px;}
	.postRow:hover{background-color:rgb(244,250,255); cursor:pointer;}
	#adListHeading{font-weight:normal; font-size:12px; margin-left:10px; float:left; padding-top:3px; color:rgb(255,128,0);}
</style>
<div class="data" style="overflow:hidden;">
<input id="pagecount" type="hidden" value="<s:property value="count"/>">
	<s:if test="adList.size() > 0">
		
		<div class="col-md-12 listSection" id="postListSection" style="margin-left:5px;">
			<form id="dummyForm"></form>
			<table class="table table-bordered">
				<tr>
					<th colspan="2" style="width:50%;">
						<div>
							<div style="color:#0099CC; float:left; margin-right:30px; padding-left:5px; font-size:16px;font-weight:normal;">
								<s:property value="subCategoryStr" />
								<!--span style="font-size:14px; color:rgb(255,128,0);">
									<s:if test="city == 'BLR'">
										, Bangalore
									</s:if>
									<s:elseif test="city == 'CHE'">
										, Chennai
									</s:elseif>
								</span-->
							</div>
						</div>
					</th>
					<td colspan="2" style="text-align: right; font-size:12px; ">
						<!--span style="margin-right:5px; padding-top:3px;">Page</span-->
						<input style="border:none;" id="page_info" type="text" readonly="readonly"
					value="<s:property value="%{(count>0)?page:0}"/> of <s:property 
					value="%{(count<=10 && count>0)?1:(((count%10)==0)?count/10:((count/10))+1)}"/>" />
					</td>
				</tr>
				<s:iterator value="adList" status="userStatus">
					<s:set var="counter" value="0"/>
					<tr class="postRow" style="font-size: 12px;" onclick="showDetails('dvdAdDetails', 'ELEC', '<s:property value="%{subCategory}"/>', '<s:property value="%{postId}"/>')">
						<td style="width: 25%;">
							<s:if test="%{imageFileName == null}">
								<div style="padding-left:25%; padding-top:25%; color:#777777;">No Image</div>
							</s:if>
							<s:else>
								<img class="images_ad" id="pic<s:property value="%{postId}"/>"
									src="<s:url value='ImageAction?imageId=%{imageFileName}' />"
									style="width: 120px; height: 100px;">
								
								<s:if test="%{noOfImages > 1}">
									<s:bean name="org.apache.struts2.util.Counter" var="imgCounter">
										<s:param name="last" value="%{noOfImages}" />
									</s:bean>
									<div class="imgPlaceholder" style="cursor:default;">
									Images:	<s:iterator value="#imgCounter">
											<a href="#" onclick="return changeImage('pic<s:property value="%{postId}"/>', '<s:property value="%{imageFileName}"/>',<s:property/>)"><s:property /></a>
										</s:iterator>
									</div>
								</s:if>
							</s:else>
						</td>
						<td style="width:45%;">
							<p style="color: #428bca; font-size: 14px; padding-bottom:0px; padding-left:5px;">
								<s:property value="title" />
							</p> 
							
							<%-- <s:iterator begin="1" end="rating">
							<img class="rating_stars" src="images/star.jpg">
							</s:iterator>  <br /> --%> 
							
							<span class="postField_Color"><s:property value="city" /></span><span class="separator">|</span> 
							<span class="postField_Color"><s:property value="location" /></span>
							<br>
							<span class="postField"><B><s:property value="brand" /></B></span><span class="separator">|</span>
							<span class="postField"><B><s:property value="playerType" /></B>
							</span>
							<br>

							<div style="margin-top:2px;"></div>
							<span class="postField_Special"><s:property value="subCategoryStr" /></span>
						</td>
						<td style="text-align:right;">
							<span class="postField_Highlight">Rs. <s:property value="priceStr" /></span>
						</td>
						<td style="text-align:right; padding-right:5px; ">
							<s:property value="postedDateStr"/>
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>
	</s:if>
	<s:else>
		<div class="col-md-12 listSection">
			<table class="table table-bordered">
				<tr>
					<th colspan="3" style="padding-left: 15px; font-size: 13px;">No
						posts found! Try refining search criteria</th>
				</tr>
			</table>
		</div>
	</s:else>
</div>

<script>
var disableFormSubmit = false;
$(document).ready(function(){
	$("#adListHeading").mouseenter(function(){
		$("#categoryList").show();
	});
	$("#adListHeading").mouseleave(function(){
		if( $("#categoryList").is(":visible") ){
			$("#categoryList").hide();
		}
	});
	$("#categoryList").mouseenter(function(){
		$("#categoryList").show();
	});
	$("#categoryList").mouseleave(function(){
		$("#categoryList").hide();
	});
});
</script>
<script>
function showDetails(actionURL, category, subCategory, postId){
	
	if(disableFormSubmit == true){
		disableFormSubmit = false;
	}else{
		$("#dummyForm").append("<input name='postIdStr' value='" + postId + "' type='hidden'>");
		$("#dummyForm").append("<input name='category' value='" + category + "' type='hidden'>");
		$("#dummyForm").append("<input name='subCategory' value='" + subCategory + "' type='hidden'>");
		$("#dummyForm").attr("action", actionURL);
		$("#dummyForm").attr("method", "get");
		//$("#dummyForm").submit();

		$.ajax({
			type: 'GET',
			url: actionURL, 
			data: {'category':category, 'subCategory':subCategory, 'postIdStr':postId},
			success: function(data, status) {
				$('.data').html('');
				$('.data').html(data);
			}
		});
		
	}
}
function changeImage(imgTag, imgSrc, counter){
	if(counter > 1){
		imgSrc = imgSrc.replace(".","_" + (counter-1) + ".");
	}
	
	$("#" + imgTag).attr("src", "ImageAction?imageId=" + imgSrc);
	disableFormSubmit = true;
	return false;
}
function disableFormSubmit(){
	disableFormSubmit = true;
}

$("#categoryList ul li").bind("click", function(){
	updateDataWithSelectedSubCategory(this, "/mobilesFilter");
});

</script>

