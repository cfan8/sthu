<%-- 
    Document   : show_my_activity_apply_list
    Created on : 2013-2-22, 20:05:56
    Author     : luzhen
--%>
<%@page import="cn.edu.tsinghua.sthu.action.outdoor.ShowMyActivityApplyAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.outdoor.ShowMyActivityApplyMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowMyActivityApplyMessage message = Util.getMessage(ShowMyActivityApplyAction.class);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>显示我的活动申请</title>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
    </head>
    <body>
	<div id="pageview"></div>
	<script type="text/javascript">
	    var pageConfig = {
		root:$("#pageview"),
		url:"showMyActivityApplyPage.do",
		total:<%=message.getTotalPageNumber() %>,
		current:1,
		arguName:"page",
		css:false
	    };
	    init(pageConfig);
	</script>
    </body>
</html>
