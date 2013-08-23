<%-- 
    Document   : search_student_activities_page
    Created on : 2013-8-17, 21:38:16
    Author     : anna
--%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.SearchActivityPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.SearchActivitiesPageMessage"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    SearchActivitiesPageMessage message = Util.getMessage(SearchActivityPageAction.class);
    List<StudentActivityApplyEntity> list = message.getList();
    if (list.size() == 0) {
%>
<div style="width: 100%; text-align: center;">没有申请！</div>
<%} else {
%><ul style="list-style-type:none;"><%
    for (int i = 0; i < list.size(); i++) {
	StudentActivityApplyEntity entity = list.get(i);
    %>
    <li style="height:55px;">
        <div style="padding:5px 80px 5px 0px">
            <div style="float:left;width:140px;text-align:center;margin:15px 20px 0px 0px;">
                <a style="color:#000;  text-decoration:none;"
                    href="showStudentActivityApply.do?applyId=<%=entity.getID()%>" target="_blank">
                    <b><%=entity.getOrganizerName()%></b>
                </a>
            </div>
            <div style="float:left;width:600px;">
                <div style="font-size:x-large;">    
                    <a  style="color:#000; text-decoration:none;"
                        href="/showGroupHome.do?groupId=<%=entity.getApplyUserid()%>">
                        <%=entity.getActivityTheme()%>
                    </a>
                </div>
                <div style="font-size:smaller;margin:5px 0px 0px 0px;color:#888;">
                    <a><%=entity.getTimePeriod() %></a>
                </div>
            </div>
            <div style="float:right;color:#888;margin-top:15px;">
                <a><b><%=entity.getActivityDate()%></b></a>
            </div>
        </div>
    </li>
    <li style="height:40px;padding:15px 80px 5px 20px;"><hr/></li>
    <%
	    }
    %></ul><%
	}
    %>

