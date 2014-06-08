<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
.postField{padding-right:5px;padding-left:5px;}
.postField_Highlight{font-weight:bold;padding-right:5px;padding-left:5px;float;right;}
.separator{color:#428bca;}
</style>
	<s:if test="adList.size() > 0">
		<table class="table table-bordered">
			<tr>
				<th colspan="3">Post Details</th>
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
						<span class="postField"><s:property value="bedrooms" /> BHK</span> <span class="separator">|</span>
						<span class="postField"><s:property value="area" /> sq ft</span> <span class="separator">|</span>
						<span class="postField"><s:property value="newOrResaleStr" /></span>
						<br> 
						<span class="postField">Contact <s:property value="ContactPersonName" /></span> <span class="separator">|</span>
						<span class="postField"><s:property value="ContactNo" /></span>
						<br>
					</td>
					<td>
						<span class="postField_Highlight">Rs.<s:property value="priceValueStr" /></span>
					</td> 
					<td><s:date name="createdOn" format="dd/MM/yyyy" /></td>
				</tr>  
			</s:iterator>
		</table>

	</s:if>
