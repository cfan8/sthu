<%-- 
    Document   : grouphome_manage
    Created on : 2013-8-28, 15:19:51
    Author     : xiaoyou
--%>

<%@page import="cn.edu.tsinghua.sthu.action.ShowGroupHomeManageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowGroupHomeManageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowGroupHomeManageMessage message = Util.getMessage(ShowGroupHomeManageAction.class);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>社团管理页</title>
        <script type="text/javascript" src="/js/jquery.js"></script>
        <link rel="stylesheet" type="text/css" href="/uploadify/uploadify.css">
        <link href="/css/activity/organizationPage.css" type="text/css" rel="stylesheet" />
        <style type="text/css">
            textarea{
                vertical-align: top;
                resize: none;
                width:400px;
                height:200px;
                font-size: 15px;
                padding:4px;
            }
            .manage-style{
                width: 800px;
                margin: 30px auto;
            }
            #confirmDiv
            {
                width: 780px;
                margin: 20px auto 0px auto;
                text-align: center;
            }

            #confirmDiv a
            {
                display: inline-block;
                width: 180px;
                height: 26px;
                background-color:#4A708B;
                text-align: center;
                text-decoration: none;
                color: white;
                padding-top: 10.5px;
                font-size: 14.67px;
                letter-spacing: 4px;
                cursor: pointer;
            }
            .manage_item
            {
                margin-top:20px;
                
            }
            .upbtn
            {
                margin-top:5px;
                width: 210px;
            }
            #main_img
            {
                height:515px;
                width:700px;
            }
            #logo_img
            {
                width:170px;
                height:166px;
            }
        </style>
    </head>
    <%@include file="/templates/new_general_header.jsp" %> 
    <div id="main_part" class="main-style">
        <div id="main_content_part" class="main-content-style">
            社团页面管理：
            <form action="saveGroupHomeManage.do" method="post" id="submitf">
                <input type="hidden" name="groupId" value="<%=message.getGroupId()%>"/>    
            <div class="manage-style">
                <div class="manage_item">
                    上传大图：<div class="upbtn"><input type="button" id="upbtn_main"/></div>
                    <%if(message.getMainImg() != null){%>
                    <img src="<%=message.getMainImg()%>" id="main_img"/>
                    <%}else{%>
                    
                    <img src="/images/banner.jpg" id="main_img"/>
                    <%}%>
                    <input type="hidden" name="mainImg" id="mainImg" value="<%=message.getMainImg()%>"/>
                </div>
                <div class="manage_item" style="width:300px;float: left">
                    上传logo：<div class="upbtn"><input type="button" id="upbtn_logo" class="upbtn"/></div>
                    <%if(message.getLogoImg() != null){%>
                    <img src="<%=message.getLogoImg()%>" id="logo_img" />
                    <%}else{%>
                    <img src="/images/logo.jpg" id="logo_img" />
                    <%}%>
                    <input type="hidden" name="logoImg" id="logoImg" value="<%=message.getLogoImg()%>"/>
                </div>
                <div class="manage_item" style="width:480px;float:right">文字介绍：<br/><textarea name="introduction"><%=message.getIntroduction()%></textarea></div>
            </div>
            <div id="confirmDiv" style="clear:both; padding-top: 20px">
                <a id="save">保存修改</a>
                <a href="/showGroupHome.do?groupId=<%=message.getGroupId()%>" id="cancel">取消/返回主页</a>
            </div>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="/uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript">
        $("#upbtn_main").uploadify({
            'multi'    : false,
            'height':'35px',
            'width':'210px',
            'buttonText' : '上传图片',
            'fileSizeLimit' : '4000KB',
            'fileTypeDesc' : '图片文件',
            'fileTypeExts' : '*.gif; *.jpg; *.png',
            'swf'      : '/uploadify/uploadify.swf',
            'uploader' : '/ueditor/jsp/imageUp.jsp',
            'onUploadSuccess' : function(file, data, response) {
		json=eval('('+data+')');
		$("#main_img").attr("src",json.url);
                $("#mainImg").val(json.url);
	    }
        });
        
        $("#upbtn_logo").uploadify({
            'multi'    : false,
            'height':'35px',
            'width':'210px',
            'buttonText' : '上传图片',
            'fileSizeLimit' : '4000KB',
            'fileTypeDesc' : '图片文件',
            'fileTypeExts' : '*.gif; *.jpg; *.png',
            'swf'      : '/uploadify/uploadify.swf',
            'uploader' : '/ueditor/jsp/imageUp.jsp',
            'onUploadSuccess' : function(file, data, response) {
		json=eval('('+data+')');
		$("#logo_img").attr("src",json.url);
                $("#logoImg").val(json.url);
	    }
        });

        $("#save").click(function() {
            $("#submitf").submit();
        });
    </script>
    <%@include file="/templates/new_general_footer.jsp" %>
</html>
