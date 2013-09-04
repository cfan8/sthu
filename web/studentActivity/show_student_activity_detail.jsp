<%-- 
    Document   : show_student_activity_detail
    Created on : 2013-9-4, 19:24:26
    Author     : xiaobo
--%>

<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowStudentActivityDetailAction"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityDetailMessage"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowStudentActivityDetailMessage message = Util.getMessage(ShowStudentActivityDetailAction.class);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学生活动详情</title>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
	<script type="text/javascript" src="/js/datepicker.js"></script>
        <script type="text/javascript" src="/js/eye.js"></script>
        <script type="text/javascript" src="/js/utils.js"></script>
        <link href="/css/activity/indexPage_sheet.css" type="text/css" rel="stylesheet"/>
        <link href="/css/activity/flexagon.css" type="text/css" rel="stylesheet" />
        <link href="/css/activity/effects.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="/css/datepicker.css" type="text/css" />
    </head>
    <%@include file="/templates/new_general_header.jsp" %>
    <%=message.getActivity().getOption().getPublicityMaterials()%>
    <%@include file="/templates/new_general_footer.jsp" %>

</html>


