<%-- 
    Document   : pageview_example
    Created on : 2013-2-3, 14:57:24
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>分页测试</title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <div id="pv1"></div>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <div id="pv2"></div>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <p>bla bla bla</p>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript" src="/js/pageview.js"></script>
    <script type="text/javascript">
	var pageConfig = {
	    root:$("#pv1"),
	    url:"/test/page.do",
	    total:100,
	    current:1,
	    arguName:"page",
	    css:false
	};
	var pageConfig2 = {
	    root:$("#pv2"),
	    url:"/test/page.do",
	    total:20,
	    current:5,
	    arguName:"page",
	    css:false
	};
	init(pageConfig);
	init(pageConfig2);
    </script>
</html>
