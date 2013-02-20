<%-- 
    Document   : create_activity
    Created on : 2013-2-18, 19:02:36
    Author     : luzhen
--%>

<%@page import="cn.edu.tsinghua.sthu.entity.ActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.constant.IdentityMapping"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/css/anytime.css" />
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_user.js"></script>
	<script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
        <script type="text/javascript" charset="utf-8" src="/js/jquery.js"></script>
        <script type="text/javascript" charset="utf-8" src="/js/jquery-migrate.js"></script>
        <script  type="text/javascript" charset="utf-8" src="/js/anytime.js"></script>
        <style type="text/css">
        .AnyTime-pkr { z-index: 9999 }
        </style>
        <title>申请活动</title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <form action="submitActivityApply.do" method="post">
        <div><span class="tag">申请活动类型：</span><span class="value">
		<select name="applyType" id="applyType">
		    <option value="<%=ActivityApplyEntity.APPLY_TYPE_LED%>">电子屏申请</option>
		    <option value="<%=ActivityApplyEntity.APPLY_TYPE_OUTDOOR%>">室外活动申请</option>
		    <option value="<%=ActivityApplyEntity.APPLY_TYPE_BOARD%>">展板申请</option>
		</select>
        </span></div>
        <div><span class="tag">活动名称：</span><span class="value"><input type="text" name="activityName"/>
            <input type="hidden" name="applyId" value="-1"></span></div>
	<div><span class="tag">活动说明：</span>
            <div class="ueditorBlock"><script id="contentEditor" type="text/plain" name="activityContent">如内容较多请使用上传附件功能上传说明文档。</script></div></span>
        </div>
        <div id="LEDContent"><span class="tag">电子屏显示内容：</span><span class="value"><input type="text" name="LEDContent"/></span></div>
        <div id="activityLocation" hidden="true"><span class="tag">活动地点：</span><span class="value"><input type="text" name="activityLocation"/></span></div>
        <div id="activityMaterial" hidden="true"><span class="tag">活动材料：</span>
            <div class="ueditorBlock"><script id="contentEditor2" type="text/plain" name="activityMaterial">如内容较多请使用上传附件功能上传说明文档。</script></div></span>
        </div>
        <div>
            <span class="tag">开始时间：</span>
            <span class="value"><input type="text" id="field1" name="startTime"/></span>
            </div>
        <div>
            <span class="tag">结束时间：</span>
            <span class="value"><input type="text" id="field2"  name="endTime"/> </span>
        </div>
        <div><span class="tag">主办、协办单位：</span><span class="value"><input type="text" name="organizerName"/></span></div>
        <div><span class="tag">申请单位：</span><span class="value"><input type="text" name="applicatantType"/></span></div>
        <div><span class="tag">申请人：</span><span class="value"><input type="text" name="applicatantName"/></span></div>
        <div><span class="tag">联系电话：</span><span class="value"><input type="text" name="applicatantCell"/></span></div>
        <div><span class="tag">电子邮箱：</span><span class="value"><input type="text" name="applicatantEmail"/></span></div>
	<div><span class="tag">请选择审批通道：</span><span class="value">
                <select name="applyPath">
		    <% for (int i = 0; i < IdentityMapping.names.length; i++) {%>
		    <option value="<%=i%>" <%=i == 0 ? "selected=\"selected\"" : ""%> ><%=IdentityMapping.names[i]%></option>
		    <% }%>
		</select>
        </span></div>
        <div><input type="submit" value="保存"/></div>
    </form>
    <%@include file="/templates/general_footer.jsp" %>
        <script type="text/javascript">
                  
            var ce = UE.getEditor('contentEditor');
            var ce2 = UE.getEditor('contentEditor2');              
	$("#applyType").change(function(){
	    if ($("#applyType").val() == <%=ActivityApplyEntity.APPLY_TYPE_LED%>){
		$("#LEDContent").show();
                $("#activityLocation").hide();
                $("#activityMaterial").hide();
	    }
	    else
	    {
                $("#activityLocation").show();
                $("#activityMaterial").show();
		$("#LEDContent").hide();
	    }
	});
    </script>
    <script type="text/javascript">
            AnyTime.picker( "field1",
              {format: "%Y-%m-%d %H:%i",
        formatUtcOffset: "%: (%@)"} );
            AnyTime.picker( "field2",
              {format: "%Y-%m-%d %H:%i",
        formatUtcOffset: "%: (%@)"} );
     </script>

</html>