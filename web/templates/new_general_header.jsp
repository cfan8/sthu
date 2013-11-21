<%-- 
    Document   : new_general_header
    Created on : 2013-8-23, 13:17:27
    Author     : wzcy
--%>
<%@page import="cn.edu.tsinghua.sthu.entity.AuthEntity"%>
<%@page import="cn.edu.tsinghua.sthu.entity.UserEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean isLogin = (Boolean) session.getAttribute("isLogin");
    String nickName = null;
    int type = AuthEntity.USER_ROLE;
    int id = 0;
    String logout = null;
    if (isLogin != null && isLogin == true) {
	nickName = ((UserEntity) (session.getAttribute("userinfo"))).getNickname();
        type = ((UserEntity) (session.getAttribute("userinfo"))).getAuth().getRole();
        id = ((UserEntity) (session.getAttribute("userinfo"))).getID();
        
        logout = "注销";
    } else {
	nickName = "登录";
        logout = "";
    }
%>
<link href="/css/activity/NaviBar_sheet.css" type="text/css" rel="stylesheet" />
<link href="/css/activity/FooterBar_sheet.css" type="text/css" rel="stylesheet" />
<link href="/css/activity/flexagon.css" type="text/css" rel="stylesheet" />
<link href="/css/activity/indexPage_sheet.css" type="text/css" rel="stylesheet"/>
        
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/browser.js"></script>
<body>
    <header id="top_wrap">
        <div id="color_bar"></div>
        <div id="navi_header" class="navi-header-skin">
            <div id="navi">
                <div id="navi_text_left" class="navi-left">
                    <div class="navi-main-name">
                        <%if(type == AuthEntity.USER_ROLE){%>
                        <a href="/login.do?redirectURL=%2FshowUserHome.do">
                            <%}else if(type == AuthEntity.GROUP_ROLE){%>
                            <a href="/login.do?redirectURL=%2FshowGroupHome.do?groupId=<%=id%>">
                            <%}%>
                            
                            <b><%=nickName%></b></a></div>
                    <div class="navi-main"><a id="activity_link" href="/studentActivity/showActivitiesList.do" target="_blank"><b>活动</b></a></div>
                    <div class="navi-main">
                        <%if(type == AuthEntity.USER_ROLE){%>
                            <a id="individual_link" href="/login.do?redirectURL=%2FshowUserHome.do">
                        <%}else if(type == AuthEntity.GROUP_ROLE){%>
                            <a id="individual_link" href="/login.do?redirectURL=%2FshowGroupHome.do?groupId=<%=id%>">
                        <%}%>
                    <b>我的学清</b></a></div>
                </div>
                <div id="navi_text_right" class="navi-side">
                    <%if(isLogin != null){%>
                    <div class="navi-main"><a href="/mysthu.do"><b>回到旧版</b></a></div>
                    <%}%>
                    <div class="navi-main"><a id="login_out_link" href="/logout.do"><b><%=logout%></b></a></div>
                </div>
            </div>
        </div>
        <div id="navi_logo" class="navi-logo-skin">
            <div id="logo">
                <a href="/index.do">
                    <img id="xsqh_logo" src="/css/activity/logo.jpg" />
                </a>
                <div id="input_navi" class="input-navi-style">
            <form id="search_form" name="search_form" action="/studentActivity/searchStudentActivity.do" method="get">
            <div><input id="input_box" class="input-navi-border" name="searchKeywords"/></div>
            </form>
             <div class="input-text">
                <div id="btn_search" class="selected-border">
                    <div class="search-bar-text"><a style="cursor: pointer;"><b>搜索</b></a></div>
                </div>
             </div>
        </div>
            </div>
        
        </div>
                
            
    </header>
                <div id="backdiv" class="backdiv">  
                    <!-- 画折角效果 -->
            <div id="content_flexagon1" class="flexagon-style">
                <!-- 左折角 -->
                <div id="flexagon1">
                    <canvas id="c1" width="8" height="8"></canvas>
                    <script>
                        var myCanvas = document.getElementById("c1");
                        var context = myCanvas.getContext("2d");
                        context.lineWidth = 1;
                        context.beginPath();
                        context.fillStyle = "black";
                        context.moveTo(8, 8);
                        context.lineTo(8, 0);
                        context.lineTo(0, 8);
                        context.fill();
                    </script>
                </div>
                <!-- 右折角 -->
                <div id="flexagon2">
                    <canvas id="c2" width="8" height="8"></canvas>
                    <script>
                        var myCanvas = document.getElementById("c2");
                        var context = myCanvas.getContext("2d");
                        context.lineWidth = 1;
                        context.beginPath();
                        context.fillStyle = "black";
                        context.moveTo(0, 0);
                        context.lineTo(0, 8);
                        context.lineTo(8, 8);
                        context.fill();
                    </script>
                </div>
            </div>
                <div id="navibar" class="noprint">
		<div class="navibtn"><a href="/index.do"><img src="/css/index/navi0-1.png" /></a></div>
		<div class="navibtn"><a href="/column/column.do?id=2" target="_blank"><img src="/css/index/navi1.png" /></a></div>
		<div class="navibtn"><a href="/column/column.do?id=8" target="_blank"><img src="/css/index/navi2.png" /></a></div>
		<div class="navibtn"><a href="/studentActivity/showActivitiesList.do" target="_blank"><img src="/css/index/navi3.png" /></a></div>
		<div class="navibtn"><a href="http://146.tsinghua.me" target="_blank"><img src="/css/index/navi4.png" /></a></div>
		<div class="navibtn"><a href="/column/column.do?id=6" target="_blank"><img src="/css/index/navi5.png" /></a></div>
		<div class="navibtn"><a href="/activity/applyNotice.jsp" target="_blank"><img src="/css/index/navi6.png" /></a></div>
		<div class="navirightbtn"><a href="/ticket/ticketNotice.jsp" target="_blank"><img src="/css/index/navi7-1.png" /></a></div>
	    </div>
        <script type="text/javascript">
            $("#btn_search").click(function(){
                document.getElementById("input_box").value = encodeURIComponent(document.getElementById("input_box").value);
            
                $('#search_form').submit();
                document.getElementById("input_box").value="";
                return false;
            });
            $("#input_box").keydown(function(){
                if(event.keyCode == 13){
                    document.getElementById("input_box").value = encodeURIComponent(document.getElementById("input_box").value);
                    $('#search_form').submit();
                    document.getElementById("input_box").value="";
                    return false;
                }
            });
           
	</script>
	
