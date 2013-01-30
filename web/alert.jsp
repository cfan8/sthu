<%--
    Document   : error
    Created on : 2013-1-27, 18:50:54
    Author     : linangran
--%>

<%@page import="cn.edu.tsinghua.sthu.action.BaseAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AlertMessage message = Util.getAlertMessage();
    if (message.getRedirectURL().equals(message.REFERER_URL))
    {
	String referer = request.getHeader("REFERER");
	if (referer != null && referer.equals("") == false)
	{
	    message.setRedirectURL(referer);
	}
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=message.getAlertTitle()%></title>
    </head>
	<% if (message.getAlertType() == AlertMessage.ALERT_TYPE)
	    {%>
	<script type="text/javascript">
	    alert("<%=message.getAlertContent()%>");
	    window.location.href = "<%=message.getRedirectURL()%>"
	</script>
    <% }
	else if (message.getAlertType() == AlertMessage.BOX_TYPE)
	{%>
	</head>
    <%@include file="/templates/general_header.jsp" %>
    <div id="title">
	<%=message.getAlertTitle()%>
    </div>
    <div id="content">
	<%=message.getAlertContent()%>
	<a href="<%=message.getRedirectURL()%>">继续</a>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <% }%>
</html>