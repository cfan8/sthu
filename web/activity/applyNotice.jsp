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
		line-height: 30px;
		font-family: 黑体;
	    }
	    
	    .redtext
	    {
		color: red;
	    }
	    
	    .bluetext
	    {
		color: #0070C0;
	    }
	    
	    .boldtext
	    {
		font-weight: bold;
	    }
	    
	    #main li a:link, #main li a:visited
	    {
		text-decoration: none;
		color: #1C646C;
	    }
	    
	    #main li a:hover
	    {
		text-decoration: underline;
	    }
	    
	    #title .imp
	    {
		color: red;
		font-size: 20px;
	    }
	    
	</style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <div id="title"><span>申请注意事项</span><span class="imp">（请务必认真阅读注意事项后再开始申请流程）</span></div>
    <ol>
	<li>通过本系统，申请者可以借用<span class="redtext">教室</span>及包括<span class="redtext">展板</span>、<span class="redtext">LED电子屏</span>、<span class="redtext">室外场地</span>的校内活动资源。由于本系统近期仍处于试运行阶段，大型活动、涉境外活动无法在网络上进行申请，可下载相关表格向相关审批部门提交纸质申请表格。<span class="bluetext">（本系统不支持低版本内核的浏览器，请用IE9以上、Chrome、FireFox浏览器，360浏览器和搜狗浏览器请切换为高速模式）</span></li>
    <li>填写表格时，一般需要先填写【一级审批部门】。<span class="redtext boldtext">请注意</span>：（1）如果活动属于社团性质的，请选择【校团委社团部】；（2）如果属于院系活动，请选择所在院系：本科生请选择所在院系[本]为后缀的选项,研究生及其它申请者请选择[研]为后缀的选项；（3）如果属于校团委各部门、艺术团、代表队、校学生会、研团研会，请选择相应的审批部门。</li>
    <li>为保证提交的申请能够及时被批准，请务必在填写完成申请表后，点击【确认申请】按钮，申请者点击【确认申请】后申请才会进入相关处理流程。</li>
    <li>提交处理后，申请者可以随时点击【我的学清】查看发起的申请状态、审批进度及审批结果。如果活动被驳回，请根据驳回意见进行修改，重新申请。</li>
    <li>申请者需严格按照我校课外活动管理的相关规定进行申请并开展活动，凡违反相关规定的违纪行为，主管部门可视情节轻重给予相应违纪处罚。</li>
    <li>申请表格中所有列出的区域均为必填项，请认真填写；申请系统允许上传的附件类型为：Office文件、PDF文件、图片、压缩文件，单个文件最大10M。</li>
    <li>如果对借用教室及活动资源申请仍有疑问，请联系校团委办公室咨询电话：62786244，62797505，办公时间每周一至周五，上午8:00-12:00，下午13:00-17:00。</li>
    <li>线下申请相关表格下载：<a href="/download/dxhd.doc" target="_blank">清华大学学生大型活动审批表</a>、<a href="/download/jsjy.doc" target="_blank">清华大学学生活动教室借用审批表</a>、<a href="/download/jsjy_sjw.doc" target="_blank">清华大学学生活动教室借用审批表-涉境外活动</a>、<a href="/download/twyz.docx" target="_blank">团委印章用印申请单</a>。</li>
    </ol>
    <p id="buttonP"><a class="button" href="/activity/applyClassroom.do">申请借用教室</a><a class="button" href="/outdoor/applyActivity.do">申请活动资源</a><a class="button" href="/studentActivity/applyStudentActivity.do" style="display:none;">申请学生活动(测试)</a></p>
    <%@include file="/templates/general_footer.jsp" %>
</html>
