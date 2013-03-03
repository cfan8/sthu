<%-- 
    Document   : ticketNotice
    Created on : 2013-3-3, 17:07:37
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>订票注意事项</title>
	<style>
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
	    
	    #main
	    {
		width: 700px;
	    }
	    
	    #container
	    {
		padding-top: 10px;
	    }
	    
	    #title
	    {
		font-family: 黑体;
		font-size: 26px;
	    }
	    
	    #main li{
		margin-top: 12px;
		line-height: 24px;
	    }
	    
	</style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <div id="title">订票注意事项</div>
    <ol>
    <li>订票系统只在有订票活动时开放。</li>
    <li>请只订自己需要的票，以免名额浪费。</li>
    </ol>
    <p id="buttonP"><a class="button" href="#">暂无订票</a></p>
    <%@include file="/templates/general_footer.jsp" %>
</html>
