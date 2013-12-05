<%-- 
    Document   : show_student_activity_apply
    Created on : 2013-7-23, 13:20:51
    Author     : Wang Silun
--%>
<%@page import="cn.edu.tsinghua.sthu.constant.OtherMapping"%>
<%@page import="cn.edu.tsinghua.sthu.constant.ResourceMapping"%>
<%@page import="cn.edu.tsinghua.sthu.constant.AllocateMapping"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowStudentActivityApplyAction"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="cn.edu.tsinghua.sthu.constant.IdentityMapping"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityApplyMessage"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity"%>
<%@page import="cn.edu.tsinghua.sthu.entity.CommentEntity" %>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowApplyStudentActivityPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<% ShowStudentActivityApplyMessage message = Util.getMessage(ShowStudentActivityApplyAction.class);
    StudentActivityApplyEntity entity = message.getApplyEntity();
    StudentApplyOptionsEntity options = message.getOptionsEntity();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    List<CommentEntity> comments = entity.getComments();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>显示活动申请</title>
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_tiny.js"></script>
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
        
        <link rel="stylesheet" type="text/css" href="/uploadify/uploadify.css"/>
        <link rel='stylesheet' type='text/css' href='/css/classroom/status.css' />
        <style>
            #tablediv{
                width: 600px;
                margin: 10px auto 10px auto;
            }

            .tag
            {
                width: 150px;
            }

            .blockvalue{
                width: 600px;
            }
            
            table{
              table-layout: fixed;  
            }
            
            td{
                word-wrap:break-word;
                word-break: break-all;
            }
            
            tr
            {
                border-top-width: 1px;
                border-top-style: solid;
            }

            p{
                margin: 16px 0px; 
            }


            #confirmDiv,#cancelDiv, #digestDiv
            {
                width: 780px;
                margin: 20px auto 0px auto;
                text-align: center;
            }

            #confirmDiv a, #cancelDiv a, #digestDiv a, #tableDiv a
            {
                display: inline-block;
                width: 180px;
                height: 26px;
                background-color: #ff7900;
                text-align: center;
            }

            #confirmDiv a:link, #confirmDiv a:visited, #cancelDiv a:link, #cancelDiv a:visited, #digestDiv a:link, #digestDiv a:visited, #tableDiv a:link, #tableDiv a:visited
            {
                text-decoration: none;
                color: white;
                padding-top: 10.5px;
                font-size: 14.67px;
                letter-spacing: 4px;
            }
            
            #commentBlock
            {
                width: 600px;
                margin: 0 auto;
            }

            #commentBlock p{
                margin: 0px;
            }

            #showControl
            {
                width: 780px;
                height: 22px;
                font-size: 13.34px;
                font-family: 微软雅黑;
            }

            #showControl div
            {
                float: left;
                height: 22px;
                text-align: center;
            }

            #showControl #currentcomment
            {
                color: #404040;
                cursor: pointer;
                width: 100px;
                border-style: solid;
                border-color: #d0cfd0 #d0cfd0 white #d0cfd0;
                border-width: 1px;
            }

            #showControl #oldcomment
            {
                color: #8f8f8f;
                cursor:  pointer;
                width: 100px;
                border-style: solid;
                border-color: white white #d0cfd0 white;
                border-width: 1px 1px 1px 0px;
            }

            #showControl #borderDiv
            {
                width: 497px;
                border-style: solid;
                border-color: white white #d0cfd0 white;
                border-width: 1px 1px 1px 0px;
            }

            .commentDiv
            {
                width: 578px;
                margin: 0px auto;
                border-style: solid;
                border-width: 0px 1px 1px 1px;
                border-color: #d0cfd0;
                float: left;
                padding: 10px 10px 10px 10px;
            }

            #oldCommentDiv
            {
                display: none;
            }

            .commenttitle
            {
                float: left;
                width: 195px;
                padding-left: 5px;
                text-align: left;
            }

            .commentcontent
            {
                width: 370px;
                padding-right: 6px;
                float: right;
            }

            .commentitem
            {
                margin-bottom: 10px;
                font-size: 14.67px;
                color: #404040;
                padding-top: 2px;
            }
            .commentitem:last-child
            {
                margin-bottom: 0px;
            }

            .comment2147483647
            {
                background-color: #d3fac2;
            }

            .comment-1
            {
                background-color: #efc9b8;
            }

            #approveDiv
            {	
                width: 600px;
                margin: 0 auto;
            }

            #approveSubmitDiv
            {
                width: 600px;
                margin: 20px auto 0px;
                text-align: center;
            }

            #approveSubmitDiv a
            {
                display: inline-block;
                width: 180px;
                height: 26px;
                background-color: #ff7900;
                text-align: center;
            }

            #approveSubmitDiv a:link, #approveSubmitDiv a:visited
            {
                text-decoration: none;
                color: white;
                padding-top: 10.5px;
                font-size: 14.67px;
                letter-spacing: 4px;
            }
            
            #publishDiv
            {
                width: 600px;
                margin: 0 auto;
                margin-top:20px;
            }
            
            #publishButton a
            {
                display: inline-block;
                width: 180px;
                height: 26px;
                background-color: #ff7900;
                text-align: center;
                margin-top:10px;
            }

            #publishButton a:link, #confirmDiv a:visited, #publishDiv a:visited
            {
                text-decoration: none;
                color: white;
                padding-top: 10.5px;
                font-size: 14.67px;
                letter-spacing: 4px;
            }
            
            #validDiv
            {
                width: 600px;
                margin: 30px auto;
                font-size: 32px;
                text-align: center;
                font-weight: bold;
            }
            #modifyDiv
            {
                width: 600px;
                margin: 0 auto;
                margin-top:20px;
            }
            #modifyDiv a{
                font-family: 黑体;
                font-size: 18px;
                color:#3A5FCD;
                text-decoration:none;
            }
            
        </style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <div id="position" class="noprint">您当前的位置：活动申请</div>
    <%if(entity.isValid()){%><div class="processtype noprint" id="processtype<%=entity.getApplyStatus()%>"></div>
    <%if(message.isShowPublishEdit()){%>
    <div id="publishDiv">学生清华发布申请：
        <form method="post" action="savePublishMaterial.do?applyId=<%=entity.getID()%>" id="publishForm">
        <div style="margin-top:10px"><span class="tag">宣传图片：</span>
                
                    <img src="<%=options.getPublicityImg()%>" width="80px" height="60px" id="main_img"/>
                    <br/>
                    上传图片（400*300）：<div class="upbtn" style="width:500px;"><input type="button" id="upbtn_main"/></div>
                    <input type="hidden" name="mainImg" id="mainImg" value="<%=options.getPublicityImg()%>"/>
                
        </div>
        <div style="margin-top:10px"><span class="tag">宣传材料(审批同意后请提交以交给成才中心审批发布，修改后请务必先保存后提交):</span><div class="ueditorBlock"><script id="publicityEditor" type="text/plain" style="width: 400px;margin-top:10px"><%=entity.getOption().getPublicityMaterials()%></script><input type="hidden" name="publicityMaterials" id="publicityMaterials"/></div></div>
        <div id="publishButton">
        <a href="#" class="button" id="savePublish">保存</a>
        <a href="showStudentActivityDetail.do?activityID=<%=entity.getID()%>" target="_blank" class="button">预览</a>
        <a href="#" class="button" id="submitPublishEdit">提交</a>
        </div>
        </form>
        <script type="text/javascript" charset="utf-8" src="/uploadify/jquery.uploadify.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_user.js"></script>
        <script type="text/javascript">
            $("#upbtn_main").uploadify({
                'multi'    : false,
                'height':'35px',
                'width':'500px',
                'buttonText' : '上传图片',
                'fileSizeLimit' : '4000KB',
                'fileTypeDesc' : '图片文件',
                'fileTypeExts' : '*.gif; *.jpg; *.png',
                'swf'      : '/uploadify/uploadify.swf',
                'uploader' : '/ueditor/jsp/imageUp.jsp',
                'onUploadSuccess' : function(file, data, response) {
                    json=eval('('+data+')');
                    $("#main_img").attr("src","/"+json.url);
                    $("#mainImg").val("/"+json.url);
                }
            });
            var pe = UE.getEditor('publicityEditor');
             $("#savePublish").click(function() {
                $("#publicityMaterials").val(pe.getContent());
                $("#publishForm").submit();
                return false;
            });
            $("#submitPublishEdit").click(function() {
                $("#publicityMaterials").val(pe.getContent());
                if (confirm("是否确认提交？") == true)
                {
                    self.location.href = "confirmPublishMaterial.do?applyId=<%=entity.getID()%>";
                }
                return false;
            });
        </script>
        <hr />
    </div>
    <%}}else{%>
    <div id="validDiv">该申请已被取消！</div>
    <hr />
    <%}%>
    <%if(message.isShowModify()){%>
        <div id="modifyDiv">
            <a href="applyStudentActivity.do?applyId=<%=entity.getID()%>" id="modifyApply">修改申请材料</a>
        </div>
    <%}%>
    <div class="onlyprint" style="text-align:center; font-family: 黑体; font-size: 30px;">学生活动审批表</div>
    <div class="onlyprint" style="text-align:center;" id="printurl"></div>
    <div id="tablediv">
        <table>
            <tr><td class="tag">活动主题：</td><td class="value"><%=entity.getActivityTheme()%></td></tr>
            <tr><td class="tag">活动类型：</td><td class="value"><%=entity.getUsageComment()%></td></tr>
            <tr><td class="tag">活动参与人数：</td><td class="value"><%=entity.getParticipantsNumber()%></td></tr>
            <tr><td class="tag">活动对象：</td><td class="value"><%=entity.getActivityRangeText() %></td></tr>
            <tr><td class="tag">主办方（者）名称：</td><td class="value"><%=entity.getOrganizerName()%></td></tr>
            <tr><td class="tag">协办方（者）名称：</td><td class="value"><%=entity.getAssociateOrganizerName() %></td></tr>
            <tr><td class="tag">申请人：</td><td class="value"><%=entity.getApplicantName()%></td></tr>
            <tr><td class="tag">申请人联系电话：</td><td class="value"><%=entity.getApplicantCell()%></td></tr>
            <tr><td class="tag">负责人：</td><td class="value"><%=entity.getManagerName()%></td></tr>
            <tr><td class="tag">负责人联系电话：</td><td class="value"><%=entity.getManagerCell()%></td></tr>
            <tr><td class="tag">活动日期：</td><td class="value"><%=entity.getActivityDate()%></td></tr>
            <tr><td class="tag">活动时间：</td><td class="value"><%=entity.getTimePeriod()%></td></tr>
            <tr><td class="blocktag" colspan="2">活动具体内容和相关材料：</td></tr>
            <tr><td class="blockvalue" colspan="2"><%=entity.getActivityContent()%></td></tr>
            <%if(options.getExternalFlag() == StudentApplyOptionsEntity.EXTERNAL_APPLY) {%>
            <tr><td class="tag" colspan="2" style="border-top:1px solid #BBB; padding-top:10px">涉校外:</td></tr>
            <tr><td class="tag">校外人员情况:</td><td class="value"><%=options.getExternalIntro()%></td></tr>
            <tr><td class="tag">校外合作单位:</td><td class="value"><%=options.getExternalOrganizationIntro()%></td></tr>
            <tr><td class="tag">出校活动安全预案:</td><td class="value"><%=options.getSecurityPreparedness()%></td></tr>
            <% }%>
            <%if(options.getOverseasFlag() == StudentApplyOptionsEntity.OVERSEAS_APPLY)  {%>
            <tr><td class="tag" colspan="2" style="border-top:1px solid #BBB; padding-top:10px">涉境外:</td></tr>
            <tr><td class="tag">境外人员情况:</td><td class="value"><%=options.getOverseasIntro()%></td></tr>
            <tr><td class="tag">境外合作单位:</td><td class="value"><%=options.getOverseasOrganizationIntro()%></td></tr>
            <tr><td class="tag">相关材料:</td><td class="value"><%=options.getOverseasMaterial()%></td></tr>
            <% }%>
            <%if(options.getCroomFlag() == 1) {%>
            <tr><td class="tag" colspan="2" style="border-top:1px solid #BBB; padding-top:10px">教室申请:</td></tr>
            <tr><td class="tag">教室类型要求：</td><td class="value"><%=options.getCroomTypeText()%></td></tr>
            <tr><td class="tag">是否服从调剂：</td><td class="value"><%=options.getAllowAdjustText()%></td></tr>
            <tr><td class="tag">教室容量：</td><td class="value"><%=options.getCroomCapacity()%></td></tr>
            <tr><td class="tag">借用周次:</td><td class="value"><%=options.getCroomWeek()%></td></tr>
            <tr><td class="tag">借用具体时间:</td><td class="value"><%=options.getCroomClassTime()%></td></tr>
            <%}%>
            <%if(options.getLEDFlag() == 1) {%>
            <tr><td class="tag" colspan="2" style="border-top:1px solid #BBB; padding-top:10px">电子屏申请:</td></tr>
            <tr><td class="tag">电子屏显示内容：</td><td class="value"><%=options.getLEDContent()%></td></tr>
            <tr><td class="tag">开始日期和时间:</td><td class="value"><%=options.getLEDStartTime()%></td></tr>
            <tr><td class="tag">结束日期和时间:</td><td class="value"><%=options.getLEDEndTime()%></td></tr>
            <%}%>
            <%if(options.getOutsideFlag() == 1) {%>
            <tr><td class="tag" colspan="2" style="border-top:1px solid #BBB; padding-top:10px">室外场地申请:</td></tr>
            <tr><td class="tag">活动地点:</td><td class="value"><%=options.getActivityLocationText()%></td></tr>
            <tr><td class="tag">借用日期:</td><td class="value"><%=options.getOutsideBorrowDate()%></td></tr>
            <tr><td class="tag">借用时间段:</td><td class="value"><%=options.getOutsideTimePeriod()%></td></tr>
            <%}%>
            <%if(options.getBoardFlag() == 1) {%>
            <tr><td class="tag" colspan="2" style="border-top:1px solid #BBB; padding-top:10px">展板申请:</td></tr>
            <tr><td class="tag">活动材料（附件）:</td><td class="value"><%=options.getBoardMaterial()%></td></tr>
            <tr><td class="tag">规格:</td><td class="value"><%=options.getBoardSizeText()%></td></tr>
            <tr><td class="tag">块数:</td><td class="value"><%=options.getBoardNum()%></td></tr>
            <tr><td class="tag">开始日期和时间:</td><td class="value"><%=options.getBoardStartTime()%></td></tr>
            <tr><td class="tag">结束日期和时间:</td><td class="value"><%=options.getBoardEndTime()%></td></tr>
            <%}%>
            <%if(options.getBulletinFlag() == 1) {%>
            <tr><td class="tag" colspan="2" style="border-top:1px solid #BBB; padding-top:10px">宣传栏申请：</td></tr>
            <tr><td class="tag">申请区域：</td><td class="value"><%=options.getBulletinAreaText()%></td></tr>
            <tr><td class="tag">申请展板编号</td><td class="value"><%=options.getBulletinIndex()%></td></tr>
            <tr><td class="tag">使用原因：</td><td class="value"><%=options.getBulletinApplyReason()%></td></tr>
            <tr><td class="tag">宣传栏海报：</td><td class="value"><img src="<%=options.getBulletinPoster()%>" width="80px" height="60px"></td></tr>
            <%}%>
            <%if(options.getPublicityFlag() == 1) {%>
            <tr><td class="tag" colspan="2" style="border-top:1px solid #BBB; padding-top:10px">学生清华发布申请:</td></tr>
            <tr><td class="tag">宣传图片:</td><td class="value"><img src="<%=options.getPublicityImg()%>" width="80px" height="60px"></td></tr>
            <tr><td class="tag">宣传材料:</td><td class="value"><%=options.getPublicityMaterials()%></td></tr>
            <tr><td class="tag"></td><td><a class="button" href="showStudentActivityDetail.do?activityID=<%=entity.getID()%>" target="_blank">预览</a></td></tr>
            <%}%>
            <%if(options.getTicketFlag() == 1) {%>
            <tr><td class="tag" colspan="2" style="border-top:1px solid #BBB; padding-top:10px">门票抽签申请:</td></tr>
            <tr><td class="tag">门票数目:</td><td class="value"><%=options.getTicketNum()%></td></tr>
            <tr><td class="tag">抽票日期:</td><td class="value"><%=options.getTicketRandomDate()%></td></tr>
            <tr><td class="tag">发票时间:</td><td class="value"><%=options.getTicketTime()%></td></tr>
            <tr><td class="tag">发票地点:</td><td class="value"><%=options.getTicketLocation()%></td></tr>
            <%if(message.getShowTicket() == 1){%>
                <tr><td class="tag"></td><td><a class="button" href="randomTickets.do?activityId=<%=entity.getID()%>">随机抽票</a></td></tr>
            <%}else if(message.getShowTicket() == 2){%>
                <tr><td class="tag"></td><td><a class="button" href="showTicketRandomResult.do?activityID=<%=entity.getID()%>" target="_blank">查看抽票结果</a></td></tr>
            <%}%>
            <%}%>
            <tr><td colspan="2"><hr/></td></tr>
            <tr><td class="tag applyStatus">当前申请状态：</td><td class="value">
		    <p>申请状态：<%=entity.getApplyStatusText()%></p>
		    <p>院系学生组（团委）审批状态：<%=entity.getIdentityStatusText()%></p>
		    <p>校团委审批状态：<%=entity.getGroupStatusText()%></p>
                    <p><%=message.getOtherApproveString()%></p>
                    <%if(entity.getPublishStatus() != StudentActivityApplyEntity.PUBLISH_STATUS_AWAIT){%>
                        <p>成才中心审批状态：<%=entity.getPublishStatusText()%></p>
                    <%}%>
		</td></tr>
        </table>
    </div>
    <%if(entity.isValid()){%>       
    <div id="commentBlock">
        <div id="showControl">
            <div id="currentcomment">当前的审批消息</div><div id="borderDiv" class="noprint"></div>
        </div>
        <div id="commentShow" >
            <div class="commentDiv toprint" id="currentCommentDiv">
		<% for (int i = 0; i < comments.size(); i++) {
			CommentEntity comment = comments.get(i);
			if (comment.getCommentStatus() == CommentEntity.COMMENT_STATUS_NEW) {%>
		<div class="commentitem comment<%=comment.getCommentType()%>">
		    <div class="commenttitle">
			<%=comment.getNickname()%> @ <%=new SimpleDateFormat("yyyy-MM-dd").format(comment.getPubDate())%> :
		    </div>
		    <div class="commentcontent">
			<%=comment.getComment()%>
		    </div>
		    <div style="clear:both;"></div>
		</div>
		<% }
			}%>
	    </div>
            <div class="commentDiv noprint" id="oldCommentDiv">

		<% for (int i = 0; i < comments.size(); i++) {
			CommentEntity comment = comments.get(i);
			if (comment.getCommentStatus() == CommentEntity.COMMENT_STATUS_OLD) {%>
		<div class="commentitem comment<%=comment.getCommentType()%>">
		    <div class="commenttitle">
			<%=comment.getNickname()%> @ <%=new SimpleDateFormat("yyyy-MM-dd").format(comment.getPubDate())%> :
		    </div>
		    <div class="commentcontent">
			<%=comment.getComment()%>
		    </div>
		    <div style="clear:both;"></div>
		</div>
		<% }
			}%>
	    </div>
            <div style="clear:both;"></div>
        </div>
    </div>
    <% if (message.isShowConfirm()) {%>
    <div id="confirmDiv">
        <a href="applyStudentActivity.do?applyId=<%=entity.getID()%>">修改申请</a>
        <a href="confirmApply.do?applyId=<%=entity.getID()%>" id="confirmApply">确认申请</a>
        <script type="text/javascript">
            $("#confirmApply").click(function() {
                return confirm("是否确认申请？一旦确认将无法修改！");
            });
        </script>
    </div>
    <% }%>
    
    <%if(message.isShowCancel()){%>
    <div id="cancelDiv">
        <a href="cancelApply.do?applyId=<%=entity.getID()%>" id="cancelApply">取消申请</a>
        <script type="text/javascript">
            $("#cancelApply").click(function() {
                return confirm("是否确认取消申请？一旦确认将无法修改！");
            });
        </script>
    </div>
    <%}%>
    
    <%if(message.getDigestButtonStatus() != ShowStudentActivityApplyMessage.DIGEST_BUTTON_HIDE){%>
        <div id="digestDiv">
            <%if(message.getDigestButtonStatus() == ShowStudentActivityApplyMessage.DIGEST_BUTTON_SHOW){%>
                <a href="digestActivity.do?type=1&activityId=<%=entity.getID()%>">加精</a>
            <%}else if(message.getDigestButtonStatus() == ShowStudentActivityApplyMessage.CANCEL_DIGEST_BUTTON_SHOW){%>
                <a href="digestActivity.do?type=0&activityId=<%=entity.getID()%>">取消加精</a>
            <%}%>
        </div>
    <%}%>
    
    
    <% if (message.isShowApprove()) {%>
    <div id="approveDiv" class="noprint">
        <form action="approveStudentActivityApply.do?applyId=<%=entity.getID()%>&type=<%=message.getApproveType()%>" id="approveForm" method="post">
            <p><label>是否同意该申请？</label>
            <input type="radio" name="isApprove" value="1" checked="checked"/>同意
            <input type="radio" name="isApprove" value="2"/>驳回
            <%if(message.getIdentityAuth() == ShowStudentActivityApplyMessage.IDENTITY_SHETUANBU){%>
            <input type="radio" name="isApprove" value="3"/>发往指定账号审批
            <select name="identityAccount" id="identityAccount">
                <% for (int i = 0; i < IdentityMapping.names.length; i++) { if(i != 1){%>
                <option value="<%=i%>" <%=i == 0 ? "selected=\"selected\"" : ""%> ><%=IdentityMapping.names[i]%></option>
                <% }}%>
            </select> 
            <%}else{%>
            <input type="radio" name="isApprove" value="3"/>仅评论
            <%}%>
            </p>
            <p><% if (message.getApproveType() == ShowStudentActivityApplyMessage.APPROVE_TYPE_GROUP) {%>
                <label>接下来需要审批的部门（可留空）：</label>
                <% for(int i = 1; i < OtherMapping.names.length; i ++){ %>
                <input type="checkbox" name="allocates" value="<%=i%>"/><%=OtherMapping.names[i] %>
                <% } %>
            <% }%></p>
            <p>
                <% if (message.getApproveType() == ShowStudentActivityApplyMessage.APPROVE_TYPE_GROUP) {%>
                <label>之前需要审批的部门（可留空）：</label>
                <% for(int i = 1; i < OtherMapping.names.length; i ++){ %>
                <input type="checkbox" name="resources" value="<%=i %>"/>  <%=OtherMapping.names[i]%>      
                <% } %>
                <% }%>
            </p>
            
            <p><label>地点</label><input type="text" id="croomLocation" name="croomLocation"/></p>

            <script id="editor" type="text/plain" name="editor">请填写审批意见</script>
            <% if (message.getApproveType() == ShowStudentActivityApplyMessage.APPROVE_TYPE_GROUP  || message.getApproveType() == ShowStudentActivityApplyMessage.APPROVE_TYPE_ALLOCATE || message.getApproveType() == ShowStudentActivityApplyMessage.APPROVE_TYPE_RESOURCE) {%>
	    <select id="moduleSelect" style="margin: 5px 0px 0px 0px;max-width: 600px;">
		<option value="0">使用审批模板</option>
                <option value="1">[C楼教室]同意，借用C楼XXX教室，请到校团委门厅【已批文件夹】领取此单，放到C楼306门口文件袋内。</option>
		<option value="2">[多媒体教室]同意，请到校团委门厅【已批文件夹】领取此单，持单到老12号楼416注册中心办理，望贵处大力支持。</option>
		<option value="3">[普通教室]同意，请到校团委门厅【已批文件夹】领取此单，持单到四教二层物业中心办理，望贵处大力支持。</option>
		<option value="4">[室外活动]同意，请注意不要影响交通。请到校团委门厅领取审批表，并交到C楼107物业中心综合治理办公室审批，电话62785656。</option>
		<option value="5">[展板]同意。请到校团委领取审批表交至环保办（62783077善斋312房间）审批。室外宣传品请注意以下事项：1.地点不得阻碍交通，不得立于道路交叉口黄色区域，如在区域内，环保办和保卫处将及时清理；2.展板规格不超过 2*3m，数量1块，放置不超过7天，到期及时撤架。逾期2日内环保办进行撤除清理并暂停申请方申请资格；3.展板应干净整洁，粘贴的小广告需负责清理；4.展板须确保牢固， 大风天气要加强检查防范；不能压着小树苗。谢谢大家。我们共同努力，让校园更美好！</option>
		<option value="6">[LED屏幕]同意。电子屏宣传经校团委审批通过后，可直接转到物业中心录入并显示在大屏幕上。</option>
	    </select>
	    <% }%>
            <input type="hidden" id="comment" name="comment"><div id="approveSubmitDiv"><a class="button" id="submitApprove" href="#">提交</a></div>
        </form>
        <script type="text/javascript">
            ue = UE.getEditor('editor');
            $("#submitApprove").click(function() {
                if($("input[name='isApprove']")[0].checked && !!$("#croomLocation")[0] && $('#croomLocation').val() != ""){
                    if (confirm("是否确认提交？一旦提交无法修改！") == true)
                    {
                        $("#comment").val("教室位置："+$('#croomLocation').val()+"<br/>"+ue.getContent());
                        $("#approveForm").submit();
                    }
                }else{
                    if (confirm("是否确认提交？一旦提交无法修改！") == true)
                    {
                        $("#comment").val(ue.getContent());
                        $("#approveForm").submit();
                    }
                }
                return false;
            });
            <% if (message.getApproveType() == ShowStudentActivityApplyMessage.APPROVE_TYPE_GROUP  || message.getApproveType() == ShowStudentActivityApplyMessage.APPROVE_TYPE_ALLOCATE || message.getApproveType() == ShowStudentActivityApplyMessage.APPROVE_TYPE_RESOURCE) {%>
	    $("#moduleSelect").change(function(){
		if ( $("#moduleSelect").val() != "0")
		{
		    var text = $("#moduleSelect").find("option:selected").text();
		    text = text.replace(/\[.*\]/, "");
		}
		else
		{
		    var text = "";
		}
		ue.setContent('<p>' + text + '</p>');
	    });
	    <% }%>
        </script>
    </div>
    <% }}%>
    
    
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
        $("#printurl").html("此表线上地址：" + window.location.href + "<br/>纸质申请表只有内容和线上申请信息一致时才有效！");

        if ($("#currentCommentDiv").html().replace(/^\s+|\s+$/g, '') == "")
        {
            $("#currentCommentDiv").html("<div style='text-align:center;width:100%;'>暂无审批消息</div>");
        }
    </script>
</html>
