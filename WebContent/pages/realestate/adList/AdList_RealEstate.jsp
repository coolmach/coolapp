<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="data">
<input id="pagecount" type="hidden" value="<s:property value="count"/>">
	<s:if test="adList.size() > 0">
		<div class="col-md-8 listSection" id="postListSection">
			<table class="table table-bordered">
				<tr>
					<th>Post Details</th>
					<td colspan="3" style="text-align: right; width: 100%;"></td>
				</tr>
				<s:iterator value="adList" status="userStatus">

					<tr style="font-size: 12px;">
						<td style="width: 25%;"><img class="images_ad"
							src="<s:url value='ImageAction?imageId=%{imageFileName}' />"
							style="width: 100px; height: 100px;"></td>
						<td>
							<p style="color: #428bca; font-size: 14px;">
								<a
									href="<s:url action="realestateAdDetails" escapeAmp="false"> 
											<s:param name="category" value="'REAL'"></s:param>
					                        <s:param name="subCategory" value="%{subCategory}"></s:param>
					                        <s:param name="postIdStr" value="%{postId}"></s:param>
											</s:url>">
									<s:property value="title" />
								</a>
							</p> 
							
							<%-- <s:iterator begin="1" end="rating">
							<img class="rating_stars" src="images/star.jpg">
						</s:iterator>  <br /> --%> <span class="postField"><s:property
									value="city" /> </span> <span class="separator">|</span> <span
							class="postField"><s:property value="location" /> </span> <br>
							<s:if test="%{subCategory == 1}">
								<!-- Apartment for Sale -->
								<span class="postField"><s:property value="bedrooms" />
									BHK</span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="area" /> sq
									ft</span>
								<span class="separator">|</span>
								<span class="postField"><s:property
										value="newOrResaleStr" /> </span>
								<br>
								<span class="postField"><s:property
										value="facingDirectionStr" /> facing</span>
								<span class="separator">|</span>
								<span class="postField"><s:property
										value="floorNumberStr" /> Floor</span>
							</s:if> 
							<s:elseif test="%{subCategory == 2}">
								<!-- Apartment for Rent -->
								<span class="postField"><s:property value="bedrooms" />
									BHK</span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="area" /> sq
									ft</span>
								<s:if test="%{furnished == \"F\" || furnished == \"S\"}">
									<span class="separator">|</span>
									<span class="postField"><s:property value="furnishedStr" />
									</span>
								</s:if>
								<s:if test="%{maintenance != 0}">
									<span class="separator">|</span>
									<span class="postField">Maintenance:&nbsp;<s:property
											value="maintenanceStr" /> </span>
								</s:if>
								<s:set name="cp" value="carParking"/>
								<s:if test="%{carParking == \"Y\"}">
									<span class="separator">|</span>
									<span class="postField">Car&nbsp;Parking</span>
								</s:if>
								<s:if test="%{powerBackup == \"Y\"}">
									<span class="separator">|</span>
									<span class="postField">Power&nbsp;Backup</span>
								</s:if>
								<s:if test="%{childrenPlayArea == \"Y\"}">
									<span class="separator">|</span>
									<span class="postField">Children&nbsp;Play&nbsp;Area</span>
								</s:if>
								<s:if test="%{gym == \"N\"}">
									<span class="separator">|</span>
									<span class="postField">Gym</span>
								</s:if>
								<br>

							</s:elseif> 
							<s:elseif test="%{subCategory == 3}">
								<span class="postField"><s:property value="bedrooms" />
									BHK</span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="area" /> sq
									ft</span>
								<span class="separator">|</span>
								<span class="postField"><s:property
										value="newOrResaleStr" /> </span>
								<br>
								<span class="postField">Contact <s:property
										value="ContactPersonName" /> </span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="ContactNo" />
								</span>
							</s:elseif> 
							<s:elseif test="%{subCategory == 4}">
								<span class="postField"><s:property value="bedrooms" />
									BHK</span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="area" /> sq
									ft</span>
								<span class="separator">|</span>
								<span class="postField"><s:property
										value="newOrResaleStr" /> </span>
							</s:elseif> 
							<s:elseif test="%{subCategory == 5}">
								<!-- PG -->
								<span class="postField"><s:property value="gender" /></span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="floorNumberStr" /> Floor</span>
								<s:if test="food== \"Y\"">
									<span class="separator">|</span>
									<span class="postField">Food Available</span>
								</s:if>
								<s:if test="carParking == \"Y\"">
									<span class="separator">|</span>
									<span class="postField">Car Parking</span>
								</s:if>
								<s:if test="wiFi == \"Y\"">
									<span class="separator">|</span>
									<span class="postField">Wi Fi</span>
								</s:if>
								<s:if test="tv == \"Y\"">
									<span class="separator">|</span>
									<span class="postField">TV/DTH</span>
								</s:if>
							</s:elseif> 
							<s:elseif test="%{subCategory == 6}">
								<!-- Land For sale -->
								<span class="postField"><s:property value="area" /> sq ft</span>
								<s:if test="approvalAuthority != null">
									<span class="separator">|</span>
									<span class="postField">Approved By:&nbsp;<s:property value="approvalAuthority" /></span>
								</s:if>
							</s:elseif> 
							<s:elseif test="%{subCategory == 7}">
								<!-- Roommate required-->
								<span class="postField"><s:property value="bedrooms" />
									BHK</span>
								<span class="separator">|</span>
								<span class="postField"><s:property value="area" /> sq
									ft</span>
								<s:if test="regionalPreference != null">
									<span class="separator">|</span>
									<span class="postField"><s:property
										value="regionalPreference" /> </span>
								</s:if>
							</s:elseif> 
							<s:else>

							</s:else> <br>
						</td>
						<td><span class="postField_Highlight">
						<a
								class="grey_link"
								href="<s:url action="realestateAdDetails" escapeAmp="false"> 
						<s:param name="category" value="'REAL'"></s:param>
                        <s:param name="subCategory" value="%{subCategory}"></s:param>
                        <s:param name="postIdStr" value="%{postId}"></s:param>
						</s:url>">Rs.<s:property
										value="priceValueStr" /> </a> </span>
						</td>
						<td><s:date name="createdOn" format="dd/MM/yyyy" /></td>
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