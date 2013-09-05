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
%><ul style="list-style-type:none;"><%
    for (int i = 0; i < list.size(); i++) {
	StudentActivityApplyEntity entity = list.get(i);
        Boolean isFollowed = isFollowedList.get(i);
    %>
    <li style="height:55px;">
        <div style="padding:5px 80px 5px 0px">
            <div style="float:left;width:140px;text-align:center;margin:15px 20px 0px 0px;">  
                <a style="color:#000;  text-decoration:none;"
                   href="/showGroupHome.do?groupId=<%=entity.getApplyUserid()%>"
                     target="_blank">
                    <b><%=entity.getOrganizerName()%></b>
                </a>
                </div>
            <div style="float:left;width:600px;">
                <div style="font-size:x-large;"> 
                    <a  style="color:#000; text-decoration:none;" target="_blank"
                        href="showStudentActivityDetail.do?activityID=<%=entity.getID()%>">
                        <b><%=entity.getActivityTheme()%></b>
                    </a>
                </div>
                <div style="font-size:smaller;margin:5px 0px 0px 0px;color:#888;"> 
                    <%=entity.getTimePeriod() %>
                </div>
            </div>
            <div style="float:right;">    
            <%if(showFollow == 1){%>
                <%if(isFollowed){%>
                <a href="followActivity.do?activityId=<%=entity.getID()%>&type=0">
                    <img src="/css/activity/unfollow_btn.png" />
                </a>
                <%}else{%>
                <a href="followActivity.do?activityId=<%=entity.getID()%>&type=1">
                    <img src="/css/activity/follow_btn.png" />
                </a>
                <%}%>
            <%}%>
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
