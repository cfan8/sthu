<%-- 
    Document   : show_classroom_paged_apply
    Created on : 2013-2-16, 20:50:41
    Author     : linangran
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.CRoomApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.ShowApplyListPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowApplyListPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<ul>
    <%
	ShowApplyListPageMessage message = Util.getMessage(ShowApplyListPageAction.class);
	List<CRoomApplyEntity> list = message.getList();
	for (int i = 0; i < list.size(); i++) {
	    CRoomApplyEntity entity = list.get(i);
    %>
    <li><a href="showApply.do?applyId=<%=entity.getID() %>" target="_blank"><%=entity.getTitle() %></a></li>
    <%    }
    %>

</ul>