<%-- 
    Document   : allColumn
    Created on : 2013-2-22, 17:11:22
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.message.ShowColumnsMessage"%>
<%@page import="cn.edu.tsinghua.sthu.entity.ColumnEntity"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>栏目浏览</title>
    </head>
    <%!
        public ShowColumnsMessage showColumnsMessage;
    %>
    <%
        showColumnsMessage = (ShowColumnsMessage) request.getAttribute("showColumnsMessage");
    %>
    <%@include file="/templates/general_header.jsp" %>
    <link rel="stylesheet" type="text/css" href="/css/new/new.css" />
    <div id="div_left">
        <div id="position">您当前的位置：<a href="/column/showColumns.do">浏览栏目</a></div>
        <div id="blank_div"></div>
        <div id="columns"></div>
    </div>
    <div id="div_right">
        <div class="blank_div"></div>
        <div id="subject">
            <div id="tab"></div>
            <div id="text"><center><span>专题</span></center></div>
            <div id="subject_body">
                <div id="subject_item"><img src="/css/new/subject1.png"></div>
                <div id="subject_item"><img src="/css/new/subject2.png"></div>
                <div id="subject_item"><img src="/css/new/subject3.png"></div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <script type="text/javascript" src="/js/pageview.js"></script>
    <script type="text/javascript">
	var pageConfig = {
	    root:$("#columns"),
	    url:"/column/columnPageInView.do",
	    total:<%=showColumnsMessage.getColumnNumber() %>,
	    current:1,
	    arguName:"page",
	    css:false
	};
	init(pageConfig);
        adjustHeight(pageConfig);
    </script>
    <%@include file="/templates/general_footer.jsp" %>
</html>
