<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

	<div id="headerRow" class="row">
		<div class="col-sm-1 col-sm-offset-1" id="imageSection">
			<a href="<s:url action=""/>">
				<img src="images/common/cbuddy_box_red.png">
			</a>
			<!--span class="logoText">cBuddy<span class="logoTextSmall">.in</span></span-->
		</div>
		<div class="col-sm-2" style="padding-top:30px;color:#0099CC;margin-left:55%;"> 
			<span style="font-size:12px;">
				<s:if test="%{#session.userLoggedIn == null}">
					<span style="margin-right:10px;font-size:12px;"><a href="#"> Why cBuddy?</a></span> | 
                	<span style="margin-left:10px;"><a href="<s:url action="mylogin"/>">Sign In</a></span>
                </s:if>
				<s:else>
					<span style="margin-right:10px;font-size:12px;">
						<a href="
							<s:url action="mydashboard">
								<s:param name="userId"><s:property value="#session.userInfo.userId"/></s:param>
							</s:url>">Dashboard</a></span> | 
					<span style="margin-left:10px;"><a href="<s:url action="logout"/>">Sign Out</a></span>
				</s:else>
			</span>
		</div>
	</div>
	<div id="top_menu">
        <div class="menu_icon_holder">
               <ul id="menu" style="padding: 0px;">
                  <li><s:url action="realestate" var="urlTag" escapeAmp="false">
					<s:param name="category">REAL</s:param>
					<s:param name="subCategory">1</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">Real Estate</a>
				</li>
                  <li><s:url action="automobile" var="urlTag" escapeAmp="false">
					<s:param name="category">AUTO</s:param>
					<s:param name="subCategory">1</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">Automobiles</a>
				</li>
				<li><s:url action="electronics" var="urlTag" escapeAmp="false">
					<s:param name="category">ELEC</s:param>
					<s:param name="subCategory">0</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">Home Appliances</a>
				</li>
				<li><s:url action="computers" var="urlTag" escapeAmp="false">
					<s:param name="category">COMP</s:param>
					<s:param name="subCategory">1</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">Computers</a>
				</li>
				<li><s:url action="mobile" var="urlTag" escapeAmp="false">
					<s:param name="category">MOBILE</s:param>
					<s:param name="subCategory">1</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">Mobile Phones</a>
				</li>
				<li><s:url action="furniture" var="urlTag" escapeAmp="false">
					<s:param name="category">FURN</s:param>
					<s:param name="subCategory">1</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">Furniture</a>
				</li>
				<li>|</li>
				<li><a style="padding:0;" class="myButton" id="post_ad"
					href="<s:url action="postAdStart"/>">Post Ad</a></li>
               </ul>
              
        </div>
    </div>
