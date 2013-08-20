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
            <div id =" searchActivity">
               <input type="text" name="activityname" id="activityname" />
                <input type="button" name ="submitsearch" value="search" id="submitsearch"/>
            
             
                </div>
             <div id="pageview"></div>
	
	<script type="text/javascript">
	    var pageConfig = {
		root:$("#pageview"),
		url:"searchStudentActivityPage.do?searchKeywords=<%=message.getSearchKeyword()%>",
		total:<%=message.getTotalPageNumber()%>,
		current:1,
		arguName:"page",
		css:false
	    };
	    init(pageConfig);
             $("#submitsearch").click(function(){
	       var searchKeyword = $("#activityname").val();   
                self.location.href = "searchStudentActivity.do?searchKeywords="+searchKeyword;
              
	    });
              
	</script>
    <%@include file="/templates/general_footer.jsp" %>

</html>
