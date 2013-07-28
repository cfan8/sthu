<%-- 
    Document   : adminhome
    Created on : 2013-2-2, 20:13:44
    Author     : linangran
--%>

<%@page import="cn.edu.tsinghua.sthu.entity.AuthEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.ShowHomeAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.HomeMessage"%>
<%@page import="cn.edu.tsinghua.sthu.action.ShowApplyListPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.action.outdoor.ShowActivityApplyListPageAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HomeMessage message = Util.getMessage(ShowHomeAction.class);
    AuthEntity entity = message.getAuth();
    int classType = -1;
    int actType = -1;
    if (entity.getOpIdentityCode() != -1) {
	classType = ShowApplyListPageAction.APPROVE_TYPE_IDENTITY;
	actType = ShowActivityApplyListPageAction.APPROVE_TYPE_IDENTITY;
    } else if (entity.getOpResourceCode() != -1) {
	classType = ShowApplyListPageAction.APPROVE_TYPE_RESOURCE;
	actType = ShowActivityApplyListPageAction.APPROVE_TYPE_RESOURCE;
    } else if (entity.getOpAllocateCode() != -1) {
	classType = ShowApplyListPageAction.APPROVE_TYPE_ALLOCATE;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学生清华管理页面</title>
	<style>
	    #container
	    {
		padding-bottom: 10px;
	    }
	    
	    #classapply, #actapply
	    {
		width: 430px;
		border: #cccccc;
		border-style: solid;
		border-width: 1px;
		border-left-width: 10px;
		border-left-color: #cccccc;
		margin-top: 5px;
		box-shadow: 3px 2px 3px #CCD2C5;
		position: relative;
		float: left;
	    }
	     #actapply
	     {
		 margin-left: 30px;
	     }
	    
	    iframe
	    {
		border: none;
		width: 100%;
		height: 305px;
	    }
	    
	    #approveDiv
	    {
		width: 912px;
	    }
	    
	    #welcome
	    {
		position: relative;
		width: 912px;
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
		width: 422px;
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
		float: right;
		display: inline-block;
		margin-left: 10px;
		margin-top: 14px;
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
    <div id="welcome">
        <div id="welcometext">欢迎来到学清管理页面！</div>
        <a class="logout" href="/logout.do">登出</a>
        
        <a class="logout" href="update_password.jsp">修改密码</a>
        <% if (entity.getRole() == 2) { %>
            <a class="logout" href="showEmail.do">邮箱管理</a>
        <% } %>
        <% if (entity.getOpArticle() > -1) { %>
            <a class="logout" href="/new/newsManage.do">新闻管理</a>
            <a class="logout" href="/showIndexManage.do">首页管理</a>
        <% } %>
    </div>
    <div id="approveDiv">
	<% if (classType != -1) {%>
	<div id="classapply">
	    <div class="title">教室申请审批</div>
	    <div class="content"><iframe id="frame0" src="/activity/showApplyList.do?viewType=1&approveType=<%=classType%>"></iframe></div>
	</div>
	<% }%>
	<% if (actType != -1) {%>
	<div id="actapply">
	    <div class="title">活动申请审批</div>
	    <div class="content"><iframe id="frame1" src="/studentActivity/showStudentActivityApplyPage.do?viewType=1&approveType=<%=actType%>"></iframe></div>
	</div>
	<% }%>
	<div style="clear: both"></div>
    </div>

<%@include file="/templates/general_footer.jsp" %>
</html>
