<%-- 
    Document   : showUser
    Created on : 2013-3-5, 17:05:02
    Author     : linangran
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.action.InitUserAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.InitMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
InitMessage message = Util.getMessage(InitUserAction.class);
List<UserEntity> list = message.getList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>管理员帐号密码如下</title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <table>
	<tr><td>用户名</td><td>密码（8位小写字母）</td><td>帐号权限</td>
	    </tr>
	<% for(int i = 0; i <list.size(); i++) {
	    UserEntity entity = list.get(i);
    %>
    <tr><td><%=entity.getUsername() %></td><td><%=entity.getPassword() %></td><td><%=entity.getNickname() %></td></tr>
    <% }%>
    </table>
    <%@include file="/templates/general_footer.jsp" %>
</html>
