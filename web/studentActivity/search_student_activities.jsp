<%-- 
    Document   : search_student_activities
    Created on : 2013-8-13, 16:03:24
    Author     : anna
--%>


<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowActivitiesPageAction"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>搜索学生活动</title>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
        
	<script type="text/javascript" src="/js/datepicker.js"></script>
        <link href="/css/activity/indexPage_sheet.css" type="text/css" rel="stylesheet"/>
        <link href="/css/activity/flexagon.css" type="text/css" rel="stylesheet" />
        <link href="/css/activity/effects.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="/css/datepicker.css" type="text/css" />
    </head>
        
    
    <%@include file="/templates/new_general_header.jsp" %>
    <%@include file="/templates/general_classify.jsp" %>
    <div style="height:10px;"></div>
    <div id="main_content" class="main-style">
        <div id="content_div" class="content-div-style">
            
            <div id="content_board" class="content-style">
                <div id="content_main_board" class="content-main-style">
                    <!--
                    <div id="text_index" style="height:70px;padding:30px 40px 10px 40px">
                        <div style="position:absolute;">
                            <a style="font-size:xx-large;"><b>搜索结果</b></a>
                        </div>                       
                    </div>
                    -->
                    <div id="text_content" style="min-height:400px;padding-top: 20px; height: auto; padding-bottom: 20px;"> 
                    </div>
                </div>
           </div>
       </div>
     </div>    
    
    <%@include file="/templates/general_subject.jsp" %>
     
    
	        
        
	
        
        
        
    <script type="text/javascript">
        $.noConflict();
        var pageConfig = {
        root:$("#text_content"),
	url:"searchStudentActivityPage.do?<%=message.getParam()%>",
	total:<%=message.getTotalPageNumber()%>,
	current:1,
	arguName:"page",
	css:false
	};
	init(pageConfig);
        
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
