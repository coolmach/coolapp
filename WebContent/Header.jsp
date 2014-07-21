<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%-- <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="background-color:#0099cc;">
   
        <div class="container" style="width:100%;">
            <div class="navbar-header page-scroll" style="margin-top:-5px;">
                <a class="navbar-logo" href="<s:url action=""/>">
                    <div class="logo">CBuddy.<span style="color:#FFFF00;">in</span></div>
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse" style="width:600px;">
                <ul class="nav navbar-nav pull-right" >
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a  href="<s:url action="newHome"/>"> About</a>
                    </li>
               
                    <li class="page-scroll">
                        <a href="#contact">Contact</a>
                    </li>
                   <s:if test="%{#session.userLoggedIn == null}">
                     <li class="page-scroll">
                    <a  href="<s:url action="mylogin"/>"> Login</a> 
                    </li>
                    </s:if>
                </ul>

                <s:if test="%{#session.userLoggedIn != null}">
                <s:url action="logout" var="logoutTag">
                </s:url>
                  <div class="pull-right"> <b id="myuser" style="color:#ffffff;">Welcome <s:property value="%{#session.username}"/> |  </b> <a id="nav_user" href="<s:property value="#logoutTag" />">logout</a> </div>
           </s:if>
            </div>
            
            <!-- /.navbar-collapse -->
            
        </div>
        <!-- /.container -->
    </nav> --%>
<div id="header_main" style="overflow: visible;">
	<div id="header_wrapper">
		<div id="top_bar" style="left: 0; position: fixed; top: 0;">

			<div class="top_bar_holder">
				<div class="top_bar_leftside">
					<ul class="top_bar_left_list_container">
						<li><a href="<s:url action="newHome"/>" class="top_bar_cod">
								About</a>
							<div class="topmenu_divider"></div>
						</li>
						<li><a href="<s:url action="newHome"/>" class="top_bar_cod">FAQ</a>
							<div class="topmenu_divider"></div>
						</li>
						<li><img src="images/phone_icon.png" width="14" height="16"
							style="margin-top: 10px; float: left; margin-left: 9px;" /><a
							class="top_bar_cod">xxx-xxxxxx</a>
						</li>
					</ul>
				</div>
				<div class="top_bar_rightside" style="width: 180px">

					<ul class="top_bar_right_list_container">
						<s:if test="%{#session.userLoggedIn == null}">
							<li><a href="<s:url action="mylogin"/>" class="top_bar_cod">
									Login</a>
								<div class="topmenu_divider"></div></li>
						</s:if>
						<s:else>
							<s:url action="logout" var="logoutTag" />
							<li>Welcome <s:property value="%{#session.username}" /> <a
								id="nav_user" href="<s:property value="#logoutTag" />">Logout</a>
							</li>
						</s:else>
					</ul>

				</div>
				<!--Right side top bar hoder ends-->
			</div>
		</div>
		<div id="container" style="overflow: visible;">
			<div id="header">
				<a class="navbar-logo" href="<s:url action=""/>"
					style="float: none, line-height : 58px;"> <span class="logo">CBuddy.<span
						style="color: #FFFF00;">in</span>
				</span> </a>
				<div id="search_container">
					<img src="images/arrow.png" id="arr_img"
						style="float: left; margin-left: -36px; position: absolute; width: 30px;">
					<input type="text" class="form-control" id="category_search"
						name="category" placeholder="I am looking for..."
						style="width: 100% !important;">
				</div>
			</div>
		</div>
	</div>
	<div id="top_menu">
        <div class="menu_icon_holder">
               <ul id="menu" style="padding: 0px;">
                  <li><s:url action="realestate" var="urlTag" escapeAmp="false">
					<s:param name="category">REAL</s:param>
					<s:param name="subCategory">1</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">REAL ESTATE</a>
				</li>
                  <li><s:url action="realestate" var="urlTag" escapeAmp="false">
					<s:param name="category">AUTO</s:param>
					<s:param name="subCategory">1</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">AUTOMOBILES</a>
				</li>
				<li><s:url action="realestate" var="urlTag" escapeAmp="false">
					<s:param name="category">ELEC</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">ELECTRONICS & HOUSEHOLD</a>
				</li>
				<li><s:url action="realestate" var="urlTag" escapeAmp="false">
					<s:param name="category">COMP</s:param>
					<s:param name="subCategory">1</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">LAPTOPS & COMPUTERS</a>
				</li>
				<li><s:url action="realestate" var="urlTag" escapeAmp="false">
					<s:param name="category">MOBILE</s:param>
					<s:param name="subCategory">1</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">MOBILE PHONES</a>
				</li>
				<li><s:url action="realestate" var="urlTag" escapeAmp="false">
					<s:param name="category">FURN</s:param>
					<s:param name="subCategory">1</s:param>
				     </s:url> <a href="<s:property value="#urlTag" />">FURNITURE</a>
				</li>
               </ul>
        </div>
    </div>
</div>