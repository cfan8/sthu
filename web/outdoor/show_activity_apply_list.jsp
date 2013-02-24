<%-- 
    Document   : show_activity_apply_list
    Created on : 2013-2-23, 21:30:23
    Author     : xiaobo
--%>

<%@page import="cn.edu.tsinghua.sthu.action.outdoor.ShowActivityApplyListPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.action.outdoor.ShowActivityApplyListAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.outdoor.ShowActivityApplyListMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowActivityApplyListMessage message = Util.getMessage(ShowActivityApplyListAction.class);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>申请列表</title>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
    </head>
    <body>
	<div>
	    <p><select id="chooseApproveType">
		    <option value="<%=ShowActivityApplyListPageAction.VIEW_TYPE_TODO%>" <%=message.getViewType() == ShowActivityApplyListPageAction.VIEW_TYPE_TODO ? "selected=\"selected\"" : ""%>>未处理的申请</option>
		    <option value="<%=ShowActivityApplyListPageAction.VIEW_TYPE_PAST%>" <%=message.getViewType() == ShowActivityApplyListPageAction.VIEW_TYPE_PAST ? "selected=\"selected\"" : ""%>>已处理的申请</option>
		</select>
	    </p>
	    <div id="pageview"></div>
	</div>
	<script type="text/javascript">
	    var pageConfig = {
		root:$("#pageview"),
		url:"showActivityApplyPage.do?viewType=<%=message.getViewType()%>&approveType=<%=message.getApproveType()%>",
		total:<%=message.getTotalPageNumber()%>,
		current:1,
		arguName:"page",
		css:false
	    };
	    init(pageConfig);
	    $("#chooseApproveType").change(function(){
		var type = $("#chooseApproveType").val();
		self.location.href = "showActivityApplyList.do?viewType=" + type + "&approveType=<%=message.getApproveType()%>";
	    });
	</script>
    </body>
</html>
