<%-- 
    Document   : group_user_validation
    Created on : 2013-8-4, 13:58:00
    Author     : xiaoyou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>申请人验证</title>
        <link rel='stylesheet' type='text/css' href='/css/classroom/status.css' />
        <link rel='stylesheet' type='text/css' href='/css/classroom/apply.css' />
        <style type="text/css">
            #username, #password
	    {
		border-width: 1px;
		border-style: solid;
		width: 190px;
		padding-left: 5px;
	    }
        </style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <span id="position">您当前的位置：申请人验证</span>
    
    <div style="text-align:center;margin-top:20px;margin-bottom: 20px;">
    以学生组织身份申请学生活动，需要验证申请人权限，请输入学号和信息门户密码以验证身份。
    </div>
    <div id="formdiv">
        <div id="main" >
            <form action="groupUserValidation.do" method="post" id="validationForm">
                <div><span class="tag">申请人学号：</span><span class="value"><input type="text" name="username" id="username" /></span></div>
                <div><span class="tag">申请人密码：</span><span class="value"><input type="password" name="password" id="password" /></span></div>
                <div id="submitbutton"><a href="#" id="submitbtn">确认</a></div>
            </form>
        </div>
        <div id="footer" >.</div>
    </div>
    <script type="text/javascript">
        $("#submitbtn").click(function(){
            $("#validationForm").submit();
        });
    </script>
</html>
