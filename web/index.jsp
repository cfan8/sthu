<%-- 
    Document   : main_index
    Created on : 2013-2-27, 17:16:16
    Author     : linangran
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.IndexSettingEntity"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.constant.IndexColumnMapping"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowIndexMessage"%>
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
    <%!	public ShowIndexMessage showIndexMessage;
    %>
    <%
	showIndexMessage = (ShowIndexMessage) request.getAttribute("showIndexMessage");
	List<IndexSettingEntity> settings = showIndexMessage.getIndexSettings();
    %>
    <body>
	<div id="bg_container"></div>
	<div id="all">
	    <div id="top">
		<div id="logo"><a href="/index.do">
			<img src="/css/index/logo.png" />
		    </a></div>
		<div id="logininfo"><span><a href="/login.do?redirectURL=%2Fmysthu.do"><%=nickName%></a></span></div>
		<div id="toplink"><a href="http://166.111.17.5/shijian/" target="_blank">清华大学社会实践在线平台</a><span class="splitspan">|</span><a href="http://sutuo.student.tsinghua.edu.cn" target="_blank" >清华大学素质拓展计划</a><span class="splitspan">|</span><a href="http://www.bv2008.cn/" target="_blank">志愿北京平台</a><span class="splitspan">|</span><a href="http://daf.tsinghua.edu.cn/" target="_blank">清华博学网</a></div>
	    </div>
	    <div id="banner">
		<div id="bannerimg"><img src="/css/index/banner.png"></img></div>
		<div id="navibar">
		    <div class="navibutton"><a href="/index.do"><img src="/css/index/navi0.png" /></a></div>
                    <div class="navibutton"><a href="/column/showColumns.do" target="_blank"><img src="/css/index/navi1.png" /></a></div>
		    <div class="navibutton"><a href="/column/column.do?id=8"><img src="/css/index/navi2.png" /></a></div>
		    <div class="navibutton"><a href="/column/column.do?id=7"><img src="/css/index/navi3.png" /></a></div>
		    <div class="navibutton"><a href="http://146.tsinghua.me" target="_blank"><img src="/css/index/navi4.png" /></a></div>
		    <div class="navibutton"><a href="/column/column.do?id=6"><img src="/css/index/navi5.png" /></a></div>
		    <div class="navibutton"><a href="/activity/applyNotice.jsp"><img src="/css/index/navi6.png" /></a></div>
		    <div class="navibutton"><a href="/ticket/ticketNotice.jsp"><img src="/css/index/navi7.png" /></a></div>
		</div>
	    </div>
	    <div id="main">
		<div id="slide">
		    <div id="imagebox"></div>
		    <div id="tipbox"><div id="tiptextarea"><div id="tiptext"></div></div><div id="tipbtn"></div></div>
		</div>
		<div id="note">
                    <div class="title"><div class="morediv"><a href="/column/column.do?id=<%=IndexColumnMapping.IndexTopColumnId%>" target="_blank">&gt;&gt;more</a></div></div>
		    <div class="content">
			<% int max = showIndexMessage.getIndexTopNews().size() > 10 ? 10 : showIndexMessage.getIndexTopNews().size();
                            for(int i= 0; i < max; i++){  %>
                                <div <% if (showIndexMessage.getIndexTopNews().get(i).isIsPlacedInColumnTop()){ %> class="noteitem top1" 
                                      <% } else { %> class="noteitem top0" <% } %> >
                                    <a href="/new/new.do?id=<%=showIndexMessage.getIndexTopNews().get(i).getID()%>" target="_blank"
                                       title="<%=showIndexMessage.getIndexTopNews().get(i).getTitle()%>"><% if (showIndexMessage.getIndexTopNews().get(i).getTitle().length() > 18) { %>  <%=showIndexMessage.getIndexTopNews().get(i).getTitle().substring(0, 18).concat("..")%>
                                        <% } else { %> <%=showIndexMessage.getIndexTopNews().get(i).getTitle()%> <% } %> </a>
			</div>
			<% }%>
		    </div>
		</div>
		<div id="express">
		    <div class="title"><div class="morediv"><a href="#">&gt;&gt;more</a></div></div>
		    <div class="content">
			<div id="leftList">
                            <div class="listTitle"><a href="/column/column.do?id=<%=IndexColumnMapping.IndexBottomLeftColumnId %>" target="_blank"><img src="/css/index/express_t0.png"></img></a></div>
			    <div class="listContent">
				<ul>
				    <% max = showIndexMessage.getIndexBottomLeftNews().size() > 6 ? 6 : showIndexMessage.getIndexBottomLeftNews().size();
					for (int i = 0; i < max; i++) {
				    %>
				    <li><span class="newstitle"><a href="/new/new.do?id=<%=showIndexMessage.getIndexBottomLeftNews().get(i).getID()%>" target="_blank"
								   title="<%=showIndexMessage.getIndexBottomLeftNews().get(i).getTitle()%>"><% if (showIndexMessage.getIndexBottomLeftNews().get(i).getTitle().length() > 17) {%>  <%=showIndexMessage.getIndexBottomLeftNews().get(i).getTitle().substring(0, 17).concat("..")%> 
                                                <% } else {%> <%=showIndexMessage.getIndexBottomLeftNews().get(i).getTitle()%> <% }%> </a></span><span class="newsdate"><%=Util.dateToStringAccurateToDayFormat1(showIndexMessage.getIndexBottomLeftNews().get(i).getUpdateTime())%></span></li>
						<%}%>
				</ul>
			    </div>

			</div>
			<div id="rightList">
                            <div class="listTitle"><a href="/column/column.do?id=<%=IndexColumnMapping.IndexBottomCenterColumnId %>" target="_blank"><img src="/css/index/express_t1.png"></img></a></div>
			    <div class="listContent">
				<ul>
				    <% max = showIndexMessage.getIndexBottomCenterNews().size() > 6 ? 6 : showIndexMessage.getIndexBottomCenterNews().size();
					for (int i = 0; i < max; i++) {
				    %>
                                    <li><span class="newstitle"><a href="/new/new.do?id=<%=showIndexMessage.getIndexBottomCenterNews().get(i).getID()%>" target="_blank"
								   title="<%=showIndexMessage.getIndexBottomCenterNews().get(i).getTitle()%>"><% if (showIndexMessage.getIndexBottomCenterNews().get(i).getTitle().length() > 18) {%>  <%=showIndexMessage.getIndexBottomCenterNews().get(i).getTitle().substring(0, 18).concat("..")%>
                                                <% } else {%> <%=showIndexMessage.getIndexBottomCenterNews().get(i).getTitle()%> <% }%> </a></span><span class="newsdate"><%=Util.dateToStringAccurateToDayFormat1(showIndexMessage.getIndexBottomCenterNews().get(i).getUpdateTime())%></span></li>
						<%}%>
				</ul>				
			    </div>
			</div>
		    </div>
		</div>
		<div id="event">	
                    <div class="title"><div class="morediv"><a href="/column/column.do?id=<%=IndexColumnMapping.IndexBottomRightColumnId %>" target="_blank">&gt;&gt;more</a></div></div>
		    <div class="content">
			<% max = showIndexMessage.getIndexBottomRightNews().size() > 7 ? 7 : showIndexMessage.getIndexBottomRightNews().size();
			    for (int i = 0; i < max; i++) {%>
			<div class="eventitem">
                            <a href="/new/new.do?id=<%=showIndexMessage.getIndexBottomRightNews().get(i).getID()%>" target="_blank"
                               title="<%=showIndexMessage.getIndexBottomRightNews().get(i).getTitle()%>"><% if (showIndexMessage.getIndexBottomRightNews().get(i).getTitle().length() > 16) {%>  <%=showIndexMessage.getIndexBottomRightNews().get(i).getTitle().substring(0, 16).concat("..")%>
				<% } else {%> <%=showIndexMessage.getIndexBottomRightNews().get(i).getTitle()%> <% }%></a>
			</div>
			<% }%>
		    </div>
		</div>
		    <div id="weibo">
		    </div>
		<div id="subject">
		    <div class="title"><div class="morediv"><a href="#">&gt;&gt;more</a></div></div>
		    <div class="content">
			<div id="subjectimg">
			    <a href="#"><img src="/css/index/subject_t0.png"></img></a>
			    <a href="#"><img src="/css/index/subject_t1.png"></img></a>
			    <a href="#"><img src="/css/index/subject_t2.png"></img></a>
			</div>
			<div id="subjecttext">
			    <div class="normaltext">
				创业大讲堂——新媒体的创业路<br/>
				清华厚德2013年青少年冬令营，现...<br/>
				21世纪VC投资人对接会
			    </div>
			    <div id="midtext">
				创业大讲堂——新媒体的创业路<br/>
				清华厚德2013年青少年冬令营，现...<br/>
				21世纪VC投资人对接会
			    </div>
			    <div class="normaltext">
				创业大讲堂——新媒体的创业路<br/>
				清华厚德2013年青少年冬令营，现...<br/>
				21世纪VC投资人对接会
			    </div>
			</div>
		    </div>
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
    <script>
	//悬停下划线（CSS太麻烦！）
	$("a").mouseover(function(){
	    $(this).css("text-decoration", "underline");
	});
	
	$("a").mouseout(function(){
	    $(this).css("text-decoration", "none");
	});
	
	var imgs = new Array(
	<% for (int i = 0; i < settings.size(); i++) {
		IndexSettingEntity entity = settings.get(i);
	%>
	    '<%=entity.getImage()%>'<%=i==settings.size()-1?"":"," %>
	<% }%>
	);
	    var titles = new Array(
	<% for (int i = 0; i < settings.size(); i++) {
		IndexSettingEntity entity = settings.get(i);
	%>
	    '<%=entity.getTitle()%>'<%=i==settings.size()-1?"":"," %>
	<% }%>
	);
	    var links = new Array(
	<% for (int i = 0; i < settings.size(); i++) {
		IndexSettingEntity entity = settings.get(i);
	%>
	    '<%=entity.getLink()%>'<%=i==settings.size()-1?"":"," %>
	<% }%>
	);
	    init();
	    var timer;
	
	    var current = 0;
	    function init(){
		var imghtml = "";
		for (var i = 0; i < imgs.length; i++)
		{
		    imghtml += '<a href="' + links[i] + '" target="_blank"><img src="' + imgs[i] + '" id="slideimg' + i + '"></img>';  
		}
		$("#imagebox").html(imghtml);
	
		imghtml="";
		for (var i = 0; i < imgs.length; i++)
		{
		    imghtml += '<a href="#" id="imgbtn' + (imgs.length - 1 - i) + '"><img src="/css/index/tipbtn.png"></img></a>';
		}
		$("#tipbtn").html(imghtml);
	    
		for (var i = 0; i < imgs.length; i++)
		{
		    titles[i] = '<a href="' + links[i] + '">' + titles[i] + '</a>';
		}
	    
		for (var i = 0; i < imgs.length; i++)
		{
		    $("#imgbtn" + i).bind("click", {param1: i}, clickRecall);
		}
	    
		$("#slideimg0").show();
		$("#imgbtn0 img").css("opacity", "1");
		$("#tiptext").html(titles[0]);
		timer = setInterval(triggerRecall, 5000);
	    }
	
	    function triggerRecall()
	    {
		if (current == imgs.length - 1)
		{
		    showThis(0);
		}
		else 
		{
		    showThis(current + 1);
		}
	    }
	
	    function clickRecall(event)
	    {
		var t = event.data.param1;
		clearInterval(timer);
		timer = setInterval(triggerRecall, 5000);
		if (t == current)
		{
		    return false;
		}
		else 
		{
		    showThis(t);
		}
		return false;
	    }
	
	    function showThis(t)
	    {
		$("#slideimg" + current).css("z-index", "2");
		$("#slideimg" + t).css("z-index", "1");
		$("#slideimg" + t).show();
		$("#slideimg" + current).fadeOut(1000);
		$("#tiptextarea").fadeOut(500, function(){
		    $("#tiptext").html(titles[t]);
		    $("#tiptextarea").fadeIn(500);
		});
		$("#imgbtn" + current + " img").css("opacity", "0.5");
		$("#imgbtn" + t + " img").css("opacity", "1");
		current = t;
	    }
    </script>
</html>
