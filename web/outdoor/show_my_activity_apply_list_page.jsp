<%-- 
    Document   : show_my_activity_apply_list_page.jsp
    Created on : 2013-2-22, 20:33:12
    Author     : luzhen
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.ActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.outdoor.ShowMyActivityApplyPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.outdoor.ShowMyActivityApplyPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ShowMyActivityApplyPageMessage message = Util.getMessage(ShowMyActivityApplyPageAction.class);
    List<ActivityApplyEntity> list = message.getList();
    if (list.size() == 0) {
%>
<div style="width: 100%; text-align: center;">没有申请！</div>
<%} else {
%><ul><%
    for (int i = 0; i < list.size(); i++) {
	ActivityApplyEntity entity = list.get(i);
    %>
    <li><a href="showActivityApply.do?applyId=<%=entity.getID()%>" target="_blank"><%=entity.getActivityName()%></a></li>
    <%
	    }
    %></ul><%
	}
    %>