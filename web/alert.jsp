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
    if (message.getRedirectURL().equals(message.REFERER_URL)) {
	String referer = request.getHeader("REFERER");
	if (referer != null && referer.equals("") == false) {
	    message.setRedirectURL(referer);
	} else {
	    message.setRedirectURL("/index.do");
	}
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=message.getAlertTitle()%></title>
    </head>
    <% if (message.getAlertType() == AlertMessage.ALERT_TYPE) {%>
    <script type="text/javascript">
        <%if(message.getNoAlert()!=1){%>
	alert("<%=message.getAlertContent()%>");
        <%}%>
	window.location.href = "<%=message.getRedirectURL()%>";
    </script>
    <% } else if (message.getAlertType() == AlertMessage.BOX_TYPE) {%>
    <%@include file="/templates/general_header.jsp" %>

    <style>
	#main
	{
	    width: 920px;
	    padding-top: 20px;
	}

	#boxDiv
	{
	    width: 700px;
	    margin: 0 auto;
	    position: relative;
	    background-color: #cccccc;
	    background-position: center;
	    background-repeat: no-repeat;
	}

	#contentDiv
	{
	    width: 660px;
	    border: none;
	    text-align: center;
	    padding: 20px;
	    z-index: 99;
	}

	.button
	{
	    display: inline-block;
	    width: 180px;
	    height: 26px;
	    background-color: #ff7900;
	    text-align: center;
	}

	.button:link, .button:visited
	{
	    text-decoration: none;
	    color: white;
	    padding-top: 10.5px;
	    font-size: 14.67px;
	    letter-spacing: 4px;
	}

	#title
	{
	    font-size: 24px;
	    font-family: 微软雅黑;
	}

	#content
	{
	    font-size: 16px;
	}

	#bgDiv
	{
	    background-color: white;
	    opacity: 0.5;
	    width: 100%;
	    height: 100%;
	    left: 0px;
	    top: 0px;
	    position: absolute;
	    z-index: 2;
	}
    </style>
    <div id="boxDiv">
	<div id="contentDiv">
	    <div id="title">
		<%=message.getAlertTitle()%>
	    </div>
	    <div id="content">
		<p><%=message.getAlertContent()%></p>
		<a class="button" href="<%=message.getRedirectURL()%>">继续</a>
	    </div>
	</div>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <% }%>
</html>