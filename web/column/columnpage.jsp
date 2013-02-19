<%-- 
    Document   : columnpage
    Created on : 2013-2-19, 3:15:43
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.message.ColumnPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        private ColumnPageMessage message;
    %>
    <%
        message = (ColumnPageMessage) request.getAttribute("columnPageMessage");
    %>
    <%@include file="/templates/general_header.jsp" %>
    <div style="background-color:#DDEEDD;width: 1000px">
    </br>
    <ul style="list-style: none; width: 850px">
        <li style="background-color:#ffff99;height: 40px">
        <div style="width: 240px;float: left"><b style="color: black;font-family: inherit">栏目名称</b></div>
        <div style="width: 180px;float: left;padding-left: 50px"><b style="color: black;font-family: inherit">是否可见</b></div>
        <div style="width: 210px;float: left;padding-left: 20px"><b style="color: black;font-family: inherit">是否固定在首页</b></div>
        </li>
    <% for (int i = 0; i < message.getColumns().size(); i++)
       { 
        if (i % 2 == 1) 
        { %>
        <li style="background-color:#ffff99;height: 40px">
        <%}
        else
        { %>
        <li style="background-color:#ffffff;height:40px">
        <% } %>
        <div style="width: 240px;float: left"><a href="/column/editColumnPage.do?id=<%=message.getColumns().get(i).getID()%>"><b style="color: blueviolet;font-family: inherit"><%=message.getColumns().get(i).getName() %></b></a></div>
        <div style="width: 160px;float: left;padding-left: 70px"><%=message.getColumns().get(i).isIsVisibleForUser() %></div>
        <div style="width: 160px;float: left;padding-left: 70px"><%=message.getColumns().get(i).isIsFixedInHomePage() %></div>
        <div style="width: 110px;float: left;padding-left: 40px"><a href="/column/deleteColumn.do?id=<%=message.getColumns().get(i).getID()%>">删除</a></div>
    </li>
    <% } %>
    </ul>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
</html>
