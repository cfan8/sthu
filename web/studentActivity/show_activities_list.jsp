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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学生活动</title>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
	<script type="text/javascript" src="/js/datepicker.js"></script>
        <script type="text/javascript" src="/js/eye.js"></script>
        <script type="text/javascript" src="/js/utils.js"></script>
        
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
                            <a style="font-size:xx-large;"><b>活动列表</b></a>
                        </div>                       
                    </div>
                    -->
                    <div id="text_content" style="min-height:400px;height: auto;padding-top: 20px;padding-bottom: 20px;"> 
                    </div>
                </div>
           </div>
       </div>
     </div>    
    
    
     <%@include file="/templates/general_subject.jsp" %>
    <input id="dateInput" style="display: none" <%if(message.getSelectedDate()!=null){String df = new SimpleDateFormat("yyyy-MM-dd").format(message.getSelectedDate());%> value="<%=df%>"<%}else{%>value=""<%}%>/>
    <input id="classInput" style="display: none" value="<%=message.getActivityClass()%>" />
	<script type="text/javascript">
            $.noConflict();
            var day = $("#dateInput").val();
            var classvalue = $("#classInput").val();
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
            
            $("#btn_group").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_GROUP%>" +"&digest=<%=message.getDigest()%>"+ datestr;
            });
            $("#btn_sport").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_SPORTS %>" +"&digest=<%=message.getDigest()%>"+ datestr;
            });
            $("#btn_lecture").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_LECTURE%>" +"&digest=<%=message.getDigest()%>"+ datestr;
            });
            $("#btn_culture").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_CULTURE%>" +"&digest=<%=message.getDigest()%>"+ datestr;
            });
            $("#btn_amuse").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_AMUSE%>" +"&digest=<%=message.getDigest()%>"+ datestr;
            });
            $("#btn_other").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=ShowActivitiesPageAction.ACTIVITY_OTHER%>" +"&digest=<%=message.getDigest()%>"+ datestr;
            });
            $("#btn_digest").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=message.getActivityClass()%>" +"&digest=<%=ShowActivitiesPageAction.DIGEST_ACTIVITY%>"+ datestr;
            });
            $("#btn_all").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=<%=message.getActivityClass()%>" +"&digest=<%=ShowActivitiesPageAction.COMMON_ACTIVITY%>"+ datestr;
            });
            $("#btn_clear").click(function(){
                self.location.href = "showActivitiesList.do?activityClass=" +"&digest=";
            });
            
            
            
            
    document.getElementById("btn_group").className="unselected-border";
    document.getElementById("btn_sport").className="unselected-border";
    document.getElementById("btn_lecture").className="unselected-border";
    document.getElementById("btn_culture").className="unselected-border";
    document.getElementById("btn_amuse").className="unselected-border";
    document.getElementById("btn_other").className="unselected-border";
     //var classvalue = document.getElementById("classInput").value;
     switch(classvalue) {
          case "1":
              document.getElementById("btn_group").className = "selected-border";

              break;
          case "2":
              document.getElementById("btn_sport").className = "selected-border";
              break;
          case "3":
              document.getElementById("btn_lecture").className = "selected-border";
              break;
          case "4":
              document.getElementById("btn_culture").className = "selected-border";
              break;
          case "5":
              document.getElementById("btn_amuse").className = "selected-border";
              break;
          case "6":
              document.getElementById("btn_other").className = "selected-border";
              break;
      }    
            
            /*$("#btn_search").click(function(){
                document.getElementById("input_box").value = encodeURIComponent(document.getElementById("input_box").value);
            
                $('#search_form').submit();
                return false;
            });*/
            //var day = new Date();
            
            $('#date').DatePicker({
                flat: true,
                date: day,
                current: day,
                calendars: 1,
                starts: 1,
                format: 'Y-m-d',
                onChange:function(date){
                    self.location.href = "showActivitiesList.do?activityClass=<%=message.getActivityClass()%>&digest=<%=message.getDigest()%>"+"&selectedDate="+date;
                }
            });
	</script>
    <%@include file="/templates/new_general_footer.jsp" %>

</html>


