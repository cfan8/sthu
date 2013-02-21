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
	nickName = "登录学清";
    }
%>
<link rel="stylesheet" type="text/css" href="/css/general.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<body>
    <div id="all">
	<div id="header">
	    <div id="icon"><a href="/index.do"><img src="/css/general/icon.png"></img></a></div>
	    <div id="texturl">清华大学社会实践在线平台|清华大学素质拓展计划|志愿北京平台</div>
	    <div id="logininfo">
		<a href="/mysthu.do">
		    <img src="/css/general/login.png"></img><span><%=nickName%></span>
		</a>
	    </div>
	</div>
	<div id="bar">
	    <div id="home"><a href="/index.do"><img src="/css/general/home.png"></img></a></div>
	</div>
	<div id="container">
	    <div id="main">
