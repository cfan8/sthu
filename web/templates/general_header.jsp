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
<script type="text/javascript" src="/js/browser.js"></script>
<body>
    <div id="bg_container" class="noprint"></div>
    <div id="all">
	<div id="top" class="noprint">
	    <div id="logo"><a href="/index.do">
		    <img src="/css/index/logo.png" />
		</a></div>
	    <div id="logininfo"><span><a href="/login.do?redirectURL=%2Fmysthu.do"><%=nickName%></a></span></div>
	    <div id="toplink"><a href="http://166.111.17.5/shijian/" target="_blank">社会实践在线平台</a><span class="splitspan">|</span><a href="http://sutuo.student.tsinghua.edu.cn" target="_blank" >素质拓展计划</a><span class="splitspan">|</span><a href="http://www.bv2008.cn/" target="_blank">志愿北京平台</a><span class="splitspan">|</span><a href="http://daf.tsinghua.edu.cn/" target="_blank">博学网</a><span class="splitspan">|</span><a href="http://old.student.tsinghua.edu.cn/" target="_blank">怀念老学清</a></div>
	</div>
	    <div id="navibar" class="noprint">
		<div class="navibtn"><a href="/index.do"><img src="/css/general/navi0.png" /></a></div>
		<div class="navibtn"><a href="/column/column.do?id=2" target="_blank"><img src="/css/general/navi1.png" /></a></div>
		<div class="navibtn"><a href="/column/column.do?id=8" target="_blank"><img src="/css/general/navi2.png" /></a></div>
		<div class="navibtn"><a href="/column/column.do?id=4" target="_blank"><img src="/css/general/navi3.png" /></a></div>
		<div class="navibtn"><a href="http://146.tsinghua.me" target="_blank"><img src="/css/general/navi4.png" /></a></div>
		<div class="navibtn"><a href="/column/column.do?id=6" target="_blank"><img src="/css/general/navi5.png" /></a></div>
		<div class="navibtn"><a href="/activity/applyNotice.jsp" target="_blank"><img src="/css/general/navi6.png" /></a></div>
		<div class="navirightbtn"><a href="/ticket/ticketNotice.jsp" target="_blank"><img src="/css/general/navi7.png" /></a></div>
	    </div>
	<div id="container">
	    <div id="main">
