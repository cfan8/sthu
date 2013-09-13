<%-- 
    Document   : new_general_header
    Created on : 2013-8-23, 13:17:27
    Author     : wzcy
--%>
<%@page import="cn.edu.tsinghua.sthu.entity.UserEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean isLogin = (Boolean) session.getAttribute("isLogin");
    String nickName = null;
    String logout = null;
    if (isLogin != null && isLogin == true) {
	nickName = ((UserEntity) (session.getAttribute("userinfo"))).getNickname();
        logout = "注销";
    } else {
	nickName = "登陆";
        logout = "";
    }
%>
<link href="/css/activity/NaviBar_sheet.css" type="text/css" rel="stylesheet" />
<link href="/css/activity/FooterBar_sheet.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/browser.js"></script>
<body>
    <header id="top_wrap">
        <div id="color_bar"></div>
        <div id="navi_header" class="navi-header-skin">
            <div id="navi">
                <div id="navi_text_left" class="navi-left">
                    <div class="navi-main-name"><a href="/login.do?redirectURL=%2FshowUserHome.do"><b><%=nickName%></b></a></div>
                    <div class="navi-main"><a id="activity_link" href="/studentActivity/showActivitiesList.do" target="_blank"><b>活动</b></a></div>
                    <div class="navi-main"><a id="individual_link" href="/login.do?redirectURL=%2FshowUserHome.do"><b>个人主页</b></a></div>
                </div>
                <div id="navi_text_right" class="navi-side">
                    <div class="navi-main"><a id="login_out_link" href="/logout.do"><b><%=logout%></b></a></div>
                </div>
            </div>
        </div>
        <div id="navi_logo" class="navi-logo-skin">
            <div id="logo">
                <a href="/index.do">
                    <img id="xsqh_logo" src="/css/activity/logo.jpg" />
                </a>
            </div>
        </div>
    </header>
	
