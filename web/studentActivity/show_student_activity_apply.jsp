<%-- 
    Document   : show_student_activity_apply
    Created on : 2013-7-23, 13:20:51
    Author     : Wang Silun
--%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowStudentActivityApplyAction"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
    CommentEntity commentEntity = message.getCommentEntity();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>显示活动申请</title>
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_tiny.js"></script>
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
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

            tr
            {
                border-top-width: 1px;
                border-top-style: solid;
            }

            p{
                margin: 16px 0px; 
            }


            #confirmDiv
            {
                width: 780px;
                margin: 20px auto 0px auto;
                text-align: center;
            }

            #confirmDiv a
            {
                display: inline-block;
                width: 180px;
                height: 26px;
                background-color: #ff7900;
                text-align: center;
            }

            #confirmDiv a:link, #confirmDiv a:visited
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
                width: 175px;
                padding-left: 5px;
                text-align: left;
            }

            .commentcontent
            {
                width: 392px;
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

        </style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <div id="position" class="noprint">您当前的位置：活动申请</div>
    <div class="processtype noprint" id="processtype<%=entity.getApplyStatus()%>"></div>
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
            <%if(options.getActivityArea() == 1) {%>
            <tr><td class="tag">活动范围:</td><td class="value">仅校内</td></tr>
            <% }%>
            <%if(options.getActivityArea() == 2) {%>
            <tr><td class="tag">活动范围:</td><td class="value">涉校外</td></tr>
            <tr><td class="tag">校外人员情况:</td><td class="value"><%=options.getExternalIntro()%></td></tr>
            <tr><td class="tag">校外合作单位:</td><td class="value"><%=options.getExternalOrganizationIntro()%></td></tr>
            <tr><td class="tag">出校活动安全预案:</td><td class="value"><%=options.getSecurityPreparedness()%></td></tr>
            <% }%>
            <%if(options.getActivityArea() == 3) {%>
            <tr><td class="tag">活动范围:</td><td class="value">涉境外</td></tr>
            <tr><td class="tag">境外人员情况:</td><td class="value"><%=options.getOverseasIntro()%></td></tr>
            <tr><td class="tag">境外合作单位:</td><td class="value"><%=options.getOverseasOrganizationIntro()%></td></tr>
            <tr><td class="tag">相关材料:</td><td class="value"><%=options.getOverseasMaterial()%></td></tr>
            <% }%>
            <tr><td class="tag applyStatus">当前申请状态：</td></tr>
        </table>
    </div>

    <div id="commentBlock">
        <div id="showControl">
            <div id="currentcomment">当前的审批消息</div><div id="borderDiv" class="noprint"></div>
        </div>
        <div id="commentShow" >
            <div class="commentDiv toprint" id="currentCommentDiv">
                <% if (entity.getIdentityStatus() == StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED || entity.getIdentityStatus() == StudentActivityApplyEntity.APPLY_STATUS_REJECTED) {%>
                <div class="commentitem comment<%= entity.getIdentityStatus()%>">
                    <div class="commenttitle">
                        <%=commentEntity.getNickname()%> @ <%=new SimpleDateFormat("yyyy-MM-dd").format(commentEntity.getPubDate())%> :
                    </div>
                    <div class="commentcontent">
                        <%=commentEntity.getComment()%>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <% }%>
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

    <% if (message.isShowApprove()) {%>
    <div id="approveDiv" class="noprint">
        <form action="approveActivityApply.do?applyId=<%=entity.getID()%>" id="approveForm" method="post">
            <p><label>是否同意该申请？</label><input type="radio" name="isApprove" value="true" checked="checked"/>同意<input type="radio" name="isApprove" value="false"/>驳回</p>
            <script id="editor" type="text/plain" name="editor">请填写审批意见</script>
            <input type="hidden" id="comment" name="comment"><div id="approveSubmitDiv"><a class="button" id="submitApprove" href="#">提交</a></div>
        </form>
        <script type="text/javascript">
            ue = UE.getEditor('editor');
            $("#submitApprove").click(function() {
                if (confirm("是否确认提交？一旦提交无法修改！") == true)
                {
                    $("#comment").val(ue.getContent());
                    $("#approveForm").submit();
                }
                return false;
            });
        </script>
    </div>
    <% }%>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
        $("#printurl").html("此表线上地址：" + window.location.href + "<br/>纸质申请表只有内容和线上申请信息一致时才有效！");

        if ($("#currentCommentDiv").html().replace(/^\s+|\s+$/g, '') == "")
        {
            $("#currentCommentDiv").html("<div style='text-align:center;width:100%;'>暂无审批消息</div>");
        }
    </script>
</html>
