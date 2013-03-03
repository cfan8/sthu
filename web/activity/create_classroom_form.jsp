<%-- 
    Document   : apply_classroom_form
    Created on : 2013-2-13, 21:31:08
    Author     : linangran
--%>

<%@page import="cn.edu.tsinghua.sthu.entity.CRoomApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.constant.IdentityMapping"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>申请教室</title>
	    <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_user.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/js/moment.min.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/js/pikaday.min.js"></script>
	    <link rel='stylesheet' type='text/css' href='/css/pikaday.css' />
	    <link rel='stylesheet' type='text/css' href='/css/classroom/status.css' />
	    <link rel='stylesheet' type='text/css' href='/css/classroom/apply.css' />
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <span id="position">您当前的位置：教室借用申请</span>
    <div class="processtype" id="processtype0"></div>
    <div id="formdiv">
	<form action="submitClassroomApply.do" method="post" id="submitf">
	    <div><span class="tag">主办方（者）名称：</span><span class="value"><input type="text" name="organizer"/></span></div>
	    <div><span class="tag">借用人：</span><span class="value"><input type="text" name="borrower"/></span></div>
	    <div><span class="tag">借用人联系电话：</span><span class="value"><input type="text" name="borrowerCell"/></span></div>
	    <div><span class="tag">教室活动类型：</span><span class="value">
		    <select name="classUsage" id="classUsage">
			<option value="<%=CRoomApplyEntity.USAGE_CONTEST%>" selected="selected">校园比赛</option>
			<option value="<%=CRoomApplyEntity.USAGE_GROUP%>">党团活动</option>
			<option value="<%=CRoomApplyEntity.USAGE_LECTURE%>">校园讲座</option>
			<option value="<%=CRoomApplyEntity.USAGE_OTHER%>">其它</option>
		    </select>
		    <input type="text" name="usageComment" id="usageComment" style="display: none;"  value="校园比赛"/>
		</span></div>
	    <div><span class="tag">审批通道：</span><span class="value">
		    <select name="applyType">
			<% for (int i = 0; i < IdentityMapping.names.length; i++) {%>
			<option value="<%=i%>" <%=i == 0 ? "selected=\"selected\"" : ""%> ><%=IdentityMapping.names[i]%></option>
			<% }%>
		    </select>
		</span></div>
	    <div><span class="tag">负责人：</span><span class="value"><input type="text" name="manager"/></span></div>
	    <div><span class="tag">负责人联系电话：</span><span class="value"><input type="text" name="managerCell"/></span></div>
	    <div><span class="tag">借用日期：</span><span class="value"><input type="text" id="borrowDate" name="borrowDate"/></span></div>
	    <div><span class="tag">借用时间段：</span><span class="value"><input type="text" name="timePeriod" value="例：11:00-13:00"/></span></div>
	    <div><span class="tag">教室类型要求：</span><span class="value">
		    <select name="croomtype">
			<option value="1" selected="selected">普通教室</option>
			<option value="2">多媒体教室</option>
			<option value="3">C楼教室</option>
		    </select>
		</span></div>
	    <div><span class="tag">活动参与人数：</span><span class="value"><input type="text" name="number" /><input type="hidden" name="applyId" value="-1"></span></div>
	    <div><span class="tag">活动标题：</span><span class="value"><input type="text" name="title"/></span></div>
	    <div><span class="tag">活动具体内容：</span>
		<div class="ueditorBlock"><script id="contentEditor" type="text/plain" style="width: 400px;">如内容较多请使用上传附件功能上传说明文档。</script><input type="hidden" name="content" id="contentInput"/></div>
	    </div>
	    <div id="submitbutton"><a href="#" id="submitbtn">下一步</a></div>
	</form>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
	var ce = UE.getEditor('contentEditor');
	$("#classUsage").change(function(){
	    $("#usageComment").val($("#classUsage").find("option:selected").text());
	    if ($("#classUsage").val() == <%=CRoomApplyEntity.USAGE_OTHER%>){
		$("#usageComment").val("请在此填写");
		$("#usageComment").show();
	    }
	    else
	    {
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
	    return false;
	});
    </script>
</html>
