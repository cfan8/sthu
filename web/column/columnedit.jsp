<%-- 
    Document   : newColumnPage
    Created on : 2013-2-10, 23:41:44
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.message.ColumnEditPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>栏目编辑</title>
    </head>
    <%!
        public ColumnEditPageMessage columnEPM;
    %>
    <%
        columnEPM = (ColumnEditPageMessage) request.getAttribute("columnEditPageMessage");
    %>
    <%@include file="/templates/general_header.jsp" %>
    <% if (columnEPM.getId() < 0) { %>
    <form action="/column/addColumn.do" method="post">
        栏目名：<input type="text" name="name"/><br/>
        栏目描述：<input type="text" name="description"/><br/>
        可否可见：<input type="radio" name="isVisibleForUser" value="true" checked="checked">是</input>
        <input type="radio" name="isVisibleForUser" value="false">否</input><br/>
        可否固定在主页：<input type="radio" name="isFixedInHomePage" value="true">是</input>
        <input type="radio" name="isFixedInHomePage" value="false" checked="checked">否</input><br/>
        <input type="submit" value="添加"/>
    </form>
    <% }
        else{ %>
        <form action="/column/updateColumn.do?id=<%=columnEPM.getId()%>" method="post">
            栏目名：<input type="text" name="name" value="<%=columnEPM.getColumnEntity().getName()%>"/><br/>
            栏目描述：<input type="text" name="description" value="<%=columnEPM.getColumnEntity().getDescription()%>"/><br/>
            可否可见：<input type="radio" name="isVisibleForUser" value="true" <% if (columnEPM.getColumnEntity().isIsVisibleForUser()) { %>checked="checked" <% } %>>是</input>
            <input type="radio" name="isVisibleForUser" value="false" <% if (columnEPM.getColumnEntity().isIsVisibleForUser() == false) { %>checked="checked" <% } %>>否</input><br/>
            可否固定在主页：<input type="radio" name="isFixedInHomePage" value="true" <% if (columnEPM.getColumnEntity().isIsFixedInHomePage()) { %>checked="checked" <% } %>>是</input>
            <input type="radio" name="isFixedInHomePage" value="false" <% if (columnEPM.getColumnEntity().isIsFixedInHomePage() == false) { %>checked="checked" <% } %>>否</input><br/>
            <input type="submit" value="更新"/>
        </form>
              <% } %>
    <%@include file="/templates/general_footer.jsp" %>
</html>
