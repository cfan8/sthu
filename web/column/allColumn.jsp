<%-- 
    Document   : allColumn
    Created on : 2013-2-22, 17:11:22
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.entity.ColumnEntity"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>栏目浏览</title>
    </head>
    <%!
        public List<ColumnEntity> columns;
    %>
    <%
        columns = (List<ColumnEntity>) request.getAttribute("columns");
    %>
    <%@include file="/templates/general_header.jsp" %>
    <% for (int i = 0; i < columns.size(); i++)
               { %>
               <a href="/column/column.do?id=<%=columns.get(i).getID()%>"><%=columns.get(i).getName() %></a></br>
               <% } %>
    <%@include file="/templates/general_footer.jsp" %>
</html>
