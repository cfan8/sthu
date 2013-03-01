<%--
    Document   : general_header
    Created on : 2013-1-27, 21:57:47
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
<link rel="stylesheet" type="text/css" href="/css/general.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
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
	    <div id="navibar">
		<div class="navibtn"><a href="#"><img src="/css/general/navi0.png"></a></div>
		<div class="navibtn"><a href="#"><img src="/css/general/navi1.png"></a></div>
		<div class="navibtn"><a href="#"><img src="/css/general/navi2.png"></a></div>
		<div class="navibtn"><a href="#"><img src="/css/general/navi3.png"></a></div>
		<div class="navibtn"><a href="#"><img src="/css/general/navi4.png"></a></div>
		<div class="navibtn"><a href="#"><img src="/css/general/navi5.png"></a></div>
		<div class="navibtn"><a href="#"><img src="/css/general/navi6.png"></a></div>
		<div class="navirightbtn"><a href="#"><img src="/css/general/navi7.png"></a></div>
	    </div>
	<div id="container">
	    <div id="main">
