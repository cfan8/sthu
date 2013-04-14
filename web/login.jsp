<%-- 
    Document   : login
    Created on : 2013-2-2, 14:09:34
    Author     : linangran
--%>

<%@page import="cn.edu.tsinghua.sthu.action.ShowLoginPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowLoginPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowLoginPageMessage message = Util.getMessage(ShowLoginPageAction.class);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
	<script type="text/javascript" src="/js/jquery.js" ></script>
	<script type="text/javascript" src="/js/BigInt.js" ></script>
	<script type="text/javascript" src="/js/Barrett.js" ></script>
	<script type="text/javascript" src="/js/RSA.js" ></script>
	<style>
	    html, body {
		margin: 0;
		width: 100%;
		height: 100%;
		min-height: 550px;
	    }

	    body{
		background-color: #c1c0c0;
	    }

	    #container
	    {
		margin: 0 auto;
		width: 1052px;
		height: 100%;
	    }

	    #main
	    {
		margin: 0;
		background-image: url('css/login/login.png');
		min-height: 500px;
		width: 100%;
		position: relative;
		float: left;
	    }

	    form,input
	    {
		position: absolute;
	    }

	    #username, #password
	    {
		border-color: #afafaf;
		border-width: 1px;
		border-style: solid;
		height: 24px;
		width: 154px;
		padding-left: 5px;
	    }

	    #username
	    {
		left: 393px;
		top:297px;
	    }

	    #password
	    {
		left: 393px;
		top:347px;
	    }

	    #submitbtn
	    {
		left:438px;
		top: 395px;
		cursor: pointer;
		position: absolute;
	    }

	    #footer
	    {
		background-image: url('/css/login/footer.png');
		background-color: white;
		background-position:bottom center ;
		min-height: 60px;
		height: 100%;
		width:1024px;
		margin: 0 auto;
		background-repeat:no-repeat;
	    }

	</style>
    </head>
    <body>
	<div id="container">
	    <div id="main" >
		<form action="checkUser.do?redirectURL=<%=message.getRedirectURL()%>" method="post" id="loginForm">
		    <input type="text" name="username" id="username" />
		    <input type="password" name="password" id="password" />
		    <img src="/css/login/button.png" id="submitbtn" />
		</form>
	    </div>
	    <div id="footer" >.</div>
	</div>
	<script type="text/javascript">
	    $("#submitbtn").click(function(){
		$("#submitbtn").unbind('click');
		setMaxDigits(150);
		key = new RSAKeyPair("<%=message.getPublicKey() %>","","<%=message.getModulus() %>");
		$("#password").val(encryptedString(key, $("#password").val()));
		$("#loginForm").submit();
	    });
	</script>
    </body>
</html>
