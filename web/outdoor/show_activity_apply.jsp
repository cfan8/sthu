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
    DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>显示活动申请</title>
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_tiny.js"></script>
	<script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
    </head>
<%@include file="/templates/general_header.jsp" %>
    <div id="tablediv">
	<table>
            <tr><td class="tag">申请类型：</td><td class="value"><%=entity.getApplyTypeText()%></td></tr>
	    <tr><td class="tag">活动名称：</td><td class="value"><%=entity.getActivityName()%></td></tr>
	    <tr><td class="tag">活动说明：</td><td class="value"><%=entity.getActivityContent()%></td></tr>
            <% if (entity.getApplyType() == 1) {%>
                    <tr><td class="tag">电子屏显示内容：</td><td class="value"><%=entity.getLEDContent()%></td></tr>
            <% } else { %>
            <tr><td class="tag">活动地点：</td><td class="value"><%=entity.getActivityLocation()%></td></tr>
	    <tr><td class="tag">活动材料：</td><td class="value"><%=entity.getActivityMaterial() %></td></tr>
            <% } %>
	    <tr><td class="tag">开始时间：</td><td class="value"><%=df.format(entity.getStartTime())%></td></tr>
	    <tr><td class="tag">结束时间：</td><td class="value"><%=df.format(entity.getEndTime())%></td></tr>
	    <tr><td class="tag">主办、协办单位：</td><td class="value"><%=entity.getOrganizerName()%></td></tr>
	    <tr><td class="tag">申请单位：</td><td class="value"><%=entity.getApplicatantType()%></td></tr>
	    <tr><td class="tag">申请人：</td><td class="value"><%=entity.getApplicatantName()%></td></tr>
	    <tr><td class="tag">联系电话：</td><td class="value"><%=entity.getApplicatantCell()%></td></tr>
	    <tr><td class="tag">电子邮箱：</td><td class="value"><%=entity.getApplicatantEmail()%></td></tr>
	    <tr><td class="tag">当前申请状态：</td><td class="value">
		    <p>申请状态：<%=entity.getApplyStatusText()%></p>
		    <p>分团委审批状态：<%=entity.getIdentityStatusText()%></p>
		    <p>校团委审批状态：<%=entity.getResourceStatusText()%></p>
		</td></tr>
	</table>
    </div>
    <% if (message.isShowConfirm()) {%>
    <div>
	<span><a href="applyActivity.do?applyId=<%=entity.getID()%>">修改申请</a></span>
	<span><a href="confirmOutdoorApply.do?applyId=<%=entity.getID()%>" id="confirmApply">确认申请</a></span>
	<script type="text/javascript">
	    $("#confirmApply").click(function(){
		return confirm("是否确认申请？一旦确认将无法修改！");
	    });
	    </script>
    </div>
    <% }%>
<%@include file="/templates/general_footer.jsp" %>
</html>
