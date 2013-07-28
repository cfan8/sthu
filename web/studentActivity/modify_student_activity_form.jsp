<%-- 
    Document   : modify_student_activity_form
    Created on : 2013-7-23, 13:20:16
    Author     : xiaobo
--%>


<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowApplyStudentActivityPageAction"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.edu.tsinghua.sthu.constant.IdentityMapping"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowApplyStudentActivityPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% ShowApplyStudentActivityPageMessage message = Util.getMessage(ShowApplyStudentActivityPageAction.class);
    StudentActivityApplyEntity entity = message.getStudentActivityApplyEntity();
    StudentApplyOptionsEntity options = message.getStudentApplyOptionsEntity();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>修改学生活动申请</title>
	    <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_user.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/js/moment.min.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/js/pikaday.min.js"></script>
	    <link rel='stylesheet' type='text/css' href='/css/pikaday.css' />
	    <link rel='stylesheet' type='text/css' href='/css/classroom/status.css' />
	    <link rel='stylesheet' type='text/css' href='/css/classroom/apply.css' />
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <span id="postion">您当前的位置：学生活动申请</span>
    <div class="processtype" id="processtype0"></div>
    <div id="formdiv">
	<form action="submitStudentActivityApply.do" method="post" id="submitf">
            <div id="requiredinfo">
	    <div><span class="tag">主办方（者）名称：</span><span class="value"><input type="text" name="organizerName" value="<%=entity.getOrganizerName()%>"/></span></div>
	    <div><span class="tag">协办方（者）名称：</span><span class="value"><input type="text" name="associateOrganizerName" value="<%=entity.getAssociateOrganizerName()%>"/></span></div>
	    
            <div><span class="tag">申请人：</span><span class="value"><input disabled="disabled" type="text" name="applicantName" value="<%=message.getApplyUserNickname() %>" /></span></div>
	    <div><span class="tag">申请人联系电话：</span><span class="value"><input type="text" name="applicantCell" value="<%=entity.getApplicantCell()%>"/></span></div>
	    <div><span class="tag">活动类型：</span><span class="value_select">
		    <select name="activityType" id="activityUsage">
			<option value="<%=StudentActivityApplyEntity.USAGE_GROUP%>" <%=entity.getActivityType() == StudentActivityApplyEntity.USAGE_GROUP ? "selected = \"selected\"" : ""%>>党团活动</option>
			<option value="<%=StudentActivityApplyEntity.USAGE_SPORTS%>" <%=entity.getActivityType() == StudentActivityApplyEntity.USAGE_SPORTS ? "selected = \"selected\"" : ""%>>体育赛事</option>
			<option value="<%=StudentActivityApplyEntity.USAGE_LECTURE%>" <%=entity.getActivityType() == StudentActivityApplyEntity.USAGE_LECTURE ? "selected = \"selected\"" : ""%>>学术报告</option>
			<option value="<%=StudentActivityApplyEntity.USAGE_CULTURE%>" <%=entity.getActivityType() == StudentActivityApplyEntity.USAGE_CULTURE ? "selected = \"selected\"" : ""%>>文化活动</option>
			<option value="<%=StudentActivityApplyEntity.USAGE_AMUSE%>" <%=entity.getActivityType() == StudentActivityApplyEntity.USAGE_AMUSE ? "selected = \"selected\"" : ""%>>文艺活动</option>
			<option value="<%=StudentActivityApplyEntity.USAGE_OTHER%>" <%=entity.getActivityType() == StudentActivityApplyEntity.USAGE_OTHER ? "selected = \"selected\"" : ""%>>其它活动</option>
		    </select>
		    <input type="text" name="usageComment" id="usageComment" style="display: none;" placeholder="请在此填写"  value="<%=entity.getUsageComment()%>"/>
		</span></div>
            <div><span class="tag">活动对象：</span><span class="value_select">
                <select name="activityRange" id="activityRange">
                    <option value="<%=StudentActivityApplyEntity.RANGE_DEPART%>" <%=entity.getActivityType() == StudentActivityApplyEntity.RANGE_DEPART ? "selected = \"selected\"" : ""%>>院系</option>
                    <option value="<%=StudentActivityApplyEntity.RANGE_SCHOOL%>" <%=entity.getActivityType() == StudentActivityApplyEntity.RANGE_SCHOOL ? "selected = \"selected\"" : ""%>>全校</option>
                </select>
                </span></div>   
            <div><span class="tag">一级审批部门：</span><span class="value_select">
		    <select name="applyType">
			<% for (int i = 0; i < IdentityMapping.names.length; i++) {%>
			<option value="<%=i%>" <%=i == entity.getApplyPath() ? "selected=\"selected\"" : ""%> ><%=IdentityMapping.names[i]%></option>
			<% }%>
		    </select>
		</span></div>
	    <div><span class="tag">负责人：</span><span class="value" ><input type="text" name="managerName" value="<%=entity.getManagerName()%>"/></span></div>
	    <div><span class="tag">负责人联系电话：</span><span class="value"><input type="text" name="managerCell" value="<%=entity.getManagerCell()%>"/></span></div>
	    <div><span class="tag">活动主题：</span><span class="value"><input type="text" name="activityTheme" value="<%=entity.getActivityTheme()%>"/></span></div>
            <div><span class="tag">活动参与人数：</span><span class="value"><input type="text" name="participantsNumber" value="<%=entity.getParticipantsNumber()%>"/>
                    <input type="hidden" name="applyId" value="-1"></span></div>
	    
            <div><span class="tag">活动日期：</span><span class="value"><input type="text" id="activityDate" name="activityDate" value="<%=entity.getActivityDate()%>"/></span></div>
	    <div><span class="tag">活动时间：</span><span class="value"><input type="text" name="timePeriod"  placeholder="请用24小时制，例：11:00-13:00" value="<%=entity.getTimePeriod()%>"/></span></div>
            </div>
            <div><span class="tag">活动范围：</span><span class="value_select">
		    <select name="activityArea" id="activityArea">
			<option value="<%=StudentApplyOptionsEntity.AREA_INSCHOOL%>" <%=options.getActivityArea() == StudentApplyOptionsEntity.AREA_INSCHOOL ? "selected = \"selected\"" : ""%>>仅校内</option>
			<option value="<%=StudentApplyOptionsEntity.AREA_OUTSCHOOL%>" <%=options.getActivityArea() == StudentApplyOptionsEntity.AREA_OUTSCHOOL ? "selected = \"selected\"" : ""%>>涉校外</option>
			<option value="<%=StudentApplyOptionsEntity.AREA_OUTCOUNTRY%>" <%=options.getActivityArea() == StudentApplyOptionsEntity.AREA_OUTCOUNTRY ? "selected = \"selected\"" : ""%>>涉境外</option>
		    </select>  
		</span></div>
            <%if(options.getActivityArea() == 2) {%>
            <div id="outSchoolInfo">
                <div><span class="tag">校外人员情况：</span><span class="value"><input type="text" name="externalIntro" value="<%=options.getExternalIntro()%>"/></span></div>
                <div><span class="tag">校外合作单位：</span><span class="value"><input type="text" name="externalOrganizationIntro" value="<%=options.getExternalOrganizationIntro()%>"/></span></div>
                <div><span class="tag">出校活动安全预案：</span><span class="value"><input type="text" name="securityPreparedness" value="<%=options.getSecurityPreparedness()%>"/></span></div>
            </div>
            <div id="outCountryInfo" style="display: none">
                <div><span class="tag">境外人员情况：</span><span class="value"><input type="text" name="overseasIntro"/></span></div>
                <div><span class="tag">境外合作单位：</span><span class="value"><input type="text" name="overseasOrganizationIntro"/></span></div>
                <div><span class="tag">相关材料：</span><span class="value"><input type="text" name="overseasMaterial"/></span></div>
            </div>
            <% }%> <%if(options.getActivityArea() == 3) {%>
            <div id="outSchoolInfo" style="display: none">
                <div><span class="tag">校外人员情况：</span><span class="value"><input type="text" name="externalIntro"/></span></div>
                <div><span class="tag">校外合作单位：</span><span class="value"><input type="text" name="externalOrganizationIntro"/></span></div>
                <div><span class="tag">出校活动安全预案：</span><span class="value"><input type="text" name="securityPreparedness"/></span></div>
            </div>
            <div id="outCountryInfo">
                <div><span class="tag">境外人员情况：</span><span class="value"><input type="text" name="overseasIntro" value="<%=options.getOverseasIntro()%>"/></span></div>
                <div><span class="tag">境外合作单位：</span><span class="value"><input type="text" name="overseasOrganizationIntro" value="<%=options.getOverseasOrganizationIntro()%>"/></span></div>
                <div><span class="tag">相关材料：</span><span class="value"><input type="text" name="overseasMaterial" value="<%=options.getOverseasMaterial()%>"/></span></div>
            </div><% }%>
	    <div><span class="tag">活动具体内容：</span>
		<div class="ueditorBlock"><script id="contentEditor" type="text/plain" style="width: 400px;"><%=entity.getActivityContent()%></script><input type="hidden" name="activityContent" id="contentInput"/></div>
	    </div>
	    <div id="submitbutton"><a href="#" id="submitbtn">下一步</a></div>
	</form>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
	var ce = UE.getEditor('contentEditor');
	if ($("#classUsage").val() == <%=StudentActivityApplyEntity.USAGE_OTHER%>)
	{
	    $("#usageComment").show();
	}
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
        $("#activityArea").change(function(){
            if($("#activityArea").val() == <%=StudentApplyOptionsEntity.AREA_INSCHOOL%>){
                $("#outSchoolInfo").hide();
                $("#outCountryInfo").hide();
            }else if($("#activityArea").val() == <%=StudentApplyOptionsEntity.AREA_OUTSCHOOL%>){
                $("#outSchoolInfo").show();
                $("#outCountryInfo").hide();
            }else if($("#activityArea").val() == <%=StudentApplyOptionsEntity.AREA_OUTCOUNTRY%>){
                $("#outSchoolInfo").hide();
                $("#outCountryInfo").show();
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
	    $("form #requiredinfo input").each(function(){
		if ($(this).val() == "")
		{
		    needalert = true;
		    return false;
		}
	    });
            if($("#activityArea").val()=="2"){
                $("form #outSchoolInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }else if($("#activityArea").val()=="3"){
                $("form #outCountryInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
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
