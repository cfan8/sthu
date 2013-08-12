<%-- 
    Document   : show_activities_list_page
    Created on : 2013-8-7, 23:20:01
    Author     : xiaobo
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowActivitiesPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowActivitiesPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ShowActivitiesPageMessage message = Util.getMessage(ShowActivitiesPageAction.class);
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
