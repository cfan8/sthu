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
<%@page import="cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity"%>
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
            <div id="requiredinfo">
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
            </div>
            <div><span class="tag">活动范围：</span><span class="value_select">
		    <select name="activityArea" id="activityArea">
			<option value="<%=StudentApplyOptionsEntity.AREA_INSCHOOL%>" selected="selected">仅校内</option>
			<option value="<%=StudentApplyOptionsEntity.AREA_OUTSCHOOL%>">涉校外</option>
			<option value="<%=StudentApplyOptionsEntity.AREA_OUTCOUNTRY%>">涉境外</option>
		    </select>  
		</span></div>
            <div id="outSchoolInfo" style="display: none">
                <div><span class="tag">校外人员情况：</span><span class="value"><input type="text" name="externalIntro"/></span></div>
                <div><span class="tag">校外合作单位：</span><span class="value"><input type="text" name="externalOrganizationIntro"/></span></div>
                <div><span class="tag">出校活动安全预案：</span><span class="value"><input type="text" name="securityPreparedness"/></span></div>
            </div>
            <div id="outCountryInfo" style="display: none">
                <div><span class="tag">境外人员情况：</span><span class="value"><input type="text" name="overseasIntro"/></span></div>
                <div><span class="tag">境外合作单位：</span><span class="value"><input type="text" name="overseasOrganizationIntro"/></span></div>
                <div><span class="tag">相关材料：</span><span class="value"><input type="text" name="overseasMaterial"/></span></div>
            </div>
            <hr />
            <div><span class="tag">教室申请：</span><span class="value">
                    <input type="radio" name="croomFlag" value="<%=StudentApplyOptionsEntity.CROOMFLAG_APPLY%>" onclick="changeCroomState(1)"/>是
                    <input type="radio" name="croomFlag" value="<%=StudentApplyOptionsEntity.CROOMFLAG_NOTAPPLY%>" onclick="changeCroomState(2)" checked="true"/>否
                </span>
            </div> 
            <div id="croomInfo" style="display:none">
                <div><span class="tag">教室类型要求：</span><span class="value_select">
		    <select name="croomType">
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_ORDINARY%>" selected="selected">普通教室</option>
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_MEDIA%>">多媒体教室</option>
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_CBUILDING_NORMAL%>">C楼普通教室</option>
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_CBUILDING_MEDIA%>">C楼多媒体教室</option>
		    </select>
		</span></div>
                <div><span class="tag">是否服从调剂：</span><span class="value">
                    <input type="radio" name="allowAdjust" value="<%=StudentApplyOptionsEntity.ALLOWADJUST_ACCEPT%>" checked="true"/>是
                    <input type="radio" name="allowAdjust" value="<%=StudentApplyOptionsEntity.ALLOWADJUST_REJECT%>"/>否
                </span></div>
                <div><span class="tag">教室容量：</span><span class="value"><input type="text" name="croomCapacity"/></span></div>
                <div><span class="tag">开始日期和时间:</span><span class="value"><input type="text" name="croomStartTime"/></span></div>
                <div><span class="tag">结束日期和时间:</span><span class="value"><input type="text" name="croomEndTime"/></span></div>
            </div>
            <hr />
            <div><span class="tag">电子屏申请：</span><span class="value">
                    <input type="radio" name="LEDFlag" value="<%=StudentApplyOptionsEntity.LEDFLAG_APPLY%>" onclick="changeLEDState(1)"/>是
                    <input type="radio" name="LEDFlag" value="<%=StudentApplyOptionsEntity.LEDFLAG_NOTAPPLY%>" checked="true" onclick="changeLEDState(2)"/>否
                </span>
            </div>
            <div id="LEDInfo" style="display: none">
                <div><span class="tag">电子屏显示内容：</span><span class="value"><input type="text" name="LEDContent"/></span></div>
                <div><span class="tag">开始日期和时间：</span><span class="value"><input type="text" name="LEDStartTime"/></span></div>
                <div><span class="tag">结束日期和时间：</span><span class="value"><input type="text" name="LEDEndTime"/></span></div>
            </div>
            <hr />
            <div><span class="tag">室外场地申请：</span><span class="value">
                    <input type="radio" name="outsideFlag" value="<%=StudentApplyOptionsEntity.OUTSIDEFLAG_APPLY%>" onclick="changeOutsideState(1)"/>是
                    <input type="radio" name="outsideFlag" value="<%=StudentApplyOptionsEntity.OUTSIDEFLAG_NOTAPPLY%>" checked="true" onclick="changeOutsideState(2)"/>否
                </span>
            </div>
            <div id="outsideInfo" style="display: none">
                <div><span class="tag">活动地点:</span><span class="value"><input type="text" name="activityLocation"/></span></div>
                <div><span class="tag">借用日期:</span><span class="value"><input type="text" name="outsideBorrowDate"/></span></div>
                <div><span class="tag">借用时间段:</span><span class="value"><input type="text" name="outsideTimePeriod"/></span></div>
            </div>
            <hr />
            <div><span class="tag">展板申请：</span><span class="value">
                    <input type="radio" name="boardFlag" value="<%=StudentApplyOptionsEntity.BOARDFLAG_APPLY%>" onclick="changeBoardState(1)"/>是
                    <input type="radio" name="boardFlag" value="<%=StudentApplyOptionsEntity.BOARDFLAG_NOTAPPLY%>" checked="true" onclick="changeBoardState(2)"/>否
                </span>
            </div>
            <div id="boardInfo" style="display: none">
                <div><span class="tag">活动材料（附件）:</span><span class="value"><input type="text" name="boardMaterial"/></span></div>
                <div><span class="tag">规格:</span><span class="value"><input type="text" name="boardSize"/></span></div>
                <div><span class="tag">开始日期和时间:</span><span class="value"><input type="text" name="BoardStartTime"/></span></div>
                <div><span class="tag">结束日期和时间:</span><span class="value"><input type="text" name="BoardEndTime"/></span></div>
            </div>
            <hr />
            <div><span class="tag">学生清华发布申请：</span><span class="value">
                    <input type="radio" name="publicityFlag" value="<%=StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY%>" onclick="changePublicityState(1)"/>是
                    <input type="radio" name="publicityFlag" value="<%=StudentApplyOptionsEntity.PUBLICITYFLAG_NOTAPPLY%>" checked="true" onclick="changePublicityState(2)"/>否
                </span>
            </div>
            <div id="publicityInfo" style="display: none">
                <div><span class="tag">宣传材料:</span><span class="value"><input type="text" name="publicityMaterials"/></span></div>
            </div>
            <hr />
            <div><span class="tag">门票抽签申请：</span><span class="value">
                    <input type="radio" name="ticketFlag" value="<%=StudentApplyOptionsEntity.TICKETFLAG_APPLY%>" onclick="changeTicketState(1)"/>是
                    <input type="radio" name="ticketFlag" value="<%=StudentApplyOptionsEntity.TICKETFLAG_NOTAPPLY%>" checked="true" onclick="changeTicketState(2)"/>否
                </span>
            </div>
            <div id="ticketInfo" style="display: none">
                <div><span class="tag">门票数目:</span><span class="value"><input type="text" name="ticketNum"/></span></div>
                <div><span class="tag">发票时间:</span><span class="value"><input type="text" name="ticketTime"/></span></div>
                <div><span class="tag">发票地点:</span><span class="value"><input type="text" name="ticketLocation"/></span></div>
            </div>
            <hr />
            <div><span class="tag">活动具体内容：</span>
		<div class="ueditorBlock"><script id="contentEditor" type="text/plain" style="width: 400px;">如内容较多请使用上传附件功能上传说明文档。</script><input type="hidden" name="activityContent" id="contentInput"/></div>
	    </div>
	    <div id="submitbutton"><a href="#" id="submitbtn">下一步</a></div>
	</form>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
	var ce = UE.getEditor('contentEditor');
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
                $("#boardInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='publicityFlag']")[0].checked){
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
