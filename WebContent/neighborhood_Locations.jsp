<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="js/Cbuddy.js"></script>		
		<div id="locationDetails">
			<s:if test="selectedLocation != null">
			<div id="locationListBar">
				<div id="locationResultSection">
					<div class="checkboxColumn"><input type="checkbox" class="check_location checkBox" name="location" id="location" value="${selectedLocation.name}"></div>
					<div class="checkboxCaptionColumn"><span class="radioCaptionWithoutSpace">${selectedLocation.value}</span></div>
				</div>
				<div id="clearSection">
					<a class="smallLink_Yellow" onClick="resetLocationFilter()"><span class="glyphicon glyphicon-remove"></span></a>
				</div>
			</div>
			</s:if>
			<s:if test="neighborhoodLocations.size() > 0">
			<div id="horizontalSeparator">
				<hr>
			</div>
			<div id="neighborhoodLocationBar">
				<div id="heading">Nearby Areas</div>
				<div id="neighborAreaList">
					<table>
						<s:iterator value="neighborhoodLocations" status="userStatus">
						<tr>
							<td>
								<input type="checkbox" class="check_location checkBox" id="loc_${value}" name="location" value="${name}">
								<span class="radioCaptionWithoutSpace">
									${value}
								</span>
							</td>
						</tr>
						</s:iterator>
					</table>
				</div>
			</div>
			</s:if>
		</div>
