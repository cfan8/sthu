<%-- 
    Document   : show_random_hot_activities
    Created on : 2013-10-4, 14:41:13
    Author     : xiaobo
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowRandomHotActivitiesAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowRandomHotActivitiesMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowRandomHotActivitiesMessage message = Util.getMessage(ShowRandomHotActivitiesAction.class);
    List<StudentActivityApplyEntity> list = message.getHotActivities();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>热门推荐</title>
        <style>
            .hot{
                font-family: SimHei;
                color:white;
                font-size: 20px;
            }
            .hot:visited, .hot:link{
                text-decoration: none;
            }
            .hot:hover{
                text-decoration: underline;
            }
            .hotdiv{
                padding-bottom: 5px;
            }
        </style>
    </head>
    <body>
        <%for(int i = 0; i < list.size(); i ++){
            StudentActivityApplyEntity entity = list.get(i);
            String theme = entity.getActivityTheme();
            if(theme.length() > 10){
                theme = theme.substring(0, 8);
                theme = theme + "...";
            }
        %>
        <div class="hotdiv">
        <a class="hot" target="_blank" href="/studentActivity/showStudentActivityDetail.do?activityID=<%=entity.getID()%>"><%=theme%> </a>
        </div>
        <%}%>
    </body>
</html>
