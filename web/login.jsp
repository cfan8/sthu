<%-- 
    Document   : login
    Created on : 2013-2-2, 14:09:34
    Author     : linangran
--%>

<%@page import="cn.edu.tsinghua.sthu.action.ShowLoginPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowLoginPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
ShowLoginPageMessage message = Util.getMessage(ShowLoginPageAction.class);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <form action="checkUser.do?redirectURL=<%=message.getRedirectURL() %>" method="post">
	用户名：<input type="text" name="username"/>
	密码：<input type="password" name="password"/>
	<input type="submit" value="登录"/>
    </form>
    <%@include file="/templates/general_footer.jsp" %>
</html>
