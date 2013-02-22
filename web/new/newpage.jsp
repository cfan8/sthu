<%-- 
    Document   : newpage
    Created on : 2013-2-17, 16:25:53
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.entity.NewEntity"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
    private List<NewEntity> news;
   %>
<%
    news = (List<NewEntity>) request.getAttribute("news");
%><body>
<div style="background-color:#DDEEDD;width: 1000px">
    </br>
    <ul style="list-style: none; width: 900px">
    <% for (int i = 0; i < news.size(); i++)
       { 
        if (i % 2 == 1) 
        { %>
        <li style="background-color:#ffff99;height: 40px">
        <%}
        else
        { %>
        <li style="background-color:#ffffff;height:40px">
        <% } %>
        <div style="width: 150px;float: left"><b style="color: blueviolet;font-family: inherit"><%=news.get(i).getColumnBelong().getName() %></b></div>
        <div style="width: 300px;float: left"><a href="/new/editNewPage.do?id=<%=news.get(i).getID()%>"><%=news.get(i).getTitle() %></a>
            <% if (news.get(i).isIsPlacedInColumnTop() == true) { %><b style="color: red">置顶</b> <% } else { } %>
        </div>
            <div style="width: 200px;float: left;padding-left: 50px"><%=Util.dateToStringAccurateToMinute(news.get(i).getUpdateTime()) %></div>
            <div style="width: 80px;float: left;padding-left: 20px"><%=news.get(i).getAuthor() %></div>
        <div style="width: 60px;float: left;padding-left: 40px"><a href="/new/deleteNew.do?id=<%=news.get(i).getID()%>">删除</a></div>
    </li>
    <% } %>
    </ul>
</div></body>
</html>
