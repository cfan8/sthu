<%-- 
    Document   : columnPageInView
    Created on : 2013-3-2, 22:44:07
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
    <link rel="stylesheet" type="text/css" href="/css/new/column.css" />
    <%!
        private ColumnPageMessage message;
    %>
    <%
        message = (ColumnPageMessage) request.getAttribute("columnPageMessage");
    %>
    <div id="column_list_div">
        <ul>
        <% for (int i = 0; i < message.getColumns().size(); i++)
            { %>
                <li>
                    <div class="title">
                        <a href="/column/column.do?id=<%=message.getColumns().get(i).getID()%>" title="<%=message.getColumns().get(i).getName() %>"><%=message.getColumns().get(i).getName() %></a>
                    </div>  
                    <hr id="column_hr"/>
                </li>
          <% } %>
        </ul>
    </div>
</html>
