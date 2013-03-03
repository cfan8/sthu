<%-- 
    Document   : columnpage
    Created on : 2013-2-19, 3:15:43
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.message.ColumnPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
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
    <link rel="stylesheet" type="text/css" href="/css/new/columnManage.css" />
    <div id="column_manage_list">
    <ul>
        <li id="field_li">
            <div>
                <div class="name"><span class="field">栏目名称</span></div>
                <div class="visible"><span class="field">可见？</span></div>
                <div class="fixed"><span class="field">首页栏目？</span></div>
                <div class="clear"></div>
            </div>
            <hr class="hr_top"/>
        </li>
    <% for (int i = 0; i < message.getColumns().size(); i++)
       { %>
        <li>
            <div>
                <div class="name"><a href="/column/editColumnPage.do?id=<%=message.getColumns().get(i).getID()%>" title="<%=message.getColumns().get(i).getName() %>"><%=message.getColumns().get(i).getName() %></a></div>
                <div class="visible"><%=message.getColumns().get(i).isIsVisibleForUser() %></div>
                <div class="fixed"><%=message.getColumns().get(i).isIsFixedInHomePage() %></div>
                <div class="delete"><a href="/column/deleteColumn.do?id=<%=message.getColumns().get(i).getID()%>" title="点击删除该栏目">删除</a></div>
                <div class="clear"></div>
           </div>
           <hr/>
        </li>
    <% } %>
    </ul>
    </div>
</html>
