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
    <link rel="stylesheet" type="text/css" href="/css/new/new.css" />
    <%!
        private ColumnNewListPageMessage message;
    %>
    <%
        message = (ColumnNewListPageMessage) request.getAttribute("columnNewListPageMessage");
    %>
    <div id="new_list_div">
        <ul>
        <% for (int i = 0; i < message.getNewList().size(); i++)
            { %>
                <li>
                    <div id="new_list_top_div">
                        <div class="title">
                            <a href="/new/new.do?id=<%=message.getNewList().get(i).getID()%>" title="<%=message.getNewList().get(i).getTitle()%>"><%=message.getNewList().get(i).getTitle()%></a>
                            <% if (message.getNewList().get(i).isIsPlacedInColumnTop()) { %>
                            <span class="onTop">【置顶】</span>
                            <% } %>
                        </div>  
                        <div class="date"><%=Util.dateToStringAccurateToDayFormat1(message.getNewList().get(i).getUpdateTime())%></div>
                        <div class="clear"></div>
                    </div>
                    <div class="new_bstract"><%=message.getNewList().get(i).getNewAbstract()%></div>
                    <hr id="new_hr"/>
                </li>
          <% } %>
        </ul>
    </div>
</html>
