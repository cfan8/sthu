<%-- 
    Document   : info_new_box1
    Created on : 2013-3-12, 10:47:42
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.message.info.ForInfoNewBoxMessage"%>
<%@page import="cn.edu.tsinghua.sthu.message.info.ForInfoNewBoxMessage"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <%!
        public ForInfoNewBoxMessage forInfoNewBoxMessage;
    %>
    <%
        forInfoNewBoxMessage = (ForInfoNewBoxMessage) request.getAttribute("forInfoNewBoxMessage");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/css/info/common_door.css" />
        <link rel="stylesheet" type="text/css" href="/css/info/menu_door.css" />
        <link rel="stylesheet" type="text/css" href="/css/info/page_door.css" />
        <link rel="stylesheet" type="text/css" href="/css/info/style_door.css" />
    </head>
    <body>
        <div class="contbox">
            <ul>
                <p class="t_right">
                    <a class="blue02" target="_blank" href="/column/column.do?id=<%=forInfoNewBoxMessage.getColumnEntity().getID()%>">更多</a>
                </p>
                <% int max = forInfoNewBoxMessage.getNews().size() > 6 ? 6 : forInfoNewBoxMessage.getNews().size();
                    for (int i = 0; i < max; i++)
                { %>
                <li>
                    <a target="_blank" href="/new/new.do?id=<%=forInfoNewBoxMessage.getNews().get(i).getID()%>" title="<%=forInfoNewBoxMessage.getNews().get(i).getTitle() %>">
                        <% if (forInfoNewBoxMessage.getNews().get(i).getTitle().length() > 35) {%>  <%=forInfoNewBoxMessage.getNews().get(i).getTitle().substring(0, 35).concat("..")%>
				<% } else {%> <%=forInfoNewBoxMessage.getNews().get(i).getTitle()%> <% }%> 
                    </a>
                    <span><%=Util.dateToStringAccurateToDayFormat1(forInfoNewBoxMessage.getNews().get(i).getUpdateTime())%> </span>
                </li>
                <% } %>
            </ul>
        </div>
    </body>
</html>
