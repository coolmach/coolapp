<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
	#categoryList ul li{height:30px; font-weight:normal; padding-top:10px; padding-left:10px; padding-right:10px; font-size:14px; }
	#categoryList{display:none; position:absolute; margin-top:20px; margin-left:200px; box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2); padding:5px; border:1px solid #CCCCCC;background-color:#FFFFFF;}
	.postRow:hover{background-color:rgb(244,250,255); cursor:pointer;}
	#adListHeading{font-weight:normal; font-size:12px; margin-left:10px; float:left; padding-top:3px; color:rgb(255,128,0);}
</style>
<div style="cursor:pointer; width:100px; height:25px; color:#EEEEEE;" id="placeholdjlker" onclick="javascript:JJJ()">Link</div>
<div class="data">
<input id="pagecount" type="hidden" value="<s:property value="count"/>">
	<s:if test="adList.size() > 0">
		
		<div class="col-md-8 listSection" id="postListSection">
			<form id="dummyForm"></form>
			<table class="table table-bordered">
				<tr>
					<th colspan="2" style="width:55%;">
						<div>
							<div style="color:#FF0000; float:left; margin-right:30px; padding-left:5px; font-size:16px;font-weight:normal;">
								<s:property value="subCategoryStr" />
							</div>
							<div id="adListHeading">Select Different Category&nbsp;<span class="glyphicon glyphicon-chevron-down"></span></div>
							<div id="categoryList">
								<ul>
									<s:url action="realestate" var="url_REAL_1" escapeAmp="false"><s:param name="category">REAL</s:param><s:param name="subCategory">1</s:param></s:url>
									<s:url action="realestate" var="url_REAL_2" escapeAmp="false"><s:param name="category">REAL</s:param><s:param name="subCategory">2</s:param></s:url>
									<s:url action="realestate" var="url_REAL_3" escapeAmp="false"><s:param name="category">REAL</s:param><s:param name="subCategory">3</s:param></s:url>
									<s:url action="realestate" var="url_REAL_4" escapeAmp="false"><s:param name="category">REAL</s:param><s:param name="subCategory">4</s:param></s:url>
									<s:url action="realestate" var="url_REAL_5" escapeAmp="false"><s:param name="category">REAL</s:param><s:param name="subCategory">5</s:param></s:url>
									<s:url action="realestate" var="url_REAL_6" escapeAmp="false"><s:param name="category">REAL</s:param><s:param name="subCategory">6</s:param></s:url>
									<s:url action="realestate" var="url_REAL_7" escapeAmp="false"><s:param name="category">REAL</s:param><s:param name="subCategory">7</s:param></s:url>
									
									<li><a href='<s:property value="url_REAL_2"/>'>Apartment for Rent</a></li>
								    <li><a href='<s:property value="url_REAL_1"/>'>Apartment For Sale</a></li>
								    <li><a href='<s:property value="url_REAL_4"/>'>Independent House For Rent</a></li>
								    <li><a href='<s:property value="url_REAL_3"/>'>Independent House For Sale</a></li>
								    <li><a href='<s:property value="url_REAL_6"/>'>Plot For Sale</a></li>
								    <li><a href='<s:property value="url_REAL_5"/>'>PG Accommodation</a></li>
								    <li><a href='<s:property value="url_REAL_7"/>'>Roommate Required</a></li>
								</ul>						
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
					<tr class="postRow" style="font-size: 12px;" onclick="showDetails('realestateAdDetails', 'REAL', '<s:property value="%{subCategory}"/>', '<s:property value="%{postId}"/>')">
						<td style="width: 25%;">
							<s:if test="%{imageFileName == null}">
								<div style="padding-left:25%; padding-top:25%; color:#777777;">No Image</div>
							</s:if>
							<s:else>
								<img class="images_ad" id="pic<s:property value="%{postId}"/>"
									src="<s:url value='ImageAction?imageId=%{imageFileName}' />"
									style="width: 120px; height: 100px;">
									
								<s:bean name="org.apache.struts2.util.Counter" var="imgCounter">
									<s:param name="last" value="%{noOfImages}" />
								</s:bean>
								<div id="placeholder" onClick="disableFormSubmit()">Images:
									<s:iterator value="#imgCounter">
										<a href="#" onclick="return changeImage('pic<s:property value="%{postId}"/>', '<s:property value="%{imageFileName}"/>',<s:property/>)"><s:property /></a>
									</s:iterator>
								</div>
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
							
							<s:if test="%{subCategory == 1}">
								<!-- Apartment for Sale -->
								<br>
								<span class="postField"><s:property value="bedrooms" /> BHK</span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="area" /> sq ft</span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="newOrResaleStr" /> </span>
								<br>
							</s:if> 
							<s:elseif test="%{subCategory == 2}">
								<!-- Apartment for Rent -->
								<br>
								<span class="postField"><s:property value="bedrooms" /> BHK</span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="area" /> sq ft</span>
								<br>
							</s:elseif> 
							<s:elseif test="%{subCategory == 3}">
								<!-- Ind House For Sale -->
								<br>
								<span class="postField"><s:property value="bedrooms" /> BHK</span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="area" /> sq ft</span>
								<br>
							</s:elseif> 
							<s:elseif test="%{subCategory == 4}">
								<!-- Ind House For rent -->
								<br>
								<span class="postField"><s:property value="bedrooms" /> BHK</span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="area" /> sq ft</span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="newOrResaleStr" /></span>
								<br>
							</s:elseif> 
							<s:elseif test="%{subCategory == 5}">
								<!-- PG -->
								<br>
								<span class="postField"><s:property value="gender" /></span>
								<s:set var="counter" value="%{#counter+1}"/>
							</s:elseif> 
							<s:elseif test="%{subCategory == 6}">
								<!-- Land For sale -->
								<br>
								<span class="postField"><s:property value="area" /> sq ft</span>
								<s:set var="counter" value="%{#counter+1}"/>
							</s:elseif> 
							<s:elseif test="%{subCategory == 7}">
								<!-- Roommate required-->
								<br>
								<span class="postField"><s:property value="gender" /></span>
								<s:set var="counter" value="%{#counter+1}"/>
							</s:elseif>
							<%@include file="AdList_Optional_Attributes_RealEstate.jsp" %>
							<div style="margin-top:2px;"></div>
							<span class="postField_Special"><s:property value="subCategoryStr" /></span>
						</td>
						<td style="text-align:right;">
							<span class="postField_Highlight">Rs. <s:property value="priceValueStr" /></span>
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
		<div class="col-md-8 listSection">
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
function JJJ(){
	alert("lop");
}
var disableFormSubmit = false;
function showDetails(actionURL, category, subCategory, postId){
	if(disableFormSubmit == true){
		disableFormSubmit = false;
	}else{
		$("#dummyForm").append("<input name='postIdStr' value='" + postId + "' type='hidden'>");
		$("#dummyForm").append("<input name='category' value='" + category + "' type='hidden'>");
		$("#dummyForm").append("<input name='subCategory' value='" + subCategory + "' type='hidden'>");
		$("#dummyForm").attr("action", actionURL);
		$("#dummyForm").attr("method", "get");
		$("#dummyForm").submit();	
	}
}
function changeImage(imgTag, imgSrc, counter){
	imgSrc = imgSrc.replace(".","_" + (counter-1) + ".");
	$("#" + imgTag).attr("src", "ImageAction?imageId=" + imgSrc);
	disableFormSubmit = true;
	return false;
}
function disableFormSubmit(){
	disableFormSubmit = true;
}
</script>