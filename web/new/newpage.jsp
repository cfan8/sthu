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
    <link rel="stylesheet" type="text/css" href="/css/new/managePage.css" />
    <%!
    private List<NewEntity> news;
   %>
    <%
    news = (List<NewEntity>) request.getAttribute("news");
    %>
    <body>
    <div id="new_manage_list">
        </br>
        <form action="/new/batchDeleteNews.do" method="post">
            <div id="batch_delete_div"><input type="submit" value="批量删除"></div>
        <ul>
        <% for (int i = 0; i < news.size(); i++)
            { 
            %>
            <li>
                <div>
                    <div class="batchdelete"><input type="checkbox" name="newids[]" value="<%=news.get(i).getID()%>"/></div>
                    <div class="title"><a class="column" href="/column/editColumnPage.do?id=<%=news.get(i).getColumnBelong().getID()%>" title="<%=news.get(i).getColumnBelong().getName() %>">【<%=news.get(i).getColumnBelong().getName() %>】</a><a href="/new/editNewPage.do?id=<%=news.get(i).getID()%>" title="浏览数：<%=news.get(i).getBrowseNumber()%>；摘要：<%=news.get(i).getNewAbstract() %>"><%=news.get(i).getTitle()%></a>
                        <% if (news.get(i).isIsPlacedInColumnTop()) { %>
                        <span class="onTop">【置顶】</span>
                        <% } %>
                    </div>
                    <div class="author"><%=news.get(i).getAuthor() %></div>
                    <div class="date"><%=Util.dateToStringAccurateToDayFormat1(news.get(i).getUpdateTime()) %></div>
                    <div class="delete"><a href="/new/deleteNew.do?id=<%=news.get(i).getID()%>">删除</a></div>
                    <div class="clear"></div>
                </div>
                <hr/>
            </li>
        <% } %>
        </ul>
        </form>
    </div>
</body>
</html>
