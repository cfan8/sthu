<%-- 
    Document   : columnmanagement.jsp
    Created on : 2013-2-19, 0:54:54
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.message.ColumnManagementPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>栏目管理</title>
    </head>
    <%!
        public ColumnManagementPageMessage columnMPM;
    %>
    <%
        columnMPM = (ColumnManagementPageMessage) request.getAttribute("columnManagementPageMessage");
    %>
    <%@include file="/templates/general_header.jsp" %>
    <a href="/column/editColumnPage.do" style="background-color: ghostwhite"><b>添加栏目</b></a></br>
    <div id="columns">
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript" src="/js/pageview.js"></script>
    <script type="text/javascript">
	var pageConfig = {
	    root:$("#columns"),
	    url:"/column/columnPage.do",
	    total:<%=columnMPM.getPageNumber() %>,
	    current:1,
	    arguName:"page",
	    css:false
	};
	init(pageConfig);
    </script>
</html>
