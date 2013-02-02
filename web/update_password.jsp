<%-- 
    Document   : update_password
    Created on : 2013-2-2, 19:32:05
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改密码</title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <form action="updatePassword.do" method="post">
	旧密码：<input type="password" name="oldPassword" />
	新密码：<input type="password" name="newPassword" />
	确认密码：<input type="password" name="repeatPassword" />
	<input type="submit" value="确定" />
    </form>
    <%@include file="/templates/general_footer.jsp" %>
</html>
