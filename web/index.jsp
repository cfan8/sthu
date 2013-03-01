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
		<div id="slide">
		    <div id="imagebox"></div>
		    <div id="tipbox"><div id="tiptextarea"><div id="tiptext"></div></div><div id="tipbtn"></div></div>
		</div>
		<div id="note">
		    <div class="title"><div class="morediv"><a href="#">&gt;&gt;more</a></div></div>
		    <div class="content">
			<% for(int i= 0; i < 10; i++){ %>
			<div class="noteitem top1">
			    <a href="#">清华校友柳百城院士励学今设立清华校友柳百城院士励学今设立</a>
			</div>
			<% }%>
		    </div>
		</div>
		<div id="express">
		    <div class="title"><div class="morediv"><a href="#">&gt;&gt;more</a></div></div>
		    <div class="content">
			<div id="leftList">
			    <div class="listTitle"><a href="#"><img src="/css/index/express_t0.png"></img></a></div>
			    <div class="listContent">
				<ul>
				    <% for (int i = 0; i < 6; i++) {
				    %>
				    <li><span class="newstitle"><a href="#">交叉信息学院第十六届量子信息处理国际会议</a></span><span class="newsdate">2013-01-21</span></li>
				    <%					}%>
				</ul>
			    </div>

			</div>
			<div id="rightList">
			    <div class="listTitle"><a href="#"><img src="/css/index/express_t1.png"></img></a></div>
			    <div class="listContent">
				<ul>
				    <% for (int i = 0; i < 6; i++) {
				    %>
				    <li><span class="newstitle"><a href="#">交叉信息学院第十六届量子信息处理国际会议交叉信息学院第十六届量子信息处理国际会议</a></span><span class="newsdate">2013-01-21</span></li>
				    <%					}%>
				</ul>				
			    </div>
			</div>
		    </div>
		</div>
		<div id="event">			
		    <div class="title"><div class="morediv"><a href="#">&gt;&gt;more</a></div></div>
		    <div class="content">
			<% for(int i = 0; i < 7; i++) { %>
			<div class="eventitem">
			    <a href="#">清华厚德2013年青少年冬令营清华厚德2013年青少年冬令营</a>
			</div>
			<% } %>
		    </div>
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
	var imgs = new Array(
	'/css/index/example2.jpg',
	'/css/index/example.png',
	'/css/index/example2.jpg',
	'/css/index/example.png'
    );
	var titles = new Array(
	'图片新闻:<br/>清华同时获2项2012年度国家技术发明奖一等奖',
	'你好：再见！',
	'图片新闻:<br/>清华同时获2项2012年度国家技术发明奖一等奖',
	'你好：<br/>再见！',
	'图片新闻:<br/>清华同时获2项2012年度国家技术发明奖一等奖'
    );
	var links = new Array(
	'#',
	'#',
	'#',
	'#',
	'#'
    );
	init();
	var timer;
	
	var current = 0;
	function init(){
	    var imghtml = "";
	    for (var i = 0; i < imgs.length; i++)
	    {
		imghtml += '<a href="' + links[i] + '"><img src="' + imgs[i] + '" id="slideimg' + i + '"></img>';  
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
