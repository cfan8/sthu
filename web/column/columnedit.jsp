<%-- 
    Document   : newColumnPage
    Created on : 2013-2-10, 23:41:44
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.message.ColumnEditPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>栏目编辑</title>
    </head>
    <%!        public ColumnEditPageMessage columnEPM;
    %>
    <%
        columnEPM = (ColumnEditPageMessage) request.getAttribute("columnEditPageMessage");
    %>
    <link rel="stylesheet" type="text/css" href="/css/new/columnEdit.css" />
    <%@include file="/templates/general_header.jsp" %>
    <div id="position">您的当前位置：<a href="/column/columnsManage.do">栏目管理</a>>>栏目编辑</div>
    <% if (columnEPM.getId() < 0) {%>
    <form action="/column/addColumn.do" method="post">
        <div id="column_edit_div">
            <div class="name"><span>栏目名：</span><input type="text" name="name"/></div>
            <div class="description"><span>栏目描述：</span><input type="text" name="description"/></div>
            <div class="visible">
                <span>可否可见：</span><input type="radio" name="isVisibleForUser" value="true" checked="checked">是</input>
                <input type="radio" name="isVisibleForUser" value="false">否</input>
            </div>
            <div class="fixed">
                <span>可否固定在主页：</span><input type="radio" name="isFixedInHomePage" value="true">是</input>
                <input type="radio" name="isFixedInHomePage" value="false" checked="checked">否</input>
            </div>
            <div class="button"><center><input id="submit" type="image" src="/css/new/submit_column.png"/></center></div>
        </div>
    </form>
    <% } else {%>
    <form action="/column/updateColumn.do?id=<%=columnEPM.getId()%>" method="post">
        <div id="column_edit_div">
            <div class="name"><span>栏目名：</span><input type="text" name="name" value="<%=columnEPM.getColumnEntity().getName()%>"/></div>
            <div class="description"><span>栏目描述：</span><input type="text" name="description" value="<%=columnEPM.getColumnEntity().getDescription()%>"/></div>
            <div class="visible">
                <span>可否可见：</span><input type="radio" name="isVisibleForUser" value="true" <% if (columnEPM.getColumnEntity().isIsVisibleForUser()) {%>checked="checked" <% }%>>是</input>
                <input type="radio" name="isVisibleForUser" value="false" <% if (columnEPM.getColumnEntity().isIsVisibleForUser() == false) {%>checked="checked" <% }%>>否</input>
            </div>
            <div class="fixed">
                <span>可否固定在主页：</span><input type="radio" name="isFixedInHomePage" value="true" <% if (columnEPM.getColumnEntity().isIsFixedInHomePage()) {%>checked="checked" <% }%>>是</input>
                <input type="radio" name="isFixedInHomePage" value="false" <% if (columnEPM.getColumnEntity().isIsFixedInHomePage() == false) {%>checked="checked" <% }%>>否</input>
            </div>
            <div class="button"><center><input id="submit" type="image" src="/css/new/update_column.png"/></center></div>
        </div>
    </form>
    <% }%>
    <%@include file="/templates/general_footer.jsp" %>
</html>
