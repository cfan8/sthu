<%-- 
    Document   : ticketNotice
    Created on : 2013-3-3, 17:07:37
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>申请注意事项</title>
	<style>
	    .button
	    {
		display: inline-block;
		width: 180px;
		height: 26px;
		background-color: #ff7900;
		text-align: center;
		margin-right: 20px;
	    }

	    .button:link, .button:visited
	    {
		text-decoration: none;
		color: white;
		padding-top: 10.5px;
		font-size: 14.67px;
		letter-spacing: 4px;
	    }
	    
	    #main
	    {
		width: 700px;
	    }
	    
	    #container
	    {
		padding-top: 10px;
	    }
	    
	    #title
	    {
		font-family: 黑体;
		font-size: 26px;
	    }
	    
	    #main li{
		margin-top: 12px;
		line-height: 24px;
	    }
	</style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <div id="title">申请注意事项</div>
    <ol>
    <li>您可以通过本系统申请教室借用或者申请活动资源（展板/LED/室外活动宣传），目前本系统仍处于试运行阶段，某些无法在网络上进行的环节仍然需要您提交纸质申请表格。</li>
    <li>您在填写表格时，通常需要填写“申请通道”。如果您的活动属于社团性质的，请选择“校团委社团部”；否则，请选择您所在的院系：本科生请选择“[本]”,研究生及其它请选择“[研]”。</li>
    <li>您的申请只有在您确认后才会被开始处理。为了保证您的申请能够及时、有效的被批准，请您在填写完成申请表后，务必点击确认申请按钮。</li>
    <li>您可以在我的学清中查看所有您发起的申请和审批结果。</li>
    </ol>
    <p id="buttonP"><a class="button" href="/activity/applyClassroom.do">申请借用教室</a><a class="button" href="/outdoor/applyActivity.do">申请活动资源</a></p>
    <%@include file="/templates/general_footer.jsp" %>
</html>
