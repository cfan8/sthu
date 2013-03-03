<%-- 
    Document   : show_activity_apply
    Created on : 2013-2-22, 11:03:07
    Author     : luzhen
--%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="cn.edu.tsinghua.sthu.message.outdoor.ShowActivityApplyMessage"%>
<%@page import="cn.edu.tsinghua.sthu.entity.ActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.outdoor.ShowActivityApplyAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<% ShowActivityApplyMessage message = Util.getMessage(ShowActivityApplyAction.class);
    ActivityApplyEntity entity = message.getApplyEntity();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>显示活动申请</title>
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_tiny.js"></script>
	<script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
	<link rel='stylesheet' type='text/css' href='/css/classroom/status.css' />
	<style>
	    #tablediv{
		width: 600px;
		margin: 10px auto 10px auto;
	    }

	    .tag
	    {
		width: 150px;
	    }

	    .blockvalue{
		width: 600px;
	    }

	    tr
	    {
		border-top-width: 1px;
		border-top-style: solid;
	    }

	    p{
		margin: 16px 0px; 
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
		background-color: #ff7900;
		text-align: center;
	    }

	    #confirmDiv a:link, #confirmDiv a:visited
	    {
		text-decoration: none;
		color: white;
		padding-top: 10.5px;
		font-size: 14.67px;
		letter-spacing: 4px;
	    }



	    #commentBlock
	    {
		width: 780px;
		margin: 0 auto;
	    }

	    #commentBlock p{
		margin: 0px;
	    }

	    #showControl
	    {
		width: 780px;
		height: 22px;
		font-size: 13.34px;
		font-family: 微软雅黑;
	    }

	    #showControl div
	    {
		float: left;
		height: 22px;
		text-align: center;
	    }

	    #showControl #currentcomment
	    {
		color: #404040;
		cursor: pointer;
		width: 100px;
		border-style: solid;
		border-color: #d0cfd0 #d0cfd0 white #d0cfd0;
		border-width: 1px;
	    }

	    #showControl #oldcomment
	    {
		color: #8f8f8f;
		cursor:  pointer;
		width: 100px;
		border-style: solid;
		border-color: white white #d0cfd0 white;
		border-width: 1px 1px 1px 0px;
	    }

	    #showControl #borderDiv
	    {
		width: 677px;
		border-style: solid;
		border-color: white white #d0cfd0 white;
		border-width: 1px 1px 1px 0px;
	    }

	    .commentDiv
	    {
		width: 758px;
		margin: 0px auto;
		border-style: solid;
		border-width: 0px 1px 1px 1px;
		border-color: #d0cfd0;
		float: left;
		padding: 10px 10px 10px 10px;
	    }

	    #oldCommentDiv
	    {
		display: none;
	    }

	    .commenttitle
	    {
		float: left;
		width: 175px;
		padding-left: 5px;
		text-align: left;
	    }

	    .commentcontent
	    {
		width: 572px;
		padding-right: 6px;
		float: right;
	    }

	    .commentitem
	    {
		margin-bottom: 10px;
		font-size: 14.67px;
		color: #404040;
		padding-top: 2px;
	    }
	    .commentitem:last-child
	    {
		margin-bottom: 0px;
	    }

	    .comment2147483647
	    {
		background-color: #d3fac2;
	    }

	    .comment-1
	    {
		background-color: #efc9b8;
	    }

	    #approveDiv
	    {
		margin-left: 96px;
	    }

	    #approveSubmitDiv
	    {
		width: 780px;
		margin: 20px auto 0px auto;
		text-align: left;
	    }

	    #approveSubmitDiv a
	    {
		display: inline-block;
		width: 180px;
		height: 26px;
		background-color: #ff7900;
		text-align: center;
		margin-left: 200px;
	    }

	    #approveSubmitDiv a:link, #approveSubmitDiv a:visited
	    {
		text-decoration: none;
		color: white;
		padding-top: 10.5px;
		font-size: 14.67px;
		letter-spacing: 4px;
	    }
	    
	</style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <div id="position">您当前的位置：活动资源申请</div>
    <div class="processtype noprint" id="processtype<%=entity.getApplyStatus()%>"></div>
    <div class="onlyprint" style="text-align:center; font-family: 黑体; font-size: 30px;">室外活动审批表</div>
    <div class="onlyprint" style="text-align:center;" id="printurl"></div>
    <div id="tablediv">
	<table>
            <tr><td class="tag">申请类型：</td><td class="value"><%=entity.getApplyTypeText()%></td></tr>
	    <tr><td class="tag">活动名称：</td><td class="value"><%=entity.getActivityName()%></td></tr>
	    <tr><td class="blocktag" colspan="2">活动内容：</td></tr>
	    <tr><td class="blockvalue" colspan="2"><%=entity.getActivityContent()%></td></tr>
            <% if (entity.getApplyType() == 1) {%>
	    <tr><td class="tag">电子屏显示内容：</td><td class="value"><%=entity.getLEDContent()%></td></tr>
            <% } else {%>
            <tr><td class="tag">活动地点：</td><td class="value"><%=entity.getActivityLocation()%></td></tr>
	    <tr><td class="blocktag" colspan="2">活动材料：</td></tr>
	    <tr><td class="blockvalue" colspan="2"><%=entity.getActivityMaterial()%></td></tr>
            <% }%>
	    <tr><td class="tag">开始时间：</td><td class="value"><%=df.format(entity.getStartTime())%></td></tr>
	    <tr><td class="tag">结束时间：</td><td class="value"><%=df.format(entity.getEndTime())%></td></tr>
	    <tr><td class="tag">主办、协办单位：</td><td class="value"><%=entity.getOrganizerName()%></td></tr>
	    <tr><td class="tag">申请单位：</td><td class="value"><%=entity.getApplicatantType()%></td></tr>
	    <tr><td class="tag">申请人：</td><td class="value"><%=entity.getApplicatantName()%></td></tr>
	    <tr><td class="tag">联系电话：</td><td class="value"><%=entity.getApplicatantCell()%></td></tr>
	    <tr><td class="tag">电子邮箱：</td><td class="value"><%=entity.getApplicatantEmail()%></td></tr>
	    <tr><td class="tag applyStatus">当前申请状态：</td><td class="value">
		<p>申请状态：<%=entity.getApplyStatusText()%></p>
		<p>院系学生组（分团委）审批状态：<%=entity.getIdentityStatusText()%></p>
		<p>校团委审批状态：<%=entity.getResourceStatusText()%></p>
	    </td></tr>
	</table>
    </div>

    <div id="commentBlock">
	<div id="showControl">
	    <div id="currentcomment">当前的审批消息</div><div id="borderDiv" class="noprint"></div>
	</div>
	<div id="commentShow" >
	    <div class="commentDiv toprint" id="currentCommentDiv">
		<% if (entity.getResourceStatus() == ActivityApplyEntity.RESOURCE_STATUS_ACCEPTED || entity.getResourceStatus() == ActivityApplyEntity.RESOURCE_STATUS_REJECTED) {%>
		<div class="commentitem comment<%= entity.getResourceStatus()%>">
		    <div class="commenttitle">
			<%=entity.getResourceCommentNickname()%> @ <%=new SimpleDateFormat("yyyy-MM-dd").format(entity.getResourceDate())%> :
		    </div>
		    <div class="commentcontent">
			<%=entity.getResourceComment()%>
		    </div>
		    <div style="clear:both;"></div>
		</div>
		<% }%>
		<% if (entity.getIdentityStatus() == ActivityApplyEntity.IDENTITY_STATUS_ACCEPTED || entity.getResourceStatus() == ActivityApplyEntity.IDENTITY_STATUS_REJECTED) {%>
		<div class="commentitem comment<%= entity.getIdentityStatus()%>">
		    <div class="commenttitle">
			<%=entity.getIdentityCommentNickname()%> @ <%=new SimpleDateFormat("yyyy-MM-dd").format(entity.getIdentityDate())%> :
		    </div>
		    <div class="commentcontent">
			<%=entity.getIdentityComment()%>
		    </div>
		    <div style="clear:both;"></div>
		</div>
		<% }%>
	    </div>
	    <div style="clear:both;"></div>
	</div>
    </div>
    <% if (message.isShowConfirm()) {%>
    <div id="confirmDiv">
	<a href="applyActivity.do?applyId=<%=entity.getID()%>">修改申请</a>
	<a href="confirmOutdoorApply.do?applyId=<%=entity.getID()%>" id="confirmApply">确认申请</a>
	<script type="text/javascript">
	    $("#confirmApply").click(function(){
		return confirm("是否确认申请？一旦确认将无法修改！");
	    });
	</script>
    </div>
    <% }%>

    <% if (message.isShowApprove()) {%>
    <div id="approveDiv" class="noprint">
	<form action="approveActivityApply.do?applyId=<%=entity.getID()%>&type=<%=message.getApproveType()%>" id="approveForm" method="post">
	    <p><label>是否同意该申请？</label><input type="radio" name="isApprove" value="true" checked="checked"/>同意<input type="radio" name="isApprove" value="false"/>驳回</p>
	    <script id="editor" type="text/plain" name="editor">请填写审批意见</script>
	    <input type="hidden" id="comment" name="comment"><div id="approveSubmitDiv"><a class="button" id="submitApprove" href="#">提交</a></div>
	</form>
	<script type="text/javascript">
	    ue = UE.getEditor('editor');
	    $("#submitApprove").click(function(){
		if (confirm("是否确认提交？一旦提交无法修改！") == true)
		{
		    $("#comment").val(ue.getContent());
		    $("#approveForm").submit();
		}
	    });
	</script>
    </div>
    <% }%>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
	$("#printurl").html("此表线上地址：" + window.location.href + "<br/>纸质申请表只有内容和线上申请信息一致时才有效！");
	
	    if ($("#currentCommentDiv").html().replace(/^\s+|\s+$/g, '') == "")
	    {
		$("#currentCommentDiv").html("<div style='text-align:center;width:100%;'>暂无审批消息</div>");
	    }
    </script>
</html>
