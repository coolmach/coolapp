<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
	@font-face{font-family:TimeBurner; src:url(fonts/timeburner_regular.ttf);}
	.logo{font-family:TimeBurner;font-size:22px;font-weight:bold;color:#FFFFFF;text-decoration:none}
	.logo hover{text-decoration:none;}
</style>
  
  <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="background-color:#0099cc;">
   
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
                        <a href="#about">About</a>
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
    </nav>