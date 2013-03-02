<%--
    Document   : error
    Created on : 2013-1-28, 12:21:28
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/css/error/error.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>500 Internal Error</title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
        <img class="errorImage" src="/css/error/error.png"></img>
	<h1>您请求的内容在不存在，或者您没有相应的权限！</h1>
	<p>请检查输入网址是否正确。或者：</br>
        <a href="index.do" target="_blank">1）返回首页</a></br>
        <a href="checkUser.do" target="_blank">2）返回上一页</a></p>
    <%@include file="/templates/general_footer.jsp" %>
</html>
