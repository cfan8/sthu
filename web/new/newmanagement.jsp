<%-- 
    Document   : newmanagement
    Created on : 2013-2-17, 14:51:47
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.constant.Constant"%>
<%@page import="cn.edu.tsinghua.sthu.message.NewManagementPageMessage"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>新闻管理</title>
    </head>
    <%!
        public NewManagementPageMessage newMPM;
    %>
    <%
        newMPM = (NewManagementPageMessage) request.getAttribute("newManagementPageMessage");
    %>
    <%@include file="/templates/general_header.jsp" %>
    <link rel="stylesheet" type="text/css" href="/css/new/managePage.css" />
    <div id="add_new_div">
        <div id="position">您的当前位置：<a href="new/newsManage.do">新闻管理</a></div>
        <a href="/new/editNewPage.do" title="点击添加新闻">添加新闻</a>
    </div>
    <div id="filter_new_div">
        <div id="filter_top_title">筛选功能</div>
        <form action="newFilter.do" method="get">
        <div id="filter_top">
            <div class="filter_item_div">标题：<input type="text" name="titleFilter" value="<%=newMPM.getTitleFilter()%>"/></div>
            <div class="filter_item_div">作者：<input type="text" name="authorFilter" value="<%=newMPM.getAuthorFilter()%>"/></div>
            <div class="filter_item_div">所属栏目：
            <select name="columnBelongFilter">
                <option><%=Constant.ALL_COLUMN %></option>
                <% for (int i = 0; i < newMPM.getColumnNames().size(); i++)
                    { 
                        if (newMPM.getColumnBelongFilter().equals(newMPM.getColumnNames().get(i)))
                        {
                        %>
                        <option selected="selected"><%=newMPM.getColumnNames().get(i) %></option>
                        <% } 
                        else
                        { %>
                        <option><%=newMPM.getColumnNames().get(i) %></option>
                    <% }} %>
            </select>
            </div>
            <div class="clear"></div>
        </div>
        <div id="filter_bottom">
            <div class="filter_item_div"><input type="checkbox" name="isPlacedInColumnTopFilter" value="true" <% if (newMPM.isIsPlacedInColumnTopFilter()) { %> checked="checked" <% } %>/>置顶</div>
            <div class="filter_item_div"><input type="checkbox" name="withRedirectURLFilter" value="true"  <% if (newMPM.isWithRedirectURLFilter()) { %> checked="checked" <% } %>/>附带重定向URL</div>
            <div class="filter_item_div"><input type="submit" value="查询"/></div>
            <div class="clear"></div>
        </div>
    </form>
    </div>
    <div id="news">
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript" src="/js/pageview.js"></script>
    <script type="text/javascript">
	var pageConfig = {
	    root:$("#news"),
	    url:"/new/newPage.do?<%=newMPM.getParam()%>",
	    total:<%=newMPM.getPageNumber() %>,
	    current:1,
	    arguName:"page",
	    css:false
	};
	init(pageConfig);
    </script>
</html>
