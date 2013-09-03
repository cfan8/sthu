<%-- 
    Document   : show_activities_list
    Created on : 2013-8-7, 23:19:22
    Author     : xiaobo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowActivitiesPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowActivitiesListAction"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowActivitiesListMessage"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowActivitiesListMessage message = Util.getMessage(ShowActivitiesListAction.class);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学生活动</title>
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
    
    <div id="input_div" class="input-bar">
        <div id="input_main" class="input-main-style">
            <div><input id="input_box" class="input-border"/></div>
            <div>
            
                <select id="chooseActivityClass">
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_ALL%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_ALL ? "selected=\"selected\"" : ""%>>全部</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_GROUP%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_GROUP ? "selected=\"selected\"" : ""%>>党团活动</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_SPORTS%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_SPORTS ? "selected=\"selected\"" : ""%>>体育赛事</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_LECTURE%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_LECTURE ? "selected=\"selected\"" : ""%>>学术讲座</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_CULTURE%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_CULTURE ? "selected=\"selected\"" : ""%>>文化活动</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_AMUSE%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_AMUSE ? "selected=\"selected\"" : ""%>>文艺活动</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_OTHER%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_OTHER ? "selected=\"selected\"" : ""%>>其他活动</option>
		</select>
       	    
            </div>
            <div>
                <select id="chooseDigest">
                    <option value="<%=ShowActivitiesPageAction.COMMON_ACTIVITY%>" <%=message.getDigest() == ShowActivitiesPageAction.COMMON_ACTIVITY ? "selected=\"selected\"" : ""%>>全部</option>
		    <option value="<%=ShowActivitiesPageAction.DIGEST_ACTIVITY%>" <%=message.getDigest() == ShowActivitiesPageAction.DIGEST_ACTIVITY ? "selected=\"selected\"" : ""%>>精选</option>
                </select>
            </div>
            <div class="input-text">
                <div id="btn_activity" class="selected-border">
                    <div class="search-bar-text"><a style="cursor: pointer;"><b>活动</b></a></div>
                </div>
                <div id="btn_search" class="unselected-border">
                    <div class="search-bar-text"><a style="cursor: pointer;"><b>搜索</b></a></div>
                </div>
            </div>
        </div>
        <div>
            <p id="date"></p>
            <button id="clearCalendarButton">全部（日历）</button>
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
                            <a style="font-size:large;"><b>活动列表</b></a>
                        </div>                       
                    </div>
                    <div id="text_content" style="height:850px;"> 
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
    <input id="dateInput" style="display: none" <%if(message.getSelectedDate()!=null){String df = new SimpleDateFormat("yyyy-MM-dd").format(message.getSelectedDate());%> value="<%=df%>"<%}else{%>value=""<%}%>/>
	<script type="text/javascript">
            $.noConflict();
            var day = $("#dateInput").val();
            var datestr = "";
            if(day != ""){
                datestr="&selectedDate="+day;
            }else{
                day = new Date();
            }
	    var pageConfig = {
		root:$("#text_content"),
		url:"showActivitiesPage.do?activityClass=<%=message.getActivityClass()%>&digest=<%=message.getDigest()%>"+datestr,
		total:<%=message.getTotalPageNumber()%>,
		current:1,
		arguName:"page",
		css:false
	    };
	    init(pageConfig);
             $("#chooseActivityClass").change(function(){
                var digest = $("#chooseDigest").val();
		var type = $("#chooseActivityClass").val();
		self.location.href = "showActivitiesList.do?activityClass=" + type +"&digest=" + digest + datestr;
	    });
            $("#chooseDigest").change(function(){
               var digest = $("#chooseDigest").val();
               var type = $("#chooseActivityClass").val();
               self.location.href = "showActivitiesList.do?activityClass=" + type +"&digest=" + digest + datestr;
            });
            $("#btn_search").click(function(){
                var searchKeyword = $("#input_box").val();   
                self.location.href = "searchStudentActivity.do?searchKeywords="+searchKeyword;
            });
            $('#clearCalendarButton').click(function(){
                var digest = $("#chooseDigest").val();
               var type = $("#chooseActivityClass").val();
               self.location.href = "showActivitiesList.do?activityClass=" + type +"&digest=" + digest;
            });
            //var day = new Date();
            
            $('#date').DatePicker({
                flat: true,
                date: day,
                current: day,
                calendars: 1,
                starts: 1,
                format: 'Y-m-d',
                onChange:function(date){
                    var digest = $("#chooseDigest").val();
                    var type = $("#chooseActivityClass").val();
                    self.location.href = "showActivitiesList.do?activityClass=" + type +"&digest=" + digest+"&selectedDate="+date;
                }
            });
	</script>
    <%@include file="/templates/new_general_footer.jsp" %>

</html>


