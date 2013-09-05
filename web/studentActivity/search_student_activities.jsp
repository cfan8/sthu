<%-- 
    Document   : search_student_activities
    Created on : 2013-8-13, 16:03:24
    Author     : anna
--%>


<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.SearchActivityPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.SearchActivityAction"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.SearchActivitiesMessage"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SearchActivitiesMessage message = Util.getMessage(SearchActivityAction.class);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>搜索学生活动</title>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
        <link href="/css/activity/indexPage_sheet.css" type="text/css" rel="stylesheet"/>
        <link href="/css/activity/flexagon.css" type="text/css" rel="stylesheet" />
        <link href="/css/activity/effects.css" type="text/css" rel="stylesheet" />
    </head>
    
    <%@include file="/templates/new_general_header.jsp" %>
    
    <div id="input_div" class="input-bar">
        <div id="input_main" class="input-main-style">
            <div><input id="input_box" class="input-border"/></div>
            <div class="input-text">
                <div id="btn_activity" class="unselected-border">
                    <div class="search-bar-text"><a style="cursor: pointer;"><b>活动</b></a></div>
                </div>
                <div id="btn_search" class="selected-border">
                    <div class="search-bar-text"><a style="cursor: pointer;"><b>搜索</b></a></div>
                </div>
            </div>
        </div>
    </div>
    <div style="height:10px;"></div>
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
                    <div id="text_index" style="height:70px;padding:30px 40px 10px 40px">
                        <div style="position:absolute;">
                            <a style="font-size:large;"><b>搜索结果</b></a>
                        </div>                       
                    </div>
                    <div id="text_content" style="min-height:850px; height: auto; padding-bottom: 20px;"> 
                    </div>
                </div>
           </div>
       </div>
     </div>    
    
    
     <div id="other_content" class="other-style">
        <div id="other_main_content" class="content-div-style">
            <div id="content_flexagon2" class="flexagon-style">
                <!-- 左折角 -->
                <div id="flexagon3">
                    <canvas id="c3" width="8" height="8"></canvas>
                    <script>
                        var myCanvas = document.getElementById("c3");
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
                <div id="flexagon4">
                    <canvas id="c4" width="8" height="8"></canvas>
                    <script>
                        var myCanvas = document.getElementById("c4");
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
            <div id="bottom-content" class="bottom-content-style" >
                <!-- 专题-->
                <div id="left_content" class="left-content-style" style="height:160px;">
                    <div style="height:35px;padding:10px 0px 5px 40px">
                        <a style="font-size:xx-large;color:#888;"><b>专题</b></a>
                    </div>
                    <div style="padding:0px 30px 5px 30px;" >
                        <div style="float:left;">
                            <img src="/css/activity/zt1.jpg" width="255" />
                        </div>
                        <div style="float:right;">
                            <img src="/css/activity/zt2.jpg" width="255" />
                        </div>
                    </div>
                </div>
                <!-- 热点推荐-->
                <div id="right_content" class="right-content-style" style="height:160px;">
                    <div style="color:#fff;font-size:xx-large;padding:10px 0px 0px 20px">
                        <a><b>热点推荐</b></a>
                    </div>
                    <div style="color:#fff;font-size:x-large;">
                        <ul style="list-style-type:none;padding:0px 10px 0px 10px;margin:5px 0px 0px 0px;">
                            <li style="margin-top:3px;">
                                <a>【视频直播】巅峰论坛第三场</a>
                            </li>
                            <li style="margin-top:3px;">
                                <a>【视频直播】巅峰论坛第二场</a>
                            </li>
                            <li style="margin-top:3px;">
                                <a>【视频直播】巅峰论坛第一场</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	        
        
	
        
        
        
    <script type="text/javascript">
        var pageConfig = {
        root:$("#text_content"),
	url:"searchStudentActivityPage.do?searchKeywords=<%=message.getSearchKeyword()%>",
	total:<%=message.getTotalPageNumber()%>,
	current:1,
	arguName:"page",
	css:false
	};
	init(pageConfig);
        $("#btn_search").click(function(){
	var searchKeyword = $("#input_box").val();   
        self.location.href = "searchStudentActivity.do?searchKeywords="+searchKeyword;
        });
        
        $("#btn_activity").click(function(){
            self.location.href ="/studentActivity/showActivitiesList.do";
        });
    </script>
    <%@include file="/templates/new_general_footer.jsp" %>

</html>
