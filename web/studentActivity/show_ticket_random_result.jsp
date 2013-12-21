<%-- 
    Document   : show_ticket_random_result
    Created on : 2013-9-15, 0:36:06
    Author     : xiaoyou
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowTicketRandomResultMessage"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowTicketRandomResultAction"%>
<%@page import="cn.edu.tsinghua.sthu.entity.UserEntity"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%
    ShowTicketRandomResultMessage message = Util.getMessage(ShowTicketRandomResultAction.class);
    List<UserEntity> resultList = message.getResultList();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>抽票结果</title>
        <link href="/css/activity/indexPage_sheet.css" type="text/css" rel="stylesheet"/>
    </head>
    <%@include file="/templates/new_general_header.jsp" %>
    <div id="main_content" class="main-style">
        <div id="content_div" class="content-div-style" style="background-color: white; padding:20px;">
            抽票结果：
            <ul>
                <%for(int i = 0; i < resultList.size(); i ++){%>
                <li style="float:left; margin-left:20px"><%=resultList.get(i).getUsername()%></li>
                <%}%>
            </ul>
            <div style="font: 0px/0px sans-serif;clear: both;display: block"> </div>
        </div>
    </div>
    <%@include file="/templates/new_general_footer.jsp" %>
</html>
