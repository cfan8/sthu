<%-- 
    Document   : apply_classroom_form
    Created on : 2013-2-13, 21:31:08
    Author     : linangran
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.edu.tsinghua.sthu.constant.IdentityMapping"%>
<%@page import="cn.edu.tsinghua.sthu.entity.CRoomApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.ShowApplyClassroomPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowApplyClassroomPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ShowApplyClassroomPageMessage message = Util.getMessage(ShowApplyClassroomPageAction.class);
    CRoomApplyEntity entity = message.getApplyEntity();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改教室申请</title>
	<script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_user.js"></script>
	<script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/moment.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/pikaday.min.js"></script>
        <link rel='stylesheet' type='text/css' href='/css/pikaday.css' />
        <link rel='stylesheet' type='text/css' href='/css/classroom/status.css' />
        <link rel='stylesheet' type='text/css' href='/css/classroom/apply.css' />
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <span id="postion">您当前的位置：活动申请</span>
    <div class="processtype" id="processtype0"></div>
    <div id="formdiv">
	<form action="submitClassroomApply.do" method="post" id="submitf">
	    <div><span class="tag">主办方（者）名称：</span><span class="value"><input type="text" name="organizer" value="<%=entity.getOrganizer()%>"/></span></div>
	    <div><span class="tag">借用人：</span><span class="value"><input type="text" name="borrower" value="<%=entity.getBorrower()%>" /></span></div>
	    <div><span class="tag">借用人联系电话：</span><span class="value"><input type="text" name="borrowerCell" value="<%=entity.getBorrowerCell()%>"/></span></div>
	    <div><span class="tag">教室活动类型：</span><span class="value">
		    <select name="classUsage" id="classUsage">
			<option value="<%=CRoomApplyEntity.USAGE_CONTEST%>" <%=entity.getUsage() == CRoomApplyEntity.USAGE_CONTEST ? "selected=\"selected\"" : ""%>>校园比赛</option>
			<option value="<%=CRoomApplyEntity.USAGE_GROUP%>" <%=entity.getUsage() == CRoomApplyEntity.USAGE_GROUP ? "selected=\"selected\"" : ""%>>党团活动</option>
			<option value="<%=CRoomApplyEntity.USAGE_LECTURE%>" <%=entity.getUsage() == CRoomApplyEntity.USAGE_LECTURE ? "selected=\"selected\"" : ""%>>校园讲座</option>
			<option value="<%=CRoomApplyEntity.USAGE_OTHER%>" <%=entity.getUsage() == CRoomApplyEntity.USAGE_OTHER ? "selected=\"selected\"" : ""%>>其它</option>
		    </select>
		    <input type="text" id="usageComment" name="usageComment" value="<%=entity.getUsageComment()%>" style="display: none;" />
		</span></div>
	    <div><span class="tag">审批通道：</span><span class="value">
		    <select name="applyType">
			<% for (int i = 0; i < IdentityMapping.names.length; i++) {%>
			<option value="<%=i%>" <%=i == entity.getApplyType() ? "selected=\"selected\"" : ""%> ><%=IdentityMapping.names[i]%></option>
			<% }%>
		    </select>
		</span></div>
	    <div><span class="tag">负责人：</span><span class="value"><input type="text" name="manager" value="<%=entity.getManager()%>"/></span></div>
	    <div><span class="tag">负责人联系电话：</span><span class="value"><input type="text" name="managerCell" value="<%=entity.getManagerCell()%>"/></span></div>
	    <div><span class="tag">借用日期：</span><span class="value"><input type="text" name="borrowDate" id="borrowDate"  value="<%=new SimpleDateFormat("yyyy-MM-dd").format(entity.getBorrowDate())%>"/></span></div>
	    <div><span class="tag">借用时间段：</span><span class="value"><input type="text" name="timePeriod" value="<%=entity.getTimePeriod()%>" /></span></div>
	    <div><span class="tag">教室类型要求：</span><span class="value">
		    <select name="croomtype">
			<option value="<%=CRoomApplyEntity.ROOMTYPE_ORDINARY%>" <%=entity.getCroomtype() == CRoomApplyEntity.ROOMTYPE_ORDINARY ? "selected=\"selected\"" : ""%>>普通教室</option>
			<option value="<%=CRoomApplyEntity.ROOMTYPE_MEDIA%>" <%=entity.getCroomtype() == CRoomApplyEntity.ROOMTYPE_MEDIA ? "selected=\"selected\"" : ""%>>多媒体教室</option>
			<option value="<%=CRoomApplyEntity.ROOMTYPE_CBUILDING%>" <%=entity.getCroomtype() == CRoomApplyEntity.ROOMTYPE_CBUILDING ? "selected=\"selected\"" : ""%>>C楼教室</option>
		    </select>
		</span></div>
	    <div><span class="tag">活动参与人数：</span><span class="value"><input type="text" name="number" value="<%=entity.getNumber()%>" /><input type="hidden" name="applyId" value="<%=entity.getID()%>"></span></div>
	    <div><span class="tag">活动标题：</span><span class="value"><input type="text" name="title" value="<%=entity.getTitle()%>"/></span></div>
	    <div><span class="tag">活动具体内容：</span>
		<div class="ueditorBlock"><script id="contentEditor" type="text/plain" style="width: 400px;" ><%=entity.getContent()%></script><input type="hidden" name="content" id="contentInput"/></div>
	    </div>
	    <div id="submitbutton"><a href="#" id="submitbtn">下一步</a></div>
	</form>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
	var ce = UE.getEditor('contentEditor');
	if ($("#classUsage").val() == <%=CRoomApplyEntity.USAGE_OTHER%>)
	{
	    $("#usageComment").show();
	}
	$("#classUsage").change(function(){
	    $("#usageComment").val($("#classUsage").find("option:selected").text());
	    if ($("#classUsage").val() == <%=CRoomApplyEntity.USAGE_OTHER%>){
		$("#usageComment").val("请在此填写");
		$("#usageComment").show();
	    }
	    else{
		$("#usageComment").hide();
	    }
	});
	var picker = new Pikaday({
	    field: document.getElementById('borrowDate'),
	    format: 'YYYY-MM-DD'
	});
	$("#submitbtn").click(function(){
	    $("#contentInput").val(ce.getContent());
	    $("#submitf").submit();
	});
    </script>
</html>
