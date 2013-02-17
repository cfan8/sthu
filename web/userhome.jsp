<%-- 
    Document   : userhome
    Created on : 2013-2-2, 20:13:23
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>我的学生清华</title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    我的申请：
    <iframe src="activity/showMyApply.do"></iframe>
    
    <a href="update_password.jsp">修改密码</a>
    <a href="logout.do">登出</a>
    <%@include file="/templates/general_footer.jsp" %>
</html>
