<%-- 
    Document   : show_my_student_activity_apply_list_page
    Created on : 2013-7-27, 14:56:02
    Author     : xiaobo
--%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowMyStudentActivityApplyPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowMyStudentActivityApplyPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ShowMyStudentActivityApplyPageMessage message = Util.getMessage(ShowMyStudentActivityApplyPageAction.class);
    List<StudentActivityApplyEntity> list = message.getList();
    if (list.size() == 0) {
%>
<div style="width: 100%; text-align: center;">没有申请！</div>
<%} else {
%><ul><%
    for (int i = 0; i < list.size(); i++) {
	StudentActivityApplyEntity entity = list.get(i);
    %>
    <li><a href="showStudentActivityApply.do?applyId=<%=entity.getID()%>" target="_blank"><%=entity.getActivityTheme()%></a></li>
    <%
	    }
    %></ul><%
	}
    %>