<%-- 
    Document   : show_activities_list
    Created on : 2013-8-7, 23:19:22
    Author     : xiaobo
--%>

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
	<style>
	    ul{
		list-style-type: square;
		padding-left: 120px;
		color: #105162;
		font-weight: bold;
	    }
	    
	    ul a:link, ul a:visited
	    {
		text-decoration: none;
		color: #105162;
	    }
	    
	    ul a:hover
	    {
		color: black;
		text-decoration: underline;
	    }
	</style>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    
	<div>
            <div>
                <p><select id="chooseActivityClass">
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_ALL%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_ALL ? "selected=\"selected\"" : ""%>>全部</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_GROUP%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_GROUP ? "selected=\"selected\"" : ""%>>党团活动</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_SPORTS%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_SPORTS ? "selected=\"selected\"" : ""%>>体育赛事</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_LECTURE%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_LECTURE ? "selected=\"selected\"" : ""%>>学术讲座</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_CULTURE%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_CULTURE ? "selected=\"selected\"" : ""%>>文化活动</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_AMUSE%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_AMUSE ? "selected=\"selected\"" : ""%>>文艺活动</option>
		    <option value="<%=ShowActivitiesPageAction.ACTIVITY_OTHER%>" <%=message.getActivityClass() == ShowActivitiesPageAction.ACTIVITY_OTHER ? "selected=\"selected\"" : ""%>>其他活动</option>
		</select>
	    </p>
            </div>
	    <div id="pageview"></div>
	</div>
	<script type="text/javascript">
	    var pageConfig = {
		root:$("#pageview"),
		url:"showActivitiesPage.do?activityClass=<%=message.getActivityClass()%>",
		total:<%=message.getTotalPageNumber()%>,
		current:1,
		arguName:"page",
		css:false
	    };
	    init(pageConfig);
             $("#chooseActivityClass").change(function(){
		var type = $("#chooseActivityClass").val();
		self.location.href = "showActivitiesList.do?activityClass=" + type;
	    });
	</script>
    <%@include file="/templates/general_footer.jsp" %>

</html>


