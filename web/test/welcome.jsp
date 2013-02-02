<%--
    Document   : welcome
    Created on : 2013-1-9, 23:27:45
    Author     : linangran
--%>

<%@page import="cn.edu.tsinghua.sthu.action.LoginAction"%>
<%@page import="cn.edu.tsinghua.sthu.message.*"%>
<%@page import="java.util.Date"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
LoginMessage message = Util.getMessage(LoginAction.class);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login OK</title>
    </head>
    <body>
        <h1><%=message.getLoginDate().toString() %></h1>
        <h1><%=message.getNickName() %></h1>
	<a href="set_auth.jsp" target="_blank">设置用户权限</a>
	<a href="logout.do" target="_blank">设置用户权限</a>
    </body>
</html>
