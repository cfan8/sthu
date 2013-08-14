<%-- 
    Document   : grouphome
    Created on : 2013-8-13, 15:00:20
    Author     : xiaobo
--%>

<%@page import="cn.edu.tsinghua.sthu.action.ShowGroupHomeAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowGroupHomeMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowGroupHomeMessage message = Util.getMessage(ShowGroupHomeAction.class);
    Integer showFollow = message.getShowFollow();
    Integer isGroupFollowed = message.getIsGroupFollowed();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>社团主页</title>
        <script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
	<style>
	    ul{
		list-style-type: square;
		padding-left: 120px;
		color: #105162;
		font-weight: bold;
	    }
	    
	    ul a:link, ul a:visited
	    {
		text-decoration: none;
		color: #105162;
	    }
	    
	    ul a:hover
	    {
		color: black;
		text-decoration: underline;
	    }
	</style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <%if(showFollow == 1){%>
    <%if(isGroupFollowed == 1){%>
    <a href="/followGroup.do?type=0&groupId=<%=message.getGroupId()%>">取消关注</a>
    <%}else{%>
    <a href="/followGroup.do?type=1&groupId=<%=message.getGroupId()%>">添加关注</a>
    <%}}%>
    
        <div>
	    <div id="pageview"></div>
	</div>
	<script type="text/javascript">
	    var pageConfig = {
		root:$("#pageview"),
		url:"/showGroupPageHome.do?groupId=<%=message.getGroupId()%>",
		total:<%=message.getTotalPageNumber()%>,
		current:1,
		arguName:"page",
		css:false
	    };
	    init(pageConfig);
	</script>
    <%@include file="/templates/general_footer.jsp" %>
</html>
