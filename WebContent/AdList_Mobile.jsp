<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="data">
<input id="pagecount" type="hidden" value="<s:property value="count"/>">
	<s:if test="adList.size() > 0">
		<div class="col-md-8 listSection" id="postListSection">
		<table class="table table-bordered">
			<tr>
				<th>Post Details</th>
				<td colspan="3" style="text-align:right;width:100%;"></td>
			</tr>
			<s:iterator value="adList" status="userStatus">
				<tr style="font-size:12px;">
					 <td style="width:25%;"><img class="images_ad" src="<s:url value='ImageAction?imageId=%{imageFileName}' />" style="width:100px;height:100px;"></td> 
					 <td>
						<p style="color:#428bca;font-size:14px;">
							<a
								href="<s:url action="mobileAdDetails" escapeAmp="false"> 
										<s:param name="category" value="'MOBILE'"></s:param>
				                        <s:param name="subCategory" value="%{subCategory}"></s:param>
				                        <s:param name="postIdStr" value="%{postId}"></s:param>
										</s:url>">
								<s:property value="title" />
							</a>
						</p> <%-- <s:iterator begin="1" end="rating">
							<img class="rating_stars" src="images/star.jpg">
						</s:iterator>  <br /> --%>
						<span class="postField"><s:property value="city" /></span> <span class="separator">|</span>
						<span class="postField"><s:property value="location" /></span>
						<br>
						<span class="postField"><s:property value="brandStr" /></span> <span class="separator">|</span>
						<span class="postField"><B><s:property value="modelStr" /></B></span> <span class="separator">|</span>
						<span class="postField">Color:&nbsp;<s:property value="color" /></span> <span class="separator">|</span>
						<span class="postField">Screen&nbsp;Size&nbsp;:<s:property value="screenSize" />&nbsp;"</span> <span class="separator">|</span>											
						<span class="postField">Bought&nbsp;on:&nbsp;<s:property value="year" /></span>
						<br>
					</td>
					<td>
						<span class="postField_Highlight">
							<a
										class="grey_link"
										href="<s:url action="mobileAdDetails" escapeAmp="false"> 
								<s:param name="category" value="'MOBILE'"></s:param>
		                        <s:param name="subCategory" value="%{subCategory}"></s:param>
		                        <s:param name="postIdStr" value="%{postId}"></s:param>
								</s:url>">Rs.<s:property value="priceStr" /> 
							</a>
						</span>
					</td> 
					<td><s:date name="createdOn" format="dd/MM/yyyy" /></td>
				</tr>  
			</s:iterator>
		</table>
		</div>
	</s:if>
	<s:else>
		<div class="col-md-6 listSection">
			<table class="table table-bordered">
				<tr>
					<th colspan="3" style="padding-left:15px;font-size:13px;">No posts found! Try refining search criteria</th>
				</tr>
			</table>
		</div>	
	</s:else>
	</div>
