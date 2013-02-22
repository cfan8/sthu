<%-- 
    Document   : columnNewListPage.jsp
    Created on : 2013-2-22, 16:53:51
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ColumnNewListPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        private ColumnNewListPageMessage message;
    %>
    <%
        message = (ColumnNewListPageMessage) request.getAttribute("columnNewListPageMessage");
    %>
    <div style="background-color:#DDEEDD;width: 100%x">
    </br>
    <ul style="list-style: none; width: 85%">
    <% for (int i = 0; i < message.getNewList().size(); i++)
       { 
        if (i % 2 == 1) 
        { %>
        <li style="background-color:#ffff99;height: 40px">
        <%}
        else
        { %>
        <li style="background-color:#ffffff;height:40px">
        <% } %>
        <div style="width: 240px;float: left"><a href="/new/new.do?id=<%=message.getNewList().get(i).getID()%>"><b style="color: blueviolet;font-family: inherit"><%=message.getNewList().get(i).getTitle() %></b></a></div>
        <% if (message.getNewList().get(i).isIsPlacedInColumnTop()) { %> <div style="width: 120px;float: left"><strong style="color: red">置顶</strong></div> <% } %>
        <div style="width: 150px;float: left;padding-left: 70px"><%=Util.dateToStringAccurateToDay(message.getNewList().get(i).getUpdateTime())%></div>
     </li>
    <% } %>
    </ul>
    </div>
</html>
