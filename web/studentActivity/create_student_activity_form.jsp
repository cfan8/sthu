<%-- 
    Document   : create_student_activity_form
    Created on : 2013-7-22, 19:47:16
    Author     : xiaobo
--%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowApplyStudentActivityPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowApplyStudentActivityPageMessage"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.constant.IdentityMapping"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    ShowApplyStudentActivityPageMessage message = Util.getMessage(ShowApplyStudentActivityPageAction.class);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>申请学生活动</title>
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_user.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/js/moment.min.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/js/pikaday.min.js"></script>
	    <link rel='stylesheet' type='text/css' href='/css/pikaday.css' />
	    <link rel='stylesheet' type='text/css' href='/css/classroom/status.css' />
	    <link rel='stylesheet' type='text/css' href='/css/classroom/apply.css' />
    </head>
        <%@include file="/templates/general_header.jsp" %>
    <span id="position">您当前的位置：学生活动申请</span>
    <div class="processtype" id="processtype0"></div>
    <div id="formdiv">
	<form action="submitStudentActivityApply.do" method="post" id="submitf">
	    <div><span class="tag">主办方（者）名称：</span><span class="value"><input type="text" name="organizerName"/></span></div>
	    <div><span class="tag">协办方（者）名称：</span><span class="value"><input type="text" name="associateOrganizerName"/></span></div>
	    
            <div><span class="tag">申请人：</span><span class="value"><input disabled="disabled" type="text" name="applicantName" value="<%=message.getApplyUserNickname() %>" /></span></div>
	    <div><span class="tag">申请人联系电话：</span><span class="value"><input type="text" name="applicantCell"/></span></div>
	    <div><span class="tag">活动类型：</span><span class="value_select">
		    <select name="activityType" id="activityUsage">
			<option value="<%=StudentActivityApplyEntity.USAGE_GROUP%>" selected="selected">党团活动</option>
			<option value="<%=StudentActivityApplyEntity.USAGE_SPORTS%>">体育赛事</option>
			<option value="<%=StudentActivityApplyEntity.USAGE_LECTURE%>">学术报告</option>
			<option value="<%=StudentActivityApplyEntity.USAGE_CULTURE%>">文化活动</option>
			<option value="<%=StudentActivityApplyEntity.USAGE_AMUSE%>">文艺活动</option>
			<option value="<%=StudentActivityApplyEntity.USAGE_OTHER%>">其它活动</option>
		    </select>
		    <input type="text" name="usageComment" id="usageComment" style="display: none;" placeholder="请在此填写"  value="党团活动"/>
		</span></div>
            <div><span class="tag">活动对象：</span><span class="value_select">
                <select name="activityRange" id="activityRange">
                    <option value="<%=StudentActivityApplyEntity.RANGE_DEPART%>" selected="selected">院系</option>
                    <option value="<%=StudentActivityApplyEntity.RANGE_SCHOOL%>">全校</option>
                </select>
                </span></div>   
            <div><span class="tag">一级审批部门：</span><span class="value_select">
		    <select name="applyType">
			<% for (int i = 0; i < IdentityMapping.names.length; i++) {%>
			<option value="<%=i%>" <%=i == 0 ? "selected=\"selected\"" : ""%> ><%=IdentityMapping.names[i]%></option>
			<% }%>
		    </select>
		</span></div>
	    <div><span class="tag">负责人：</span><span class="value"><input type="text" name="managerName"/></span></div>
	    <div><span class="tag">负责人联系电话：</span><span class="value"><input type="text" name="managerCell"/></span></div>
	    <div><span class="tag">活动主题：</span><span class="value"><input type="text" name="activityTheme"/></span></div>
            <div><span class="tag">活动参与人数：</span><span class="value"><input type="text" name="participantsNumber" />
                    <input type="hidden" name="applyId" value="-1"></span></div>
	    
            <div><span class="tag">活动日期：</span><span class="value"><input type="text" id="activityDate" name="activityDate"/></span></div>
	    <div><span class="tag">活动时间：</span><span class="value"><input type="text" name="timePeriod"  placeholder="请用24小时制，例：11:00-13:00" value="请用24小时制，例：11:00-13:00"/></span></div>
	    
	    <div><span class="tag">活动具体内容：</span>
		<div class="ueditorBlock"><script id="contentEditor" type="text/plain" style="width: 400px;">如内容较多请使用上传附件功能上传说明文档。</script><input type="hidden" name="activityContent" id="contentInput"/></div>
	    </div>
	    <div id="submitbutton"><a href="#" id="submitbtn">下一步</a></div>
	</form>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
	var ce = UE.getEditor('contentEditor');
	$("#activityUsage").change(function(){
	    $("#usageComment").val($("#activityUsage").find("option:selected").text());
	    if ($("#activityUsage").val() == <%=StudentActivityApplyEntity.USAGE_OTHER%>){
		$("#usageComment").val("请在此填写");
		$("#usageComment").show();
	    }
	    else
	    {
		$("#usageComment").hide();
	    }
	});
	var picker = new Pikaday({
	    field: document.getElementById('activityDate'),
	    format: 'YYYY-MM-DD',
	    minDate: moment(moment().format("YYYY-MM-DD")).toDate(),
	    maxDate: moment(moment().format("YYYY-MM-DD")).add("days", 10).toDate()
	});
    
	$("#activityDate").change(function(){
	
	});
	
	$("form input[name='participantsNumber']").blur(function(){
	    var str = $(this).val().replace(/[^\d]+/g, "");
	    $(this).val(str);
	});
	
	$("#submitbtn").click(function(){
	    $("#contentInput").val(ce.getContent());
	    var needalert = false;
	    $("form input").each(function(){
		if ($(this).val() == "")
		{
		    needalert = true;
		    return false;
		}
	    });
	    if ($("select[name='applyType']").val() == 0)
	    {
		needalert = true;
	    }
	    if (needalert)
	    {
		alert("请完整填写所有表格！");
	    }
	    else
	    {
		$("input[disabled='disabled']").removeAttr("disabled");
		$("#submitf").submit();
	    }
	    return false;
	});
    </script>
</html>
