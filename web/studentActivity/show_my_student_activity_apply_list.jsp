<%-- 
    Document   : show_my_student_activity_apply_list
    Created on : 2013-7-27, 14:55:31
    Author     : xiaobo
--%>

<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowMyStudentActivityApplyAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowMyStudentActivityApplyMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowMyStudentActivityApplyMessage message = Util.getMessage(ShowMyStudentActivityApplyAction.class);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>显示我的活动申请</title>
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
    <body>
	<div id="pageview"></div>
	<script type="text/javascript">
	    var pageConfig = {
		root:$("#pageview"),
		url:"showMyStudentActivityApplyPage.do",
		total:<%=message.getTotalPageNumber() %>,
		current:1,
		arguName:"page",
		css:false
	    };
	    init(pageConfig);
	    adjustHeight(pageConfig);
	</script>
    </body>
</html>

