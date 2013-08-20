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
    List<Boolean> isFollowedList = message.getIsFollowedList();
    Integer showFollow = message.getShowFollow();
    if (list.size() == 0) {
%>
<div style="width: 100%; text-align: center;">没有申请！</div>
<%} else {
%><ul><%
    for (int i = 0; i < list.size(); i++) {
	StudentActivityApplyEntity entity = list.get(i);
        Boolean isFollowed = isFollowedList.get(i);
    %>
    <li><a href="showStudentActivityApply.do?applyId=<%=entity.getID()%>" target="_blank"><%=entity.getActivityTheme()%></a>
        &nbsp; <a href="/showGroupHome.do?groupId=<%=entity.getApplyUserid()%>"><%=entity.getOrganizerName()%></a>
    <br/>
    <%if(showFollow == 1){%>
        <%if(isFollowed){%>
        <a href="followActivity.do?activityId=<%=entity.getID()%>&type=0">取消关注</a>
        <%}else{%>
            <a href="followActivity.do?activityId=<%=entity.getID()%>&type=1">添加关注</a>
         <%}%>
     <%}%>
    </li>
    <%
	    }
    %></ul><%
	}
    %>

