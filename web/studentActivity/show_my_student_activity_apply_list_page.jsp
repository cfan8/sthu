<%-- 
    Document   : show_my_student_activity_apply_list_page
    Created on : 2013-7-27, 14:56:02
    Author     : xiaobo
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowMyStudentActivityApplyPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowMyStudentActivityApplyPageMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>我的学生活动申请</title>
        <style>
            .homeActivityDiv{
                text-align: left;
            }
            .homeActivityDiv ul, .homeActivityDiv li{
                list-style-type:none;
            }
            .homeActivityDiv li{
                margin-left: -100px;
            }
            .homeActivityDiv a, .homeActivityDiv a:visited, .homeActivityDiv a:link{
                text-decoration: none;
                font-size:large;
                color: black;
            }
            .homeActivityDiv a:hover{
                text-decoration: underline;
            }
            .homeActivityDiv .timespan{
                float: right;
                color: #ccc;
                font-size: 10px;
            }
        </style>
    </head>
<%
    ShowMyStudentActivityApplyPageMessage message = Util.getMessage(ShowMyStudentActivityApplyPageAction.class);
    List<StudentActivityApplyEntity> list = message.getList();
    int type = message.getType();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    if(type != 1){
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
	}}else if(type == 1){
            if(list.size() == 0){
        
    %>
    <div style="width: 100%; text-align: center;">没有申请！</div>
    <%}else{%>
    <div class="homeActivityDiv">
    <ul><%
    for (int i = 0; i < list.size(); i++) {
	StudentActivityApplyEntity entity = list.get(i);
        String theme = entity.getActivityTheme();
        if(theme.length() > 20){
                theme = theme.substring(0, 18);
                theme = theme + "..";
            }
    %>
    <li><a href="showStudentActivityApply.do?applyId=<%=entity.getID()%>" target="_blank"><%=theme%></a><span class="timespan"> <%=df.format(entity.getApplyDate())%> </span></li>
    <%
	    }
    %></ul>
    </div>
    <%}}%>