<%-- 
    Document   : email_setting
    Created on : 2013-4-22, 15:46:58
    Author     : elsie
--%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.entity.EmailEntity"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowEmailMessage"%>
<%@page import="cn.edu.tsinghua.sthu.action.ShowEmailAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ShowEmailMessage message = Util.getMessage(ShowEmailAction.class);
    EmailEntity entity = message.getEmailEntity();
    String email;
    boolean isReceiveRemindEmail;
    if(entity == null){
        email = "";
        isReceiveRemindEmail = false;
    }
    else{
        email = entity.getEmail();
        isReceiveRemindEmail = entity.isIsReceiveRemindEmail();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>邮箱管理</title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <form action="setEmail.do" method="post">
	邮箱：<input type="text" name="email" value="<%=email%>"/>
        <% if (isReceiveRemindEmail) {%>
            <input type="checkbox" name="isReceiveRemindEmail" value="true" checked="checked"/>
	<% }else{%>
            <input type="checkbox" name="isReceiveRemindEmail" value="true"/>
        <%}%>
        接收邮箱提醒
	<input type="submit" value="确定" />
    </form>
    <%@include file="/templates/general_footer.jsp" %>
</html>
