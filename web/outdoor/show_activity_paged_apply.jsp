<%-- 
    Document   : show_activity_paged_apply
    Created on : 2013-2-23, 21:30:51
    Author     : elsie
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.ActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.outdoor.ShowActivityApplyListPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.outdoor.ShowActivityApplyListPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ShowActivityApplyListPageMessage message = Util.getMessage(ShowActivityApplyListPageAction.class);
    List<ActivityApplyEntity> list = message.getList();
    if (list.size() == 0) {
%>
<span>暂无申请</span>
<%} else {
%>
<ul>    
    <%
	for (int i = 0; i < list.size(); i++) {
	    ActivityApplyEntity entity = list.get(i);
    %>
    <li><a href="showActivityApply.do?applyId=<%=entity.getID()%>" target="_blank"><%=entity.getActivityName()%></a></li>
    <%    }
    %>
</ul>
<%
    }
%>

