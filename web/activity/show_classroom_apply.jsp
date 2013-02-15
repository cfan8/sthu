<%-- 
    Document   : show_classroom_apply
    Created on : 2013-2-15, 16:10:10
    Author     : linangran
--%>

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
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <div>
	<table>
	    <tr><td class="tag">活动组织：</td><td class="value"><%=entity.getOrganizer()%></td></tr>
	    <tr><td class="tag">借用人：</td><td class="value"><%=entity.getBorrower()%></td></tr>
	    <tr><td class="tag">借用人电话：</td><td class="value"><%=entity.getBorrowerCell()%></td></tr>
	    <tr><td class="tag">教室活动类型</td><td class="value"><%=entity.getUsageComment()%></td></tr>
	    <tr><td class="tag">活动负责人：</td><td class="value"><%=entity.getManager()%></td></tr>
	    <tr><td class="tag">活动负责人电话：</td><td class="value"><%=entity.getManagerCell()%></td></tr>
	    <tr><td class="blocktag">活动内容：</td></tr>
	    <tr><td class="blockvalue"><%=entity.getContent()%></td></tr>
	    <tr><td class="tag">借用日期：</td><td class="value"><%=entity.getBorrowDate()%></td></tr>
	    <tr><td class="tag">借用时间段：</td><td class="value"><%=entity.getTimePeriod()%></td></tr>
	    <tr><td class="tag">要求教室类型：</td><td class="value"><%=entity.getRoomtypeText()%></td></tr>
	    <tr><td class="tag">活动参与人数：</td><td class="value"><%=entity.getNumber()%></td></tr>
	    <tr><td class="blocktag">教室借用原因：</td></tr>
	    <tr><td class="blockvalue"><%=entity.getReason()%></td></tr>
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
	    <div class="comment<%=comment.getCommentType()%>"><p><%=comment.getNickname()%> @ <%=comment.getPubDate()%></p>
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
	    <div class="comment<%=comment.getCommentType()%>"><p><%=comment.getNickname()%> @ <%=comment.getPubDate()%></p>
		<p><%=comment.getComment()%></p>
	    </div>
	    <% }
		}%></div>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
</html>
