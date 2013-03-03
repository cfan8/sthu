<%-- 
    Document   : show_my_apply_list
    Created on : 2013-2-17, 22:27:39
    Author     : linangran
--%>

<%@page import="cn.edu.tsinghua.sthu.action.ShowMyClassroomApplyAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowMyClassroomApplyMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowMyClassroomApplyMessage message = Util.getMessage(ShowMyClassroomApplyAction.class);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>显示我的申请</title>
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
		url:"showMyApplyPage.do",
		total:<%=message.getTotalPageNumber() %>,
		current:1,
		arguName:"page",
		css:false
	    };
	    init(pageConfig);
	</script>
    </body>
</html>
