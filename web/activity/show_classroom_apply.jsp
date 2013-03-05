<%-- 
    Document   : show_classroom_apply
    Created on : 2013-2-15, 16:10:10
    Author     : linangran
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowApplyMessage"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.ApplyCommentEntity"%>
<%@page import="cn.edu.tsinghua.sthu.entity.CRoomApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.ShowApplyAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<% ShowApplyMessage message = Util.getMessage(ShowApplyAction.class);
    CRoomApplyEntity entity = message.getApplyEntity();
    List<ApplyCommentEntity> comments = entity.getComments();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>显示教室借用申请</title>
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
		    width: 600px;
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
		    width: 396px;
		    border-style: solid;
		    border-color: white white #d0cfd0 white;
		    border-width: 1px 1px 1px 0px;
		}

		.commentDiv
		{
		    width: 578px;
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
		    width: 392px;
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

		.comment2
		{
		    background-color: #efc9b8;
		}

		.comment1
		{
		    background-color: #d3fac2;
		}

		#approveDiv
		{
		    width: 600px;
		    margin: 0 auto;
		}

		#approveSubmitDiv
		{
		    width: 600px;
		    margin: 20px auto 0px;
		    text-align: center;
		}

		#approveSubmitDiv a
		{
		    display: inline-block;
		    width: 180px;
		    height: 26px;
		    background-color: #ff7900;
		    text-align: center;
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
    <div id="position" class="noprint">您当前的位置：教室借用申请</div>
    <div class="processtype noprint" id="processtype<%=entity.getApplyStatus()%>"></div>
    <div class="onlyprint" style="text-align:center; font-family: 黑体; font-size: 30px;">教室借用申请表</div>
    <div class="onlyprint" style="text-align:center;" id="printurl"></div>
    <div id="tablediv">
	<table>
	    <tr><td class="tag">活动组织：</td><td class="value"><%=entity.getOrganizer()%></td></tr>
	    <tr><td class="tag">借用人：</td><td class="value"><%=entity.getBorrower()%></td></tr>
	    <tr><td class="tag">借用人电话：</td><td class="value"><%=entity.getBorrowerCell()%></td></tr>
	    <tr><td class="tag">教室活动类型：</td><td class="value"><%=entity.getUsageComment()%></td></tr>
	    <tr><td class="tag">活动负责人：</td><td class="value"><%=entity.getManager()%></td></tr>
	    <tr><td class="tag">活动负责人电话：</td><td class="value"><%=entity.getManagerCell()%></td></tr>
	    <tr><td class="tag">活动标题：</td><td class="value"><%=entity.getTitle()%></td></tr>
	    <tr><td class="blocktag" colspan="2">活动具体内容：</td></tr>
	    <tr><td class="blockvalue" colspan="2"><%=entity.getContent()%></td></tr>
	    <tr><td class="tag">借用日期：</td><td class="value"><%=entity.getBorrowDate()%></td></tr>
	    <tr><td class="tag">借用时间段：</td><td class="value"><%=entity.getTimePeriod()%></td></tr>
	    <tr><td class="tag">要求教室类型：</td><td class="value"><%=entity.getRoomtypeText()%></td></tr>
	    <tr><td class="tag">活动参与人数：</td><td class="value"><%=entity.getNumber()%></td></tr>
	    <tr><td class="tag">当前申请状态：</td><td class="value">
		    <p>申请状态：<%=entity.getApplyStatusText()%></p>
		    <p>院系学生组（分团委）审批状态：<%=entity.getIdentityStatusText()%></p>
		    <p>校团委审批状态：<%=entity.getResourceStatusText()%></p>
		    <p>物业/注册中心/C楼审批状态：<%=entity.getAllocateStatusText()%></p>
		</td></tr>
	</table>
    </div>
    <div id="commentBlock">
	<div id="showControl">
	    <div id="currentcomment">当前的审批消息</div><div id="oldcomment" class="noprint">以往的审批消息</div><div id="borderDiv" class="noprint"></div>
	</div>
	<div id="commentShow" >
	    <div class="commentDiv toprint" id="currentCommentDiv">
		<% for (int i = 0; i < comments.size(); i++) {
			ApplyCommentEntity comment = comments.get(i);
			if (comment.getCommentStatus() == ApplyCommentEntity.COMMENT_STATUS_NEW) {%>
		<div class="commentitem comment<%=comment.getCommentType()%>">
		    <div class="commenttitle">
			<%=comment.getNickname()%> @ <%=new SimpleDateFormat("yyyy-MM-dd").format(comment.getPubDate())%> :
		    </div>
		    <div class="commentcontent">
			<%=comment.getComment()%>
		    </div>
		    <div style="clear:both;"></div>
		</div>
		<% }
			}%>
	    </div>
	    <div class="commentDiv noprint" id="oldCommentDiv">

		<% for (int i = 0; i < comments.size(); i++) {
			ApplyCommentEntity comment = comments.get(i);
			if (comment.getCommentStatus() == ApplyCommentEntity.COMMENT_STATUS_OLD) {%>
		<div class="commentitem comment<%=comment.getCommentType()%>">
		    <div class="commenttitle">
			<%=comment.getNickname()%> @ <%=new SimpleDateFormat("yyyy-MM-dd").format(comment.getPubDate())%> :
		    </div>
		    <div class="commentcontent">
			<%=comment.getComment()%>
		    </div>
		    <div style="clear:both;"></div>
		</div>
		<% }
			}%>
	    </div>
	    <div style="clear:both;"></div>
	</div>
    </div>
    <% if (message.isShowConfirm()) {%>
    <div id="confirmDiv" class="noprint">
	<span><a href="applyClassroom.do?applyId=<%=entity.getID()%>">修改申请</a></span>
	<span><a href="confirmApply.do?applyId=<%=entity.getID()%>" id="confirmApply">确认申请</a></span>
	<script type="text/javascript">
	    $("#confirmApply").click(function(){
		return confirm("是否确认申请？一旦确认将无法修改！");
	    });
	</script>
    </div>
    <% }%>
    <% if (message.isShowApprove()) {%>
    <div id="approveDiv" class="noprint">
	<form action="approveApply.do?applyId=<%=entity.getID()%>&type=<%=message.getApproveType()%>" id="approveForm" method="post">
	    <p><label>是否同意该申请？</label><input type="radio" name="isApprove" value="true" checked="checked"/>同意<input type="radio" name="isApprove" value="false"/>驳回</p>
	    <script id="editor" type="text/plain" name="editor">请填写审批意见</script>
	    <input type="hidden" id="comment" name="comment" />
	    <% if (message.getApproveType() == ShowApplyMessage.APPROVE_TYPE_RESOURCE) {%>
	    <select id="moduleSelect" style="margin: 5px 0px 0px 0px;max-width: 600px;">
		<option value="0">使用审批模板</option>
		<option value="1">[C楼教室]同意，借用C楼XXX教室，请将此单放到C楼306门口文件袋内。</option>
		<option value="2">[多媒体教室]同意，请持此单到老12号楼416注册中心办理，望贵处大力支持。</option>
		<option value="3">[普通教室]同意，请持此单到四教二层物业中心办理，望贵处大力支持。</option>
	    </select>
	    <% }%>
	    <div id="approveSubmitDiv"><a class="button" id="submitApprove" href="#">提交</a></div>
	</form>
	<script type="text/javascript">
	    var ue = UE.getEditor('editor');
	    $("#submitApprove").click(function(){
		if (confirm("是否确认提交？一旦提交无法修改！") == true)
		{
		    $("#comment").val(ue.getContent());
		    $("#approveForm").submit();
		}
		return false;
	    });
	    <% if (message.getApproveType() == ShowApplyMessage.APPROVE_TYPE_RESOURCE) {%>
	    $("#moduleSelect").change(function(){
		if ( $("#moduleSelect").val() != "0")
		{
		    var text = $("#moduleSelect").find("option:selected").text();
		    text = text.replace(/\[.*\]/, "");
		}
		else
		{
		    var text = "";
		}
		ue.setContent('<p>' + text + '</p>');
	    });
	    <% }%>
	</script>
    </div>
    <% }%>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
    if ($("#currentCommentDiv").html().replace(/^\s+|\s+$/g, '') == "")
    {
	$("#currentCommentDiv").html("<div style='text-align:center;width:100%;'>暂无审批消息</div>");
    }
    if ($("#oldCommentDiv").html().replace(/^\s+|\s+$/g, '') == "")
    {
	$("#oldCommentDiv").html("<div style='text-align:center;width:100%;'>暂无审批消息</div>");
    }
$("#currentcomment").click(function(){
    $("#currentcomment").css({
	"border-color": "#d0cfd0 #d0cfd0 white #d0cfd0",
	"color":"#404040"
    });
    $("#oldcomment").css({
	"border-color": "white white #d0cfd0 white",
	"color":"#8f8f8f"
    });
    $("#oldCommentDiv").hide();
    $("#currentCommentDiv").show();
});
$("#oldcomment").click(function(){
    $("#currentcomment").css({
	"border-color": "white #d0cfd0 #d0cfd0 white",
	"color":"#8f8f8f"
    });
    $("#oldcomment").css({
	"border-color": "#d0cfd0 #d0cfd0 white white",
	"color":"#404040"
    });
    $("#currentCommentDiv").hide();
    $("#oldCommentDiv").show();
});
$("#printurl").html("此表线上地址：" + window.location.href + "<br/>纸质申请表只有内容和线上申请信息一致时才有效！");
    </script>
</html>
