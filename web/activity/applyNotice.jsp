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
            .subtitle{
                font-family: 黑体;
		font-size: 20px;
                padding:20px;
                padding-bottom: 10px;
            }
            .normaltext{
                padding-left: 60px;
                text-indent: 2em;
                line-height: 30px;
                
            }
            .normaltext2{
                padding-left: 20px;
                text-indent: 2em;
                line-height: 30px;
                
            }
            .para{
                text-indent: 2em;
                margin-top: 0;
                margin-bottom: 0;
            }
	    #main li{
		margin-top: 12px;
		line-height: 30px;
		font-family: 黑体;
                text-indent: 0;
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
    <div class="subtitle">一、申请系统介绍</div>
    <div class="normaltext">
    通过本系统，申请者可以借用<span class="redtext boldtext">教室</span>及包括<span class="redtext boldtext">展板</span>、<span class="redtext boldtext">LED电子屏</span>、<span class="redtext boldtext">室外场地</span>的校内活动资源。由于本系统近期仍处于试运行阶段，大型活动、涉境外活动无法在网络上进行申请，可下载相关表格向相关审批部门提交纸质申请表格。<span class="bluetext">（本系统不支持低版本内核的浏览器，请用IE9以上、Chrome、FireFox浏览器，360浏览器和搜狗浏览器请切换为高速模式）</span>
    </div>
    <div class="subtitle">二、申请流程</div>
    <div class="normaltext2">
        <ol>
            <li>
                提交申请。
                <p class="para">
                    申请表格中所有列出的区域均为必填项，请认真填写；申请系统允许上传的附件类型为：Office文件、PDF文件、图片、压缩文件，单个文件最大10M。
                </p>
                <p class="para">
                    其中【一级审批部门】的选择请按照<span class="redtext boldtext">以下原则</span>：（1）如果活动属于社团性质的，请选择【校团委社团部】；（2）如果属于院系活动，请选择所在院系：本科生请选择所在院系[本]为后缀的选项,研究生及其它申请者请选择[研]为后缀的选项；（3）如果属于校团委各部门、艺术团、代表队、校学生会、研团研会，请选择相应的审批部门。
                </p>
                <p class="para">
                    需要特别注意的是，【展板】只能申请<span class="redtext boldtext">一块</span>，超过一块请申请<span class="redtext boldtext">大型活动</span>（表格见下方链接，打印纸质表），交主办单位审批签章后，送到校团委办公室。
                </p>
                <p class="para">
                    申请展板必须上传<span class="redtext boldtext">展板图片</span>，图中需体现<span class="redtext boldtext">主办单位</span>，若含赞助信息（如品牌名、商标等）必须上传<span class="redtext boldtext">赞助协议</span>（电子版、扫描版、照片均可）。
                </p>
                <p class="para">
                    为避免展板阻碍交通、遮挡视线，现学校各部门研究决定以下区域不可摆放展板：
                </p>
                <p class="para">
                <img src="/images/noticeimg.jpg" width="600px"/>
                </p>
                <p class="para">
                    填写完整后点击【确认申请】按钮。
                </p>
            </li>
            <li>
                查看进度和结果。
                <p class="para">
                    提交处理后，申请者可以随时点击【我的学清】查看发起的申请状态、审批进度及审批结果。请仔细查看各级审批单位的<span class="redtext boldtext">审批意见</span>，根据提示到相应地点办理后续事项。
                </p>
                <p class="para">
                    注意：活动信息为<span class="redtext boldtext">逐级可见</span>，无法跨级审批，即若一级审批部门未通过，则后续部门无法看到该活动。若有必要请自行提醒一级审批部门负责人及时审批。
                </p>
            </li>
            <li>
                如果活动被驳回，请根据驳回意见进行修改，重新<span class="redtext boldtext">确认申请</span>。（可在原申请上改动，无需新建申请）        
            </li>
        </ol>
    </div>
    <div class="subtitle">三、其他说明</div>
    <div class="normaltext2">
        <ol>
            <li>申请者需严格按照我校课外活动管理的相关规定进行申请并开展活动，凡违反相关规定的违纪行为，主管部门可视情节轻重给予相应违纪处罚。
            </li>
            <li>如果对借用教室及活动资源申请仍有疑问，请联系校团委办公室。咨询电话：62786244，62797505，办公时间：周一至周五，上午8:00-12:00，下午13:00-17:00。
            </li>
            <li>线下申请相关表格下载：<a href="/download/dxhd.doc" target="_blank">清华大学学生大型活动审批表</a>、<a href="/download/jsjy.doc" target="_blank">清华大学学生活动教室借用审批表</a>、<a href="/download/jsjy_sjw.doc" target="_blank">清华大学学生活动教室借用审批表-涉境外活动</a>、<a href="/download/twyz.docx" target="_blank">团委印章用印申请单</a>。</li>
    
        </ol>
    </div>
    <div style="margin-left:40px;">
        <p id="buttonP"><a class="button" href="/activity/applyClassroom.do">申请借用教室</a><a class="button" href="/outdoor/applyActivity.do">申请活动资源</a><a class="button" style="width:230px;" href="/studentActivity/applyStudentActivity.do">申请学生活动(试运行)</a></p>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    
</html>
