<%-- 
    Document   : show_classroom_apply_list
    Created on : 2013-2-16, 15:27:34
    Author     : linangran
--%>

<%@page import="cn.edu.tsinghua.sthu.action.ShowApplyListPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.action.ShowApplyListAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowApplyListMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowApplyListMessage message = Util.getMessage(ShowApplyListAction.class);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>申请列表</title>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
    </head>
    <div>
	<p><select id="chooseApproveType">
		<option value="<%=ShowApplyListPageAction.VIEW_TYPE_TODO%>" <%=message.getViewType()==ShowApplyListPageAction.VIEW_TYPE_TODO?"selected=\"selected\"":"" %>>未处理的申请</option>
		<option value="<%=ShowApplyListPageAction.VIEW_TYPE_PAST%>" <%=message.getViewType()==ShowApplyListPageAction.VIEW_TYPE_PAST?"selected=\"selected\"":"" %>>已处理的申请</option>
	    </select>
	</p>
	<div id="pageview"></div>
    </div>
    <script type="text/javascript">
	var pageConfig = {
	    root:$("#pageview"),
	    url:"showApplyPage.do?viewType=<%=message.getViewType()%>&approveType=<%=message.getApproveType()%>",
	    total:<%=message.getTotalPageNumber()%>,
	    current:1,
	    arguName:"page",
	    css:false
	};
	init(pageConfig);
	$("#chooseApproveType").change(function(){
	    var type = $("#chooseApproveType").val();
	    self.location.href = "showApplyList.do?viewType=" + type + "&approveType=<%=message.getApproveType()%>";
	});
    </script>
</html>