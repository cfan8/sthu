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
<!DOCTYPE html>
<% ShowApplyMessage message = Util.getMessage(ShowApplyAction.class);
    CRoomApplyEntity entity = message.getApplyEntity();
    List<ApplyCommentEntity> comments = entity.getComments();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>显示教室申请</title>
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
	</style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <span id="postion">您当前的位置：活动申请</span>
    <div class="processtype" id="processtype<%=entity.getApplyStatus() %>"></div>
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
		    <p>分团委审批状态：<%=entity.getIdentityStatusText()%></p>
		    <p>校团委审批状态：<%=entity.getResourceStatusText()%></p>
		    <p>物业/注册中心/C楼审批状态：<%=entity.getAllocateStatusText()%></p>
		</td></tr>
	</table>
    </div>
    <div>
	<div>当前的审批消息：</div><div>
	    <% for (int i = 0; i < comments.size(); i++) {
		    ApplyCommentEntity comment = comments.get(i);
		    if (comment.getCommentStatus() == ApplyCommentEntity.COMMENT_STATUS_NEW) {%>
		    <div class="comment<%=comment.getCommentType()%>"><p><%=comment.getNickname()%> @ <%=new SimpleDateFormat("yyyy-MM-dd").format(comment.getPubDate()) %></p>
		<p><%=comment.getComment()%></p>
	    </div>
	    <% }
		}%></div>
    </div>
    <div>
	<div>以往的审批消息：</div><div>
	    <% for (int i = 0; i < comments.size(); i++) {
		    ApplyCommentEntity comment = comments.get(i);
		    if (comment.getCommentStatus() == ApplyCommentEntity.COMMENT_STATUS_OLD) {%>
	    <div class="comment<%=comment.getCommentType()%>"><p><%=comment.getNickname()%> @ <%=new SimpleDateFormat("yyyy-MM-dd").format(comment.getPubDate())%></p>
		<p><%=comment.getComment()%></p>
	    </div>
	    <% }
		}%></div>
    </div>
    <% if (message.isShowConfirm()) {%>
    <div>
	<span><a href="applyClassroom.do?app lyId=<%=entity.getID()%>">修改申请</a></span>
	<span><a href="confirmApply.do?applyId=<%=entity.getID()%>" id="confirmApply">确认申请</a></span>
	<script type="text/javascript">
	    $("#confirmApply").click(function(){
		return confirm("是否确认申请？一旦确认将无法修改！");
	    });
	    </script>
    </div>
    <% }%>
    <% if (message.isShowApprove()) {%>
    <div>
	<form action="approveApply.do?applyId=<%=entity.getID()%>&type=<%=message.getApproveType()%>" id="approveForm" method="post">
	    <p><label>是否同意该申请？</label><input type="radio" name="isApprove" value="true" checked="checked"/>同意<input type="radio" name="isApprove" value="false"/>驳回</p>
	    <script id="editor" type="text/plain" name="editor">请填写审批意见</script>
	    <input type="hidden" id="comment" name="comment"><input type="button" id="submitApprove" value="提交" />
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
</html>
