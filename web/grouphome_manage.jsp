<%-- 
    Document   : grouphome_manage
    Created on : 2013-8-28, 15:19:51
    Author     : xiaoyou
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.GroupImgEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.ShowGroupHomeManageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowGroupHomeManageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowGroupHomeManageMessage message = Util.getMessage(ShowGroupHomeManageAction.class);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>社团管理页</title>
        <script type="text/javascript" src="/js/jquery.js"></script>
        <link rel="stylesheet" type="text/css" href="/uploadify/uploadify.css"/>
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
            .tag
            {
                width:150px !important;
                text-align: right;
                display: inline;
            }
            .value
            {
                width:150px;
                display: inline;
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
                <div class="manage_item" style="width:300px;">
                    <span class="tag">修改密码：</span><span class="value">
                        <input type="radio" name="passwordFlag" value="true" onclick="changePasswordState(1)"/>是
                        <input type="radio" name="passwordFlag" value="false" checked="true" onclick="changePasswordState(2)"/>否
                    </span>
                    <div id="PasswordInfo" style="display:none">
                        <div><div class="tag">&nbsp;&nbsp;原密码：</div><div class="value"><input type="password" id="originPassword" name="originPassword"/></div></div>
                        <div><div class="tag">&nbsp;&nbsp;新密码：</div><div class="value"><input type="password" id="newPassword" name="newPassword"/></div></div>
                        <div><div class="tag">重复密码：</div><div class="value"><input type="password" id="rePassword"/></div></div>
                    </div>
                </div>
                <div class="manage_item" style="width:300px;">
                    上传logo：<div class="upbtn"><input type="button" id="upbtn_logo" class="upbtn"/></div>
                    <%if(message.getLogoImg() != null  && message.getLogoImg().compareTo("null") != 0){%>
                    <img src="<%=message.getLogoImg()%>" id="logo_img" />
                    <%}else{%>
                    <img src="/images/logo.jpg" id="logo_img" />
                    <%}%>
                    <input type="hidden" name="logoImg" id="logoImg" value="<%=message.getLogoImg()%>"/>
                </div>
                <br/>
                <div class="manage_item">
                    上传组图：
                    <table>
                        <tr><td>序号</td><td>图片地址</td><td style="width: 210px;">上传</td><td>标题</td><td>启用</td></tr>
                        <%
                        List<GroupImgEntity> list = message.getImages();
                        for (int i = 0; i < list.size(); i++) {
                                GroupImgEntity entity = list.get(i);
                        %>

                    <tr><td><%=i + 1%></td><td><input type="text" id="image<%=i%>" value="<%=entity.getImg()%>" /></td><td><input type="button" id="upbtn<%=i%>" value="上传文件" /></td><td><input type="text" id="title<%=i%>" value="<%=entity.getTitle()%>"></td><td><input type="checkbox" id="enable<%=i%>" <%=entity.isEnabled() ? "checked=\"checked\"" : ""%>></td></tr>
                        <% }%>
                    </table>
                </div>
                    <input type="hidden" name="image" id="image">
                    <input type="hidden" name="title" id="title">
                    <input type="hidden" name="enable" id="enable">
                    <br/>
                <div class="manage_item" style="width:480px;">文字介绍：<br/><textarea name="introduction"><%=message.getIntroduction()%></textarea></div>
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
                $("#main_img").attr("src","/"+json.url);
                $("#mainImg").val("/"+json.url);
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
		$("#logo_img").attr("src","/"+json.url);
                $("#logoImg").val("/"+json.url);
	    }
        });

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
                    $("#image" + json.id).val("/"+json.url);
                }
            });
        }
        
        function changePasswordState(state){
            if(state == 1){
                $("#PasswordInfo").show();
            }else{
                $("#PasswordInfo").hide();
            }
        }

        $("#save").click(function() {
            var pwd_alert1 = false;
            var pwd_alert2 = false;
            if($("input[name='passwordFlag']")[0].checked){
                $("#PasswordInfo input").each(function(){
                    if($(this).val() == "")
                    {
                        pwd_alert1 = true;
                        return false;
                    }
                    if($("#newPassword").val() != $("#rePassword").val()){
                        pwd_alert2 = true;                    
                        return false;
                    }
                });
            }
            var image = "";
            var title = "";
            var enable ="";
            for (var i = 0; i < 5; i++)
            {
                image += $("#image" + i).val() + "||";
                title += $("#title" + i).val() + "||";
                enable += $("#enable" + i).is(':checked') + "||";
            }
            $("#image").val(image.substring(0, image.length-2));
            $("#title").val(title.substring(0, title.length-2));
            $("#enable").val(enable.substring(0, enable.length-2));
            if (pwd_alert1)
	    {
		alert("请填写完整密码信息！");
	    }
            else if(pwd_alert2)
            {
                alert("两次输入的新密码不相同，请重新输入！");
            }
	    else
	    {
                $("#submitf").submit();
            }   
        });
    </script>
    <%@include file="/templates/new_general_footer.jsp" %>
</html>
