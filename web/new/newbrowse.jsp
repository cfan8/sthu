<%-- 
    Document   : newbrowse
    Created on : 2013-2-8, 23:30:28
    Author     : wuhz
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="cn.edu.tsinghua.sthu.entity.NewEntity" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>新闻浏览</title>
    </head>
    <%!
        public List<NewEntity> news;
    %>
    <%
        news = (List<NewEntity>) request.getAttribute("news");
    %>
    <%@include file="/templates/general_header.jsp" %>
    <% for (int i = 0; i < news.size(); i++)
               { %>
               作者：<%=news.get(i).getAuthor()%><br/>
               标题：<%=news.get(i).getTitle()%><br/>
               内容：<%=news.get(i).getContent()%><br/>
               更新日期：<%=news.get(i).getUpdateTime().toString()%><br/>
               <% } %>
    <%@include file="/templates/general_footer.jsp" %>
</html>
