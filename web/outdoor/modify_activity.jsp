<%-- 
    Document   : modify_activity
    Created on : 2013-2-22, 15:37:50
    Author     : luzhen
--%>
<%@page import="java.util.Date" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.edu.tsinghua.sthu.entity.ActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.constant.IdentityMapping"%>
<%@page import="cn.edu.tsinghua.sthu.action.outdoor.ShowApplyActivityPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.outdoor.ShowApplyActivityPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ShowApplyActivityPageMessage message = Util.getMessage(ShowApplyActivityPageAction.class);
    ActivityApplyEntity entity = message.getApplyEntity();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/css/anytime.css" />
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_user.js"></script>
	<script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
        <script type="text/javascript" charset="utf-8" src="/js/jquery.js"></script>
        <script type="text/javascript" charset="utf-8" src="/js/jquery-migrate.js"></script>
        <script  type="text/javascript" charset="utf-8" src="/js/anytime.js"></script>
        <link rel='stylesheet' href='/css/classroom/status.css' />
        <link rel='stylesheet' href='/css/classroom/apply.css' />
        <style type="text/css">
	    .AnyTime-pkr { z-index: 9999 }
        </style>
        <title>申请活动</title>
    </head>

    <%@include file="/templates/general_header.jsp" %>
    <span id="position">您当前的位置：活动资源申请</span>
    <div class="processtype" id="processtype0"></div>
    <div id="formdiv">
	<form action="submitActivityApply.do" method="post" id="submitf">
	    <div>
		<span class="tag">申请活动类型：</span>
		<span class="value"><%=entity.getApplyTypeText()%><input type="hidden" name="applyType" value="<%=entity.getApplyType()%>" /></span>
	    </div>
	    <div>
		<span class="tag">活动名称：</span>
		<span class="value"><input type="text" name="activityName" value="<%=entity.getActivityName()%>"/>
		    <input type="hidden" name="applyId" value="<%=entity.getID()%>"></span></div>
	    <div>
		<span class="tag">活动说明：</span>
		<div class="ueditorBlock">
		    <script id="contentEditor" type="text/plain"><%=entity.getActivityContent()%></script>
		</div>
		<input type="hidden" name="activityContent" id="activityContentInput" />
	    </div>
	    <% if (entity.getApplyType() == ActivityApplyEntity.APPLY_TYPE_LED) {%>
            <div id="LEDContent"><span class="tag">电子屏显示内容：</span><span class="value"><input type="text" name="LEDContent" value="<%=entity.getLEDContent()%>"/></span></div>
		    <% } else {%>
            <div id="activityLocation">
		<span class="tag">活动地点：</span>
		<span class="value"><input type="text" name="activityLocation" value="<%=entity.getActivityLocation()%>"/></span>
	    </div>
            <div id="activityMaterial"><span class="tag">活动材料：</span>
		<div class="ueditorBlock">
		    <script id="contentEditor2" type="text/plain"><%=entity.getActivityMaterial()%></script>
		</div>
		<input type="hidden" name="activityMaterial" id="activityMaterialInput" />
	    </div>
	    <% }%>
	    <div>
		<span class="tag">开始时间：</span><span class="value"><input type="text" id="field1" name="startTime" value="<%= df.format(entity.getStartTime())%>"/></span>
            </div>
	    <div>
		<span class="tag">结束时间：</span><span class="value"><input type="text" id="field2"  name="endTime" value="<%= df.format(entity.getEndTime())%>"/> </span>
	    </div>
	    <div><span class="tag">主办、协办单位：</span><span class="value"><input type="text" name="organizerName" value="<%=entity.getOrganizerName()%>"/></span></div>
	    <div><span class="tag">申请单位：</span><span class="value"><input type="text" name="applicatantType" value="<%=entity.getApplicatantType()%>"/></span></div>
	    <div><span class="tag">申请人：</span><span class="value"><input type="text" name="applicatantName" value="<%=entity.getActivityName()%>"/></span></div>
	    <div><span class="tag">联系电话：</span><span class="value"><input type="text" name="applicatantCell" value="<%=entity.getApplicatantCell()%>"/></span></div>
	    <div><span class="tag">电子邮箱：</span><span class="value"><input type="text" name="applicatantEmail" value="<%=entity.getApplicatantEmail()%>"/></span></div>
	    <div><span class="tag">请选择审批通道：</span><span class="value">
		    <select name="applyPath">
			<% for (int i = 0; i < IdentityMapping.names.length; i++) {%>
			<option value="<%=i%>" <%=i == entity.getApplyPath() ? "selected=\"selected\"" : ""%> ><%=IdentityMapping.names[i]%></option>
			<% }%>
		    </select>
		</span></div>
	    <div id="submitbutton"><a href="#" id="submitbtn">下一步</a></div>
	</form>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
                  
	var ce = UE.getEditor('contentEditor');
	<% if (entity.getApplyType() != ActivityApplyEntity.APPLY_TYPE_LED) {%>
	    var ce2 = UE.getEditor('contentEditor2');  
	    $("#submitbtn").click(function(){
		$("#activityContentInput").val(ce.getContent());
		$("#activityMaterialInput").val(ce2.getContent());
		$("#submitf").submit();
		return false;
	    });
	<% } else {%>
	    
	    $("#submitbtn").click(function(){
		$("#activityContentInput").val(ce.getContent());
		$("#submitf").submit();
		return false;
	    });
	<% }%>
		    
	    AnyTime.picker( "field1",
	    {format: "%Y-%m-%d %H:%i",
		formatUtcOffset: "%: (%@)"} );
	    AnyTime.picker( "field2",
	    {format: "%Y-%m-%d %H:%i",
		formatUtcOffset: "%: (%@)"} );
    </script>

</html>
