<%@ taglib prefix="s" uri="/struts-tags"%>

				<div id="mobilemodel" class="inputstyle pointer form-control">
					Model <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_mobilemodel" class="subCategory_hidden_bck" style="display: none;">
					<ul class="dropdown-menu scrollable-menu" role="menu">
					 <s:iterator value = "mobileModelsList" var="a">
						<li><input type="checkbox" class="check_mobilemodel" name="model" value="<s:property value="#a.model"/>"/><span class="content"><s:property value="#a.model"/></span></li>
						</s:iterator> 
					</ul>
				</div>
			
