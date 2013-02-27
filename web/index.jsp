<%-- 
    Document   : main_index
    Created on : 2013-2-27, 17:16:16
    Author     : linangran
--%>

<%@page import="cn.edu.tsinghua.sthu.entity.UserEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean isLogin = (Boolean) session.getAttribute("isLogin");
    String nickName = null;
    if (isLogin != null && isLogin == true) {
	nickName = ((UserEntity) (session.getAttribute("userinfo"))).getNickname();
    } else {
	nickName = "我的学清";
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学生清华-首页</title>
	<link rel="stylesheet" type="text/css" href="/css/index/index.css" />
	<script type="text/javascript" src="/js/jquery.js" ></script>
    </head>
    <body>
	<div id="bg_container"></div>
	<div id="all">
	    <div id="top">
		<div id="logo"><a href="/index.do">
			<img src="/css/index/logo.png" />
		    </a></div>
		<div id="logininfo"><span><a href="/mysthu.do"><%=nickName%></a></span></div>
		<div id="toplink">清华大学社会实践在线平台<span class="splitspan">|</span>清华大学素质拓展计划<span class="splitspan">|</span>志愿北京平台</div>
	    </div>
	    <div id="banner">
		<div id="bannerimg"><img src="/css/index/banner.png"></img></div>
		<div id="navibar">
		    <div class="navibutton"><a href="#"><img src="/css/index/navi0.png" /></a></div>
		    <div class="navibutton"><a href="#"><img src="/css/index/navi1.png" /></a></div>
		    <div class="navibutton"><a href="#"><img src="/css/index/navi2.png" /></a></div>
		    <div class="navibutton"><a href="#"><img src="/css/index/navi3.png" /></a></div>
		    <div class="navibutton"><a href="#"><img src="/css/index/navi4.png" /></a></div>
		    <div class="navibutton"><a href="#"><img src="/css/index/navi5.png" /></a></div>
		    <div class="navibutton"><a href="#"><img src="/css/index/navi6.png" /></a></div>
		    <div class="navibutton"><a href="#"><img src="/css/index/navi7.png" /></a></div>
		</div>
	    </div>
	    <div id="main">
		<div id="slide"></div>
		<div id="note">
		    <div class="title"><div class="morediv"><a href="#">&gt;&gt;more</a></div></div>
		    <div class="content"></div>
		</div>
		<div id="express">
		    <div class="title"><div class="morediv"><a href="#">&gt;&gt;more</a></div></div>
		    <div class="content"></div>
		</div>
		<div id="event">			
		    <div class="title"><div class="morediv"><a href="#">&gt;&gt;more</a></div></div>
		    <div class="content"></div>
		</div>
		<div id="subject">
		    <div class="title"><div class="morediv"><a href="#">&gt;&gt;more</a></div></div>
		    <div class="content"></div>
		</div>
	    </div>
	</div>
	<div id="footercontainer">
	    <div id="footer">
		<div class="title"></div>
		<div class="content">
		    <%@include file="/templates/link.jsp" %>
		</div>
	    </div>
	</div>
	<div id="copyright">
	    <div id="copyrighttext">共青团清华大学委员会成才中心<br/>Copyright©2013 student.tsinghua.edu.cn, All Rights Reserved</div>
	</div>
    </body>
</html>
