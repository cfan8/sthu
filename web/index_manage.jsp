<%-- 
    Document   : index_manage
    Created on : 2013-3-1, 22:40:04
    Author     : linangran
--%>

<%@page import="cn.edu.tsinghua.sthu.entity.IndexSettingEntity"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.action.ShowIndexManageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowIndexManageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ShowIndexManageMessage message = Util.getMessage(ShowIndexManageAction.class);
    List<IndexSettingEntity> list = message.getList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>首页管理</title>
	<link rel="stylesheet" type="text/css" href="/uploadify/uploadify.css">
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <table>
	<tr><td>序号</td><td>图片地址</td><td style="width: 210px;">上传</td><td>标题</td><td>新闻页面</td><td>启用</td></tr>
	<% for (int i = 0; i < list.size(); i++) {
		IndexSettingEntity entity = list.get(i);
	%>

    <tr><td><%=i + 1%></td><td><input type="text" id="image<%=i%>" value="<%=entity.getImage()%>" /></td><td><input type="button" id="upbtn<%=i%>" value="上传文件" /></td><td><input type="text" id="title<%=i%>" value="<%=entity.getTitle()%>"></td><td><input type="text" id="link<%=i%>" value="<%=entity.getLink()%>"></td><td><input type="checkbox" id="enable<%=i%>" <%=entity.isEnabled() ? "checked=\"checked\"" : ""%>></td></tr>
	<% }%>
</table>
<form action="saveIndexSetting.do" method="post">
    <input type="hidden" name="image" id="image">
    <input type="hidden" name="title" id="title">
    <input type="hidden" name="link" id="link">
    <input type="hidden" name="enable" id="enable">
    <input type="submit" value="确定" id="submit"/>
</form>
<%@include file="/templates/general_footer.jsp" %>
<script type="text/javascript" src="/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript">
    for(var i = 0 ; i < 5; i++)
    {
	$("#upbtn" + i).uploadify({
	    'multi'    : false,
	    'height':'25px',
	    'width':'210px',
	    'buttonText' : '上传图片',
	    'fileSizeLimit' : '2000KB',
	    'fileTypeDesc' : '图片文件',
	    'fileTypeExts' : '*.gif; *.jpg; *.png',
	    'swf'      : '/uploadify/uploadify.swf',
	    'uploader' : '/ueditor/jsp/indexUp.jsp?id=' + i,
	    'onUploadSuccess' : function(file, data, response) {
		json=eval('('+data+')');
		$("#image" + json.id).val(json.url);
	    }
	});
    }
	
    $("#submit").click(function(){
	var image = "";
	var title = "";
	var link = "";
	var enable ="";
	for (var i = 0; i < 5; i++)
	{
	    image += $("#image" + i).val() + "||";
	    title += $("#title" + i).val() + "||";
	    link += $("#link" + i).val() + "||";
	    enable += $("#enable" + i).is(':checked') + "||";
	}
	$("#image").val(image.substring(0, image.length-2));
	$("#title").val(title.substring(0, title.length-2));
	$("#link").val(link.substring(0, link.length-2));
	$("#enable").val(enable.substring(0, enable.length-2));
	return true;
    });
</script>
</html>
