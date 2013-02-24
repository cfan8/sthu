<%-- 
    Document   : adminhome
    Created on : 2013-2-2, 20:13:44
    Author     : linangran
--%>

<%@page import="cn.edu.tsinghua.sthu.action.ShowApplyListPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.action.outdoor.ShowActivityApplyListPageAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学生清华管理页面</title>
    </head>
    
    <%@include file="/templates/general_header.jsp" %>
    <div>
        <p>教室申请</p>
    一级待审批：
    <iframe src="/activity/showApplyList.do?viewType=1&approveType=<%=ShowApplyListPageAction.APPROVE_TYPE_IDENTITY %>">
    </iframe>
    
    二级待审批：
    <iframe src="/activity/showApplyList.do?viewType=1&approveType=<%=ShowApplyListPageAction.APPROVE_TYPE_RESOURCE %>">
    </iframe>
    
    三级级待审批：
    <iframe src="/activity/showApplyList.do?viewType=1&approveType=<%=ShowApplyListPageAction.APPROVE_TYPE_ALLOCATE %>">
    </iframe>
    </div>
    <p>电子屏/展板/户外活动申请</p>
    一级待审批：
    <iframe src="/outdoor/showActivityApplyList.do?viewType=1&approveType=<%=ShowActivityApplyListPageAction.APPROVE_TYPE_IDENTITY %>">
    </iframe>
    二级待审批：
    <iframe src="/outdoor/showActivityApplyList.do?viewType=1&approveType=<%=ShowActivityApplyListPageAction.APPROVE_TYPE_RESOURCE %>">
    </iframe>
    <div>
        
    </div>
    <a href="update_password.jsp">修改密码</a>
    <a href="logout.do">登出</a>
    <%@include file="/templates/general_footer.jsp" %>
</html>
