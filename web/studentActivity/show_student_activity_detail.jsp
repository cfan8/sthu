<%-- 
    Document   : show_student_activity_detail
    Created on : 2013-9-4, 19:24:26
    Author     : xiaobo
--%>

<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowActivitiesPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowStudentActivityDetailAction"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityDetailMessage"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowStudentActivityDetailMessage message = Util.getMessage(ShowStudentActivityDetailAction.class);
    StudentActivityApplyEntity entity = message.getActivity();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学生活动详情</title>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
	<script type="text/javascript" src="/js/datepicker.js"></script>
        <script type="text/javascript" src="/js/eye.js"></script>
        <script type="text/javascript" src="/js/utils.js"></script>
        <link href="/css/activity/indexPage_sheet.css" type="text/css" rel="stylesheet"/>
        <link href="/css/activity/flexagon.css" type="text/css" rel="stylesheet" />
        <link href="/css/activity/effects.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="/css/datepicker.css" type="text/css" />
    </head>
    <%@include file="/templates/new_general_header.jsp" %>
    <%@include file="/templates/general_classify.jsp" %>
    <div id="main_content" class="main-style">
        
            <div style="height:7px;"></div>
            <div id="content_board" class="content-style">
                <div id="content_main_board" class="content-main-style">
                    
                    <div id="text_index" style="min-height:200px;height:auto;padding:30px 40px 10px 40px;background-color: #DBDBDB;color:black;">
                        <div style="float: left; margin: 20px;border-radius: 5px; border:5px solid #C1C1C1">
                            <%if(entity.getOption().getPublicityImg() != null && entity.getOption().getPublicityImg().compareTo("null")!=0){%>
                            <img src="<%=entity.getOption().getPublicityImg()%>" width="400px" height="300px"/>
                                <%}else{%>
                                <img src="/images/banner.jpg" width="400px" height="300px"/>
                                <%}%>
                        </div>
                        <div style="font-family: Microsoft YaHei, LiHei Pro Medium; margin-top:20px;">
                        <a style="font-size:36px;"><b><%=entity.getActivityTheme()%> </b></a> 
                        <br/>
                        <p style="color:#00;"><%=entity.getActivityDate()%>&nbsp;&nbsp;<%=entity.getTimePeriod()%></p>
                        <p style="color:#000;"><%if(entity.getOption().getCroomLocation() != null){%><%=entity.getOption().getCroomLocation()%><%}%></p>
                        <p style="color:#000;"><%=entity.getOrganizerName()%></p>
                        </div>
                    </div>
                        <div id="participant_div" style="margin-top: 20px;">
                        
                            <span style="font-size:large;">已有 <a style="color:red;font-family: Impact"><b><%=message.getFollowNumber()%></b></a> 人参与</span>
                            &nbsp;&nbsp;&nbsp;   
                            <%if(message.getShowFollow() == 1){%>
                            <a href="followActivity.do?activityId=<%=entity.getID()%>&type=1">
                                <img src="/css/activity/interest.png" />
                            </a>
                            <%}else{%>
                            <a href="followActivity.do?activityId=<%=entity.getID()%>&type=0">
                                <img src="/css/activity/notinterest.png" />
                            </a>
                            <%}%>
                        </div>
                        <div id="ticket_div">
                            <%if(message.getShowTicket() == 1){%>
                            <a href="followTicket.do?activityId=<%=entity.getID()%>">
                               我要抽门票
                            </a>
                            <%}else if(message.getShowTicket() == 2){%>
                                已参与抽门票,<%=message.getActivity().getOption().getTicketRandomDate()%>之后查看结果
                            <%}else if(message.getShowTicket() == 3){%>
                                抽票已结束,请到个人主页查看结果</a>
                            <%}else if(message.getShowTicket() == 4) {%>
                                门票预订停止，等待抽票结果
                            <%}else if(message.getShowTicket() == -1) {%>
                                <%=message.getActivity().getOption().getTicketRandomDate()%>后抽票
                            <%}else if(message.getShowTicket() == -2) {%>
                                报名截止,<a href="randomTickets.do?activityId=<%=entity.getID()%>">开始抽票</a>
                            <%}else if(message.getShowTicket() == -3) {%>
                                抽票结束,<a href="showTicketRandomResult.do?activityID=<%=entity.getID()%>">查看结果</a>
                            <%}%>
                        </div>
                    <div id="text_content" style="height:auto; min-height: 400px; padding:20px 60px 20px 60px; margin-top: 60px;"> 
                         <%=entity.getOption().getPublicityMaterials()%>
                    </div>
                </div>
           </div>
       </div>
     <%@include file="/templates/general_subject.jsp" %>
     <script type="text/javascript">
        $.noConflict();
        
        var datestr = "";
        document.getElementById("btn_group").className="unselected-border";
    document.getElementById("btn_sport").className="unselected-border";
    document.getElementById("btn_lecture").className="unselected-border";
    document.getElementById("btn_culture").className="unselected-border";
    document.getElementById("btn_amuse").className="unselected-border";
    document.getElementById("btn_other").className="unselected-border";
    
        $("#btn_group").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_GROUP%>" +"&digest="+ datestr;
            });
            $("#btn_sport").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_SPORTS %>" +"&digest="+ datestr;
            });
            $("#btn_lecture").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_LECTURE%>" +"&digest="+ datestr;
            });
            $("#btn_culture").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_CULTURE%>" +"&digest="+ datestr;
            });
            $("#btn_amuse").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_AMUSE%>" +"&digest="+ datestr;
            });
            $("#btn_other").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_OTHER%>" +"&digest="+ datestr;
            });
            $("#btn_clear").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=" +"&digest=";
            });
            var day = new Date();
            $('#date').DatePicker({
                flat: true,
                date: day,
                current: day,
                calendars: 1,
                starts: 1,
                format: 'Y-m-d',
                onChange:function(date){
                    self.location.href = "showActivitiesList.do?activityClass=&digest="+"&selectedDate="+date;
                }
            });
    </script>
    <%@include file="/templates/new_general_footer.jsp" %>

</html>


