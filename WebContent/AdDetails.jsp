<%@ taglib prefix="s" uri="/struts-tags"%>
<div class=" header_2">
	<div class=""></div>
	<div class="col-md-11">
		<a class="grey_link" href="<s:url action=""  />">HOME</a> >
		<s:property value="category" />
	</div>
</div>

<div class="col-md-8 " id="my">
	<s:if test="adList.size() > 0">
		<s:iterator value="adList" status="userStatus">
			<div class="col-md-12" style="border-bottom: 1px solid #CCCCCC;">
				<h3>
					<s:property value="title" />
				</h3>
			</div>
			<div class="adspeci newvapadspeci">
				<div style="border-bottom: 1px solid #CCCCCC;">
					City <br />
					<h5>
						<strong><s:property value="cityCode" />
						</strong>
					</h5>
				</div>
				<div style="border-bottom: 1px solid #CCCCCC;">
					Location <br />
					<h5>
						<strong><s:property value="locCode" />
						</strong>
					</h5>
				</div>
				<div style="border-bottom: 1px solid #CCCCCC;">
					Rent <br />
					<h5>
						<strong>Rs.<s:property value="price" />
						</strong>
					</h5>
				</div>
				<div style="border-bottom: 1px solid #CCCCCC;">
					Contact Person <br />
					<h5>
						<strong><s:property value="contactPerson" />
						</strong>
					</h5>
				</div>
				<div style="border-bottom: 1px solid #CCCCCC;">
					Contact Name <br />
					<h5>
						<strong><s:property value="contactNo" />
						</strong>
					</h5>
				</div>

			</div>
			<div class="imgspace">
				<div id="bigImg" class="imgbigcont newimgbigcont"
					style="display: block;">
					<div class="bigImg_wapp" style="cursor: zoom-in;">
						<img class="" src=" <s:property value="imageFileName" />">
					</div>
				</div>
			</div>

        <div class="col-md-12" style="border-top: 1px solid #CCCCCC;">
        
        </div>
		</s:iterator>
	</s:if>
	<%-- <s:if test="adList.size() > 0">
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
	</s:if> --%>
</div>
<div class="col-md-5"></div>