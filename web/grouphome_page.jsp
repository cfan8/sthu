<%-- 
    Document   : grouphome_page
    Created on : 2013-8-13, 21:47:13
    Author     : xiaobo
--%>

<%@page import="cn.edu.tsinghua.sthu.action.ShowGroupHomePageAction"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowGroupHomePageMessage"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <link href="/css/activity/organizationPage.css" type="text/css" rel="stylesheet" />
</head>

<%
    ShowGroupHomePageMessage message = Util.getMessage(ShowGroupHomePageAction.class);
    List<StudentActivityApplyEntity> list = message.getList();
    List<Boolean> isFollowedList = message.getIsFollowedList();
    Integer showFollow = message.getShowFollow();
    String[] ActivityTypeStrings = {"","党团活动","体育赛事","学术报告","文化活动","文艺活动","其它活动"};
%>

<%
    if (list.size() == 0) {
%>
<div style="width: 100%; text-align: center;">没有申请！</div>
<%} else {
%><ul style="list-style-type: none;"><%
    for (int i = 0; i < list.size(); i++) {
	StudentActivityApplyEntity entity = list.get(i);
        Boolean isFollowed = isFollowedList.get(i);
    %>
    <li style="height: 55px;">
        <div style="padding: 5px 10px 5px 0px">
            <div class="activity-cata-div">    
                <a style="font-weight: bold;color: #888;text-decoration:none;"
                    href="/studentActivity/showStudentActivityApply.do?applyId=<%=entity.getID()%>" target="_blank">
                    <%=ActivityTypeStrings[entity.getActivityType()] %>
                </a>
            </div>
            <div class="activity-content-div">
                <div style="font-size: x-large;">
                    <a style="font-weight: bold; color: #888; text-decoration:none;"
                        href="/showGroupHome.do?groupId=<%=entity.getApplyUserid()%>">
                        <%=entity.getActivityTheme()%>
                    </a>
                </div>
                <div style="font-size: smaller; margin: 5px 0px 0px 0px; color: #888;">
                    <a><%=entity.getActivityDate() %></a>
                </div>    
            </div>
        </div>
    </li>
    <li class="hr-li"><hr /></li>
    <%
	    }
    %></ul><%
	}
    %>
