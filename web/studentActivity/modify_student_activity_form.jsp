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
            <style type="text/css">
                textarea{
                    vertical-align: top;
                    resize: none;
                    width:200px;
                }
            </style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <span id="postion">您当前的位置：学生活动申请</span>
    <div class="processtype" id="processtype0"></div>
    <div id="formdiv">
	<form action="submitStudentActivityApply.do" method="post" id="submitf">
            <div id="requiredinfo">
	    <div><span class="tag">主办方（者）名称：</span><span class="value"><input type="text" name="organizerName" <%if(message.getApplyType() == ShowApplyStudentActivityPageMessage.GROUP_APPLY){%> disabled="disabled" <%}%> value="<%=entity.getOrganizerName()%>"/></span></div>
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
            <div><span class="tag">一级审批部门：</span><%if(message.getApplyType() == ShowApplyStudentActivityPageMessage.USER_APPLY){%><span class="value_select">
                        <select name="applyType">
                            <% for (int i = 0; i < IdentityMapping.names.length; i++) {%>
                            <option value="<%=i%>" <%=i == entity.getApplyPath() ? "selected=\"selected\"" : ""%> ><%=IdentityMapping.names[i]%></option>
                            <% }%>
                        </select>
                    </span>
                    <%}else if(message.getApplyType() == ShowApplyStudentActivityPageMessage.GROUP_APPLY){%><span class="value"><input disabled="disabled" type="text" value="<%=IdentityMapping.names[1]%>" /><input type="hidden" name="applyType" value="1"/></span>
                    <%}%>
            </div>
	    <div><span class="tag">负责人：</span><span class="value" ><input type="text" name="managerName" value="<%=entity.getManagerName()%>"/></span></div>
	    <div><span class="tag">负责人联系电话：</span><span class="value"><input type="text" name="managerCell" value="<%=entity.getManagerCell()%>"/></span></div>
	    <div><span class="tag">活动主题：</span><span class="value"><input type="text" name="activityTheme" value="<%=entity.getActivityTheme()%>"/></span></div>
            <div><span class="tag">活动参与人数：</span><span class="value"><input type="text" name="participantsNumber" value="<%=entity.getParticipantsNumber()%>"/>
                    <input type="hidden" name="applyId" value="<%=entity.getID()%>" /></span></div>
                    
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
            
            <div id="outSchoolInfo" <%if(options.getActivityArea() != 2) {%>style="display:none"<% }%>>
                <div><span class="tag">校外人员情况：</span><span class="value"><textarea name="externalIntro" rows="5"><%=options.getExternalIntro()%></textarea></span></div>
                <div><span class="tag">校外合作单位：</span><span class="value"><textarea name="externalOrganizationIntro" rows="5"><%=options.getExternalOrganizationIntro()%></textarea></span></div>
                <div><span class="tag">出校活动安全预案：</span><div class="ueditorBlock"><script id="securityEditor" type="text/plain" style="width: 400px;"><%=options.getSecurityPreparedness()%></script><input type="hidden" name="securityPreparedness" id="securityPreparedness"/></div></div>
            </div>    
            <div id="outCountryInfo" <%if(options.getActivityArea() != 3) {%>style="display:none"<% }%>>
                <div><span class="tag">境外人员情况：</span><span class="value"><textarea name="overseasIntro" rows="5"><%=options.getOverseasIntro()%></textarea></span></div>
                <div><span class="tag">境外合作单位：</span><span class="value"><textarea name="overseasOrganizationIntro" rows="5"><%=options.getOverseasOrganizationIntro()%></textarea></span></div>
                <div><span class="tag">相关材料：</span><div class="ueditorBlock"><script id="overseasEditor" type="text/plain" style="width: 400px;"><%=options.getOverseasMaterial()%></script><input type="hidden" name="overseasMaterial" id="overseasMaterial"/></div></div>
            </div>
            <hr />
            <div><span class="tag">教室申请：</span><span class="value">
                    <input type="radio" name="croomFlag" value="<%=StudentApplyOptionsEntity.CROOMFLAG_APPLY%>" onclick="changeCroomState(1)" <%=options.getCroomFlag() == StudentApplyOptionsEntity.CROOMFLAG_APPLY ? "checked = \"true\"" : ""%>/>是
                    <input type="radio" name="croomFlag" value="<%=StudentApplyOptionsEntity.CROOMFLAG_NOTAPPLY%>" onclick="changeCroomState(2)" <%=options.getCroomFlag() == StudentApplyOptionsEntity.CROOMFLAG_NOTAPPLY ? "checked = \"true\"" : ""%>>否
                </span>
            </div> 
            <div id="croomInfo" <%if(options.getCroomFlag() == StudentApplyOptionsEntity.CROOMFLAG_NOTAPPLY) {%>style="display:none"<%}else{%>style="display:block"<%}%>>
                <div><span class="tag">教室类型要求：</span><span class="value_select">
		    <select name="croomType">
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_ORDINARY%>" <%=options.getCroomType() == StudentApplyOptionsEntity.ROOMTYPE_ORDINARY ? "selected = \"selected\"" : ""%>>普通教室</option>
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_MEDIA%>" <%=options.getCroomType() == StudentApplyOptionsEntity.ROOMTYPE_MEDIA ? "selected = \"selected\"" : ""%>>多媒体教室</option>
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_CBUILDING_NORMAL%>" <%=options.getCroomType() == StudentApplyOptionsEntity.ROOMTYPE_CBUILDING_NORMAL ? "selected = \"selected\"" : ""%>>C楼普通教室</option>
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_CBUILDING_MEDIA%>" <%=options.getCroomType() == StudentApplyOptionsEntity.ROOMTYPE_CBUILDING_MEDIA ? "selected = \"selected\"" : ""%>>C楼多媒体教室</option>
		    </select>
		</span></div>
                <div><span class="tag">是否服从调剂：</span><span class="value">
                    <input type="radio" name="allowAdjust" value="<%=StudentApplyOptionsEntity.ALLOWADJUST_ACCEPT%>" <%=options.getAllowAdjust() == StudentApplyOptionsEntity.ALLOWADJUST_ACCEPT ? "checked = \"true\"" : ""%>/>是
                    <input type="radio" name="allowAdjust" value="<%=StudentApplyOptionsEntity.ALLOWADJUST_REJECT%>" <%=options.getAllowAdjust() == StudentApplyOptionsEntity.CROOMFLAG_APPLY ? "checked = \"true\"" : ""%>/>否
                </span></div>
                <div><span class="tag">教室容量：</span><span class="value" ><input type="text" name="croomCapacity" value="<%=options.getCroomCapacity()%>"/></span></div>
                <div><span class="tag">开始日期和时间:</span><span class="value"><input type="text" name="croomStartTime" value="<%=options.getCroomStartTime()%>"/></span></div>
                <div><span class="tag">结束日期和时间:</span><span class="value"><input type="text" name="croomEndTime" value="<%=options.getCroomEndTime()%>"/></span></div>
            </div>
            <hr />
            <div><span class="tag">电子屏申请：</span><span class="value">
                    <input type="radio" name="LEDFlag" value="<%=StudentApplyOptionsEntity.LEDFLAG_APPLY%>" onclick="changeLEDState(1)" <%=options.getLEDFlag() == StudentApplyOptionsEntity.LEDFLAG_APPLY ? "checked = \"true\"" : ""%>/>是
                    <input type="radio" name="LEDFlag" value="<%=StudentApplyOptionsEntity.LEDFLAG_NOTAPPLY%>" onclick="changeLEDState(2)" <%=options.getLEDFlag() == StudentApplyOptionsEntity.LEDFLAG_NOTAPPLY ? "checked = \"true\"" : ""%>/>否
                </span>
            </div>
            <div id="LEDInfo" <%if(options.getLEDFlag() == StudentApplyOptionsEntity.LEDFLAG_NOTAPPLY) {%>style="display:none"<%}else{%>style="display:block"<%}%>>
                <div><span class="tag">电子屏显示内容：</span><span class="value"><textarea name="LEDContent" rows="3"><%=options.getLEDContent()%></textarea></span></div>
                <div><span class="tag">开始日期和时间：</span><span class="value"><input type="text" name="LEDStartTime" value="<%=options.getLEDStartTime()%>"/></span></div>
                <div><span class="tag">结束日期和时间：</span><span class="value"><input type="text" name="LEDEndTime" value="<%=options.getLEDEndTime()%>"/></span></div>
            </div>
            <hr />
            <div><span class="tag">室外场地申请：</span><span class="value">
                    <input type="radio" name="outsideFlag" value="<%=StudentApplyOptionsEntity.OUTSIDEFLAG_APPLY%>" onclick="changeOutsideState(1)" <%=options.getOutsideFlag() == StudentApplyOptionsEntity.OUTSIDEFLAG_APPLY ? "checked = \"true\"" : ""%>/>是
                    <input type="radio" name="outsideFlag" value="<%=StudentApplyOptionsEntity.OUTSIDEFLAG_NOTAPPLY%>" onclick="changeOutsideState(2)" <%=options.getOutsideFlag() == StudentApplyOptionsEntity.OUTSIDEFLAG_NOTAPPLY ? "checked = \"true\"" : ""%>/>否
                </span>
            </div>
            <div id="outsideInfo" <%if(options.getOutsideFlag() == StudentApplyOptionsEntity.OUTSIDEFLAG_NOTAPPLY) {%>style="display:none"<%}else{%>style="display:block"<%}%>>
                <div><span class="tag">活动地点:</span><span class="value_select">
		    <select name="activityLocation">
			<option value="<%=StudentApplyOptionsEntity.LOCATION_ZIJING%>" <%=options.getActivityLocation() == StudentApplyOptionsEntity.LOCATION_ZIJING ? "selected = \"selected\"" : ""%>>紫荆园门口</option>
			<option value="<%=StudentApplyOptionsEntity.LOCATION_TAOLI%>" <%=options.getActivityLocation() == StudentApplyOptionsEntity.LOCATION_TAOLI ? "selected = \"selected\"" : ""%>>桃李园门口</option>
			<option value="<%=StudentApplyOptionsEntity.LOCATION_TINGTAOSHULIN%>" <%=options.getActivityLocation() == StudentApplyOptionsEntity.LOCATION_TINGTAOSHULIN ? "selected = \"selected\"" : ""%>>听涛园附近小树林区域</option>
			<option value="<%=StudentApplyOptionsEntity.LOCATION_TINGTAOBEI%>" <%=options.getActivityLocation() == StudentApplyOptionsEntity.LOCATION_TINGTAOBEI ? "selected = \"selected\"" : ""%>>听涛园以北学堂路段学生生活区</option>
		    </select>
		</span></div>
                <div><span class="tag">活动地点:</span><span class="value"><input type="text" name="activityLocation" value="<%=options.getActivityLocation()%>"/></span></div>
                <div><span class="tag">借用日期:</span><span class="value"><input type="text" name="outsideBorrowDate" value="<%=options.getOutsideBorrowDate()%>"/></span></div>
                <div><span class="tag">借用时间段:</span><span class="value"><input type="text" name="outsideTimePeriod" value="<%=options.getOutsideTimePeriod()%>"/></span></div>
            </div>
            <hr />
            <div><span class="tag">展板申请：</span><span class="value">
                    <input type="radio" name="boardFlag" value="<%=StudentApplyOptionsEntity.BOARDFLAG_APPLY%>" onclick="changeBoardState(1)" <%=options.getBoardFlag() == StudentApplyOptionsEntity.BOARDFLAG_APPLY ? "checked = \"true\"" : ""%>/>是
                    <input type="radio" name="boardFlag" value="<%=StudentApplyOptionsEntity.BOARDFLAG_NOTAPPLY%>" onclick="changeBoardState(2)" <%=options.getBoardFlag() == StudentApplyOptionsEntity.BOARDFLAG_NOTAPPLY ? "checked = \"true\"" : ""%>/>否
                </span>
            </div>
            <div id="boardInfo" <%if(options.getBoardFlag() == StudentApplyOptionsEntity.BOARDFLAG_NOTAPPLY) {%>style="display:none"<%}else{%>style="display:block"<%}%>>
                <div><span class="tag">规格:</span><span class="value"><input type="text" name="boardSize" value="<%=options.getBoardSize()%>"/></span></div>
                <div><span class="tag">开始日期和时间:</span><span class="value"><input type="text" name="BoardStartTime" value="<%=options.getBoardStartTime()%>"/></span></div>
                <div><span class="tag">结束日期和时间:</span><span class="value"><input type="text" name="BoardEndTime" value="<%=options.getBoardEndTime()%>"/></span></div>
                <div><span class="tag">活动材料（附件）:</span><div class="ueditorBlock"><script id="boardEditor" type="text/plain" style="width: 400px;"><%=options.getBoardMaterial()%></script><input type="hidden" name="boardMaterial" id="boardMaterial"/></div></div>
            </div>
            <hr />
            <div><span class="tag">学生清华发布申请：</span><span class="value">
                    <input type="radio" name="publicityFlag" value="<%=StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY%>" onclick="changePublicityState(1)" <%=options.getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY ? "checked = \"true\"" : ""%>/>是
                    <input type="radio" name="publicityFlag" value="<%=StudentApplyOptionsEntity.PUBLICITYFLAG_NOTAPPLY%>" onclick="changePublicityState(2)" <%=options.getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_NOTAPPLY ? "checked = \"true\"" : ""%>/>否
                </span>
            </div>
            <div id="publicityInfo" <%if(options.getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_NOTAPPLY) {%>style="display:none"<%}else{%>style="display:block"<%}%>>
                <div><span class="tag">宣传材料:</span><div class="ueditorBlock"><script id="publicityEditor" type="text/plain" style="width: 400px;"><%=options.getPublicityMaterials()%></script><input type="hidden" name="publicityMaterials" id="publicityMaterials"/></div></div>
            </div>
            <hr />
            <div><span class="tag">门票抽签申请：</span><span class="value">
                    <input type="radio" name="ticketFlag" value="<%=StudentApplyOptionsEntity.TICKETFLAG_APPLY%>" onclick="changeTicketState(1)" <%=options.getTicketFlag() == StudentApplyOptionsEntity.TICKETFLAG_APPLY ? "checked = \"true\"" : ""%>/>是
                    <input type="radio" name="ticketFlag" value="<%=StudentApplyOptionsEntity.TICKETFLAG_NOTAPPLY%>" onclick="changeTicketState(2)" <%=options.getTicketFlag() == StudentApplyOptionsEntity.TICKETFLAG_NOTAPPLY ? "checked = \"true\"" : ""%>/>否
                </span>
            </div>
            <div id="ticketInfo" <%if(options.getTicketFlag() == StudentApplyOptionsEntity.TICKETFLAG_NOTAPPLY) {%>style="display:none"<%}else{%>style="display:block"<%}%>>
                <div><span class="tag">门票数目:</span><span class="value"><input type="text" name="ticketNum" value="<%=options.getTicketNum()%>"/></span></div>
                <div><span class="tag">发票时间:</span><span class="value"><input type="text" name="ticketTime" value="<%=options.getTicketTime()%>"/></span></div>
                <div><span class="tag">发票地点:</span><span class="value"><input type="text" name="ticketLocation" value="<%=options.getTicketLocation()%>"/></span></div>
            </div>
            <hr />
	    <div><span class="tag">活动具体内容：</span>
		<div class="ueditorBlock"><script id="contentEditor" type="text/plain" style="width: 400px;"><%=entity.getActivityContent()%></script><input type="hidden" name="activityContent" id="contentInput"/></div>
	    </div>
	    <div id="submitbutton"><a href="#" id="submitbtn">下一步</a></div>
	</form>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
	var ce = UE.getEditor('contentEditor');
        var se = UE.getEditor('securityEditor');
        var oe = UE.getEditor('overseasEditor');
        var be = UE.getEditor('boardEditor');
        var pe = UE.getEditor('publicityEditor');
        function changeCroomState(state){
            if(state == 1){
                $("#croomInfo").show();
            }else{
                $("#croomInfo").hide();
            }
        }
        
        function changeLEDState(state){
            if(state == 1){
                $("#LEDInfo").show();
            }else{
                $("#LEDInfo").hide();
            }
        }
        
        function changeOutsideState(state){
            if(state == 1){
                $("#outsideInfo").show();
            }else{
                $("#outsideInfo").hide();
            }
        }
        
        function changeBoardState(state){
            if(state == 1){
                $("#boardInfo").show();
            }else{
                $("#boardInfo").hide();
            }
        }
        
        function changePublicityState(state){
            if(state == 1){
                $("#publicityInfo").show();
            }else{
                $("#publicityInfo").hide();
            }
        }
        
        function changeTicketState(state){
            if(state == 1){
                $("#ticketInfo").show();
            }else{
                $("#ticketInfo").hide();
            }
        }
        
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
                $("#securityPreparedness").val(se.getContent());
                $("form #outSchoolInfo textarea").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }else if($("#activityArea").val()=="3"){
                $("#overseasMaterial").val(oe.getContent());
                $("form #outCountryInfo textarea").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='croomFlag']")[0].checked){
                $("#croomInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='LEDFlag']")[0].checked){
                $("#LEDInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
                $("#LEDInfo textarea").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='outsideFlag']")[0].checked){
                $("#outsideInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='boardFlag']")[0].checked){
                $("#boardMaterial").val(be.getContent());
                $("#boardInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='publicityFlag']")[0].checked){
                $("#publicityMaterials").val(pe.getContent());
                $("#publicityInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='ticketFlag']")[0].checked){
                $("#ticketInfo input").each(function(){
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
