<%-- 
    Document   : ueditortest
    Created on : 2013-2-4, 17:40:06
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>测试UEditor</title>
	<script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_user.js"></script>
	<script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <div>
	<form action="testUEditor.do" method="post">
	    <script  id="editor" type="text/plain" name="content">这里可以书写，编辑器的初始内容</script>
	    <input type="submit" />
	</form>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
     var ue = UE.getEditor('editor');
    </script>
</html>
