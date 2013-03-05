<%--
    Document   : error
    Created on : 2013-1-28, 12:21:28
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/css/error/error.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>500 Internal Error</title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
        <img class="errorImage" src="/css/error/error.png"></img>
	<h1>服务器内部错误，无法显示页面，请检查地址是否正确并稍后再试。</h1>
	<p>如始终无法正常显示，请联系管理员或者：</br>
        <a href="/index.do" >1）返回首页</a></br>
        <a href="javascript:history.back(-1)">2）返回上一页</a></p>
	<div style="display: none">
	    <div id="exception"><%=request.getAttribute("exception") %></div>
	    <div id="stackTrace"><%=request.getAttribute("exceptionStack") %></div>
	</div>
    <%@include file="/templates/general_footer.jsp" %>
</html>
