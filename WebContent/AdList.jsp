<%@ taglib prefix="s" uri="/struts-tags"%>
<div class=" header_2">
	<div class=""></div>
	<div class="col-md-11">
		<a class="grey_link" href="<s:url action=""  />">HOME</a> >
		<s:property value="category" />
	</div>
</div>
<!-- <div class="col-md-4"></div> -->
<div class="col-md-7">
	<s:if test="adList.size() > 0">
		<table class="table table-bordered">
			<tr>
				<th>Description</th>
				<th></th>
				<th>Price</th>
				<th>Date</th>
				<th>Posted By</th>
			</tr>
			<s:iterator value="adList" status="userStatus">
				<tr>
					<td><img class="" src=" <s:property value="imageFileName" />">
					</td>
					<td>
						<p>
							<s:property value="title" />
						</p> <s:iterator begin="1" end="rating">
							<img class="rating_stars" src="images/star.jpg">
						</s:iterator> <br /> <small><b><s:property value="cityCode" />,<s:property
									value="locCode" /> </b> </small><br /> <small>Contact <s:property
								value="contactPerson" />,<s:property value="contactNo" /> </small>
					</td>
					<td><s:url action="addetails" var="urlTag">
							<s:param name="price">
								<s:property value="price" />
							</s:param>
						</s:url> <a class="blue_link" href="<s:property value="#urlTag" />"><s:property
								value="price" /> </a>
					</td>
					<td><s:date name="rCreTime" format="dd/MM/yyyy" /></td>
					<td><s:property value="firstName" />(<s:property
							value="corpName" />)</td>
				</tr>
			</s:iterator>
		</table>
		
	</s:if>
</div>