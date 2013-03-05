<%-- 
    Document   : oneNew
    Created on : 2013-2-22, 14:04:18
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowOneNewMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <%!
        public ShowOneNewMessage showOneNewMessage;
    %>
    <%
        showOneNewMessage = (ShowOneNewMessage) request.getAttribute("showOneNewMessage");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=showOneNewMessage.getNewEnity().getTitle()%></title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <link rel="stylesheet" type="text/css" href="/css/new/new.css" />
    <div id="div_left">
            <div id="position">您当前的位置：<a href="/column/column.do?id=<%=showOneNewMessage.getNewEnity().getColumnBelong().getID()%>"><%=showOneNewMessage.getNewEnity().getColumnBelong().getName() %></a>>><%=showOneNewMessage.getNewEnity().getTitle() %></div>
            <div id="blank_div"></div>
            <div id="new_div">
                <div id="title_div"><%=showOneNewMessage.getNewEnity().getTitle()%></div>
                <div id="new_info_div">作者：<%=showOneNewMessage.getNewEnity().getAuthor()%>    发表时间：<%=Util.dateToStringAccurateToDay(showOneNewMessage.getNewEnity().getUpdateTime())%>    阅读数：<%=showOneNewMessage.getNewEnity().getBrowseNumber() %></div>
                <hr/>
                <div id="new_content_div"><%=showOneNewMessage.getNewEnity().getContent()%></div>
            </div>
    </div>
    <div id="div_right">
            <div id="recomment">
                <div id="tab"></div>
                <div id="text"><center><span>推荐</span></center></div>
                <div id="recomment_body">
                    <ul class="recomment">
                        <% for (int i = 0; i < showOneNewMessage.getOtherNewsInSameColumn().size(); i++ )
                            { %>
                            <li class="recomment">
                                <a href="/new/new.do?id=<%=showOneNewMessage.getOtherNewsInSameColumn().get(i).getID()%>" title="<%=showOneNewMessage.getOtherNewsInSameColumn().get(i).getTitle() %>"><%=showOneNewMessage.getOtherNewsInSameColumn().get(i).getTitle() %></a>
                            </li>
                       <% } %>
                    </ul>
                </div>
            </div>
            <%@include file="/templates/subject.jsp" %>
    </div>
    <div class="clear"></div>
    <%@include file="/templates/general_footer.jsp" %>
</html>
