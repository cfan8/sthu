<%-- 
    Document   : show_student_activity_apply_list
    Created on : 2013-7-27, 14:54:46
    Author     : xiaobo
--%>

<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowStudentActivityApplyListPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowStudentActivityApplyListAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityApplyListMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowStudentActivityApplyListMessage message = Util.getMessage(ShowStudentActivityApplyListAction.class);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>申请列表</title>
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
    <body>
        
        <div>
            <%if(message.getApproveType() != ShowStudentActivityApplyListPageAction.APPROVE_TYPE_APPROVED 
            && message.getApproveType() != ShowStudentActivityApplyListPageAction.APPROVE_TYPE_DIGEST){%>
            <p><select id="chooseApproveType">
                    <option value="<%=ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO%>" <%=message.getViewType() == ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO ? "selected=\"selected\"" : ""%>>未处理的申请</option>
                    <option value="<%=ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST%>" <%=message.getViewType() == ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST ? "selected=\"selected\"" : ""%>>已处理的申请</option>
                </select>
            </p>
            <%}%>
           
        </div>
         <div>
            <%if(message.getApproveType() == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_APPROVED 
            ){%>
            <p>
                <input id ="keywordInput" class ="text"/>
                <input id="searchSubmit" type="button" value="Search"/>
                <input id ="check_in" value ="0" onclick ="f1()"type="checkbox"  >涉校外</input>
                <input id ="check_out" type="checkbox"  value ="0" onclick ="f1()"   >涉境外</input>
                <input id ="check_classroom" type="checkbox" value ="0" onclick ="f1()">教室申请</input>
                <input id ="check_LED" type="checkbox"  value ="0" onclick ="f1()" >电子屏申请</input>
                <input id ="check_outdoor" type="checkbox"  value ="0" onclick ="f1()" >室外场地申请</input>
                <input id ="check_broad" type="checkbox"  value ="0" onclick ="f1()" >展板申请</input>
                <input id ="check_bulletin" type="checkbox"  value ="0" onclick ="f1()" >宣传栏申请</input>
                <input id ="check_sthu" type="checkbox" value ="0" onclick ="f1()" >学生清华发布申请</input>
                <input id ="check_ticket" type="checkbox" value ="0" onclick ="f1()" >门票抽签申请</input>
            </p>
            <%}%>
            <div id="pageview" ></div>
        </div>
	<script type="text/javascript">
	    var pageConfig = {
		root:$("#pageview"),
		url:"showStudentActivityApplyPage.do?viewType=<%=message.getViewType()%>&approveType=<%=message.getApproveType()%>&searchKeywords=<%=message.getSearchKeywords()%>&searchStatus=<%=message.getSearchStatus()%>",
		total:<%=message.getTotalPageNumber()%>,
		current:1,
		arguName:"page",
		css:false
	    };
	    init(pageConfig);
	    $("#chooseApproveType").change(function(){
		var type = $("#chooseApproveType").val();
		self.location.href = "showStudentActivityApplyList.do?viewType=" + type + "&approveType=<%=message.getApproveType()%>";
	    });
           
            $("#searchSubmit").click(function(){
                
               var searchKeywords = $("#keywordInput").val(); 
            var searchStatus = $("#check_in").attr("value")+","+$("#check_out").attr("value")+","+$("#check_classroom").attr("value")
                               +","+$("#check_LED").attr("value")+","+$("#check_outdoor").attr("value")+","+$("#check_broad").attr("value")
                               +","+$("#check_bulletin").attr("value")
                               +","+$("#check_sthu").attr("value")+","+$("#check_ticket").attr("value");
             //  alert(searchStatus);
               self.location.href = "showStudentActivityApplyList.do?viewType="+1+"&approveType=<%=ShowStudentActivityApplyListPageAction.APPROVE_TYPE_APPROVED%>"+"&searchStatus="+searchStatus+"&searchKeywords="+searchKeywords;
            });
        function f1(){
           $(event.target).attr("value", 1-$(event.target).attr("value"))
         
        }
	</script>
    </body>
</html>

