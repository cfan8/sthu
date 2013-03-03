<%-- 
    Document   : columnmanagement.jsp
    Created on : 2013-2-19, 0:54:54
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.message.ColumnManagementPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
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
    <link rel="stylesheet" type="text/css" href="/css/new/columnManage.css" />
    <div id="position">您的当前位置：<a href="/column/columnsManage.do">栏目管理</a></div>
    <div id="add_column_div">
        <a href="/column/editColumnPage.do" title="点击添加栏目">添加栏目</a>
    </div>
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
