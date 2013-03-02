<%-- 
    Document   : userhome
    Created on : 2013-2-2, 20:13:23
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>我的学生清华</title>
	<style>
	    #container
	    {
		padding-bottom: 10px;
	    }
	    
	    #classapply, #actapply, #ticketapply
	    {
		width: 670px;
		border: #cccccc;
		border-style: solid;
		border-width: 1px;
		border-left-width: 10px;
		border-left-color: #cccccc;
		margin-top: 5px;
		box-shadow: 3px 2px 3px #CCD2C5;
		position: relative;
	    }
	    
	    iframe
	    {
		border: none;
		width: 100%;
		height: 180px;
	    }
	    
	    #welcome
	    {
		position: relative;
		width: 680px;
		height: 40px;
	    }
	    
	    #welcometext
	    {
		font-size: 24px;
		line-height: 24px;
		display: inline-block;
		height: 26px;
		margin: 7px;
		font-family: 微软雅黑;
	    }
	    
	    #main .title
	    {
		width: 662px;
		height: 26px;
		padding: 6px 0px 6px 8px;
		font-size: 18px;
		font-family: 微软雅黑;
		background-color: #deeff7;
	    }
	    
	    #main .content
	    {
		width: 100%;
	    }
	    
	    .newbtn a:link, .newbtn a:visited
	    {
		color: #36424a;
		font-family: 微软雅黑;
		text-decoration: none;
	    }
	    
	    .newbtn a:hover
	    {
		text-decoration: underline;
	    }
	    
	    .newbtn
	    {
	    }
	    
	    .button
	    {
		position: absolute;
		display: block;
		top: 5px;
		right: -8px;
		background-color: #adc2cc;
		display: inline-block;
		width: 105px;
		height: 26px;
		line-height: 26px;
		padding-left: 5px;
		font-size: 15px;
	    }
	    
	    .logout{
		font-family: 微软雅黑;
		color: #36424a;
		position:absolute; 
		top: 14px; 
		right: 0px
	    }
	    
	    #welcome a:link, #welcome a:visited{
		text-decoration: none;
	    }
	    
	    #welcome a:hover{
		text-decoration: underline;
	    }
	    
	    </style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <div id="welcome"><div id="welcometext">欢迎来到我的学清！</div><a class="logout" href="/logout.do">登出</a></div>
    <div id="classapply">
	<div class="title">我的教室申请</div><div class="newbtn"><a class="button add" href="/activity/applyClassroom.do" target="_blank" >申请教室资源</a></div>
	<div class="content"><iframe id="frame0" src="/activity/showMyApply.do"></iframe></div>
    </div>
    <div id="actapply">
	<div class="title">我的活动资源申请</div><div class="newbtn"><a class="button add" href="/outdoor/applyActivity.do" target="_blank" >申请活动资源</a></div>
	<div class="content"><iframe id="frame1" src="/outdoor/showMyActivityApply.do"></iframe></div>
    </div>
    <div id="ticketapply">
	<div class="title">我的订票</div>
	<div class="content" style="text-align: center;padding: 12px;width: 656px;" >没有订票！</div>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <script>
    </script>
</html>
