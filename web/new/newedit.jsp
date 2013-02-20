<%-- 
    Document   : newedit
    Created on : 2013-2-7, 21:47:45
    Author     : wuhz
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%!
        public List<String> columnNames;
        public int newId;
    %>
    <%
        newId = (Integer)request.getAttribute("id");
        columnNames = (List<String>) request.getAttribute("columnNames");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>新闻编辑</title>
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_user.js"></script>
	<script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
    </head>


    <%@include file="/templates/general_header.jsp" %>
    <br/>
    <br/>
    <form action="/new/addNew.do" method="post">
	标题：<input type="text" name="title"/><br/>
        作者：<input type="text" name="author" />
        <br/>
        <select name="columnBelong">
            <% for (int i = 0; i < columnNames.size(); i++)
                { %>
            <option><%=columnNames.get(i) %></option>
            <% } %>
        </select>
        <br/>
	<script id="editor" type="text/plain" name="content">在这里编辑文章的内容</script>
        <br/>
        置顶？ ：
        <input type="radio" name="isPlacedInColumnTop" value="false" checked="checked"/> 否 &nbsp;&nbsp;
        <input type="radio" name="isPlacedInColumnTop" value="true" /> 是
        <br/>
        重定向URL：<input type="text" name="redirectURL"/>
        <br/>
        <% if (newId == -1) 
            { %>
            <input type="submit" value="添加"/>
            <% } %>
    </form>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
     var ue = UE.getEditor('editor');
    </script>
</html>