<%-- 
    Document   : show_student_activity_detail
    Created on : 2013-9-4, 19:24:26
    Author     : xiaobo
--%>

<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowStudentActivityDetailAction"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityDetailMessage"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowStudentActivityDetailMessage message = Util.getMessage(ShowStudentActivityDetailAction.class);
    StudentActivityApplyEntity entity = message.getActivity();
%>
<!DOCTYPE html>
<html>
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
    <div id="main_content" class="main-style">
        <div id="content_div" class="content-div-style">
            <!-- 画折角效果 -->
            <div id="content_flexagon1" class="flexagon-style">
                <!-- 左折角 -->
                <div id="flexagon1">
                    <canvas id="c1" width="8" height="8"></canvas>
                    <script>
                        var myCanvas = document.getElementById("c1");
                        var context = myCanvas.getContext("2d");
                        context.lineWidth = 1;
                        context.beginPath();
                        context.fillStyle = "black";
                        context.moveTo(8, 8);
                        context.lineTo(8, 0);
                        context.lineTo(0, 8);
                        context.fill();
                    </script>
                </div>
                <!-- 右折角 -->
                <div id="flexagon2">
                    <canvas id="c2" width="8" height="8"></canvas>
                    <script>
                        var myCanvas = document.getElementById("c2");
                        var context = myCanvas.getContext("2d");
                        context.lineWidth = 1;
                        context.beginPath();
                        context.fillStyle = "black";
                        context.moveTo(0, 0);
                        context.lineTo(0, 8);
                        context.lineTo(8, 8);
                        context.fill();
                    </script>
                </div>
            </div>
            <div style="height:7px;"></div>
            <div id="content_board" class="content-style">
                <div id="content_main_board" class="content-main-style">
                    <div id="text_index" style="min-height:100px;height:auto;padding:30px 40px 10px 40px;background-color: #0ad;color:#fff;">
                        <a style="font-size:xx-large;"><b><%=entity.getActivityTheme()%> </b></a> 
                        <br/>
                        <p style="color:#fff;"><%=entity.getActivityDate()%>&nbsp;&nbsp;<%=entity.getTimePeriod()%></p>
                        <p style="color:#fff;"><%if(entity.getOption().getCroomLocation() != null){%><%=entity.getOption().getCroomLocation()%><%}%></p>
                        <p style="color:#fff;"><%=entity.getOrganizerName()%></p>
                        
                    </div>
                        <div id="participant_div" style="float:right; margin:20px;">
                            <span style="font-size:large;">已有<a style="color:red;"><b><%=message.getFollowNumber()%></b></a>人参与</span>
                            &nbsp;&nbsp;&nbsp;   
                            <a href="followActivity.do?activityId=<%=entity.getID()%>&type=1">
                                <img src="/css/activity/partin.png" />
                            </a>
                        </div>
                    <div id="text_content" style="height:auto; min-height: 850px; padding:30px;"> 
                         <%=entity.getOption().getPublicityMaterials()%>
                    </div>
                </div>
           </div>
       </div>
     </div>    
    <%@include file="/templates/new_general_footer.jsp" %>

</html>


