<%--
    Document   : addUser
    Created on : 2013-1-30, 20:59:45
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加用户</title>
    </head>
    <body>
        <form action="addUser.do" method="post">
	    用户名：<input type="text" name="username" /><br/>
	    密码：<input type="text" name="password" /><br/>
	    昵称：<input type="text" name="nickname" /><br/>
	    <input type="submit" value="提交">
	</form>
        <form action="batchAddUser.do" method="post">
            用户列表：<input type="text" name="userlist"/><br/>
	    <input type="submit" value="提交">
	</form>
        
    </body>
</html>
