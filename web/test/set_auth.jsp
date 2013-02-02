<%-- 
    Document   : set_auth
    Created on : 2013-2-2, 12:44:50
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>这里输入页面标题</title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <form action="setAuth.do" method ="post">
	    用户类型：1普通2管理员<input type="text" name="roletype" /><br/>
	    文章管理权限：1有<input type="text" name="opArticle" /><br/>
	    一级审批类型权限：<input type="text" name="opIdentityCode" /><br/>
	    二级审批类型权限：<input type="text" name="opResourceCode" /><br/>
	    三级审批类型权限：<input type="text" name="opAllocateCode" /><br/>
	    <input type="submit" />
    </form>
    <%@include file="/templates/general_footer.jsp" %>
</html>
