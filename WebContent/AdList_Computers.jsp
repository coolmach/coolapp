<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="data">
<input id="pagecount" type="hidden" value="<s:property value="count"/>">
	<s:if test="adList.size() > 0">
		<div class="col-md-6 listSection" id="postListSection">
		<table class="table table-bordered">
			<tr>
				<th>Post Details</th>
				<td colspan="3" style="text-align:right;width:100%;">Showing Records (? - ? of ?))</td>
			</tr>
			<s:iterator value="adList" status="userStatus">
				<tr style="font-size:12px;">
					 <td style="width:25%;"><img class="images_ad" src="<s:url value='ImageAction?imageId=%{imageFileName}' />" style="width:100px;height:100px;"></td> 
					 <td>
						<p style="color:#428bca;font-size:14px;">
							<s:property value="title" />
						</p> <%-- <s:iterator begin="1" end="rating">
							<img class="rating_stars" src="images/star.jpg">
						</s:iterator>  <br /> --%>
						<span class="postField"><s:property value="city" /></span> <span class="separator">|</span>
						<span class="postField"><s:property value="location" /></span>
						<br>
						<span class="postField"><s:property value="makeStr" /></span> <span class="separator">|</span>
						<span class="postField"><s:property value="model" /></span> <span class="separator">|</span>												
						<s:if test="%{subCategory != 3}">
							<!-- Desktops, Laptops -->
							<span class="postField">HDD:&nbsp;<s:property value="hddSize" />&nbsp;GB</span> <span class="separator">|</span>
							<span class="postField">RAM:&nbsp;<s:property value="processorSize" />&nbsp;GB</span> <span class="separator">|</span>
						</s:if>
						<span class="postField">Bought&nbsp;on:&nbsp;<s:property value="year" />
						<br>
					</td>
					<td>
						<span class="postField_Highlight">Rs.<s:property value="priceStr" /></span>
					</td> 
					<td><s:date name="createdOn" format="dd/MM/yyyy" /></td>
				</tr>  
			</s:iterator>
		</table>
	</s:if>
	<s:else>
		<div class="col-md-6 listSection">
			<table class="table table-bordered">
				<tr>
					<td colspan="3" style="padding-left:15px;font-size:13px;">No posts found! Try refining search criteria</th>
				</tr>
			</table>
		</div>	
	</s:else>
</div>