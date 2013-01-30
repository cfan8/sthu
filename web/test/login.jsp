<%--
    Document   : login
    Created on : 2013-1-9, 23:27:30
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
    </head>
    <body>
         <form action="login.do" method="post">
	    用户名：<input type="text" name="username"/>
	    密码：<input type="text" name="password"/>
	    <input type="submit"/>
	</form>
    </body>
</html>
