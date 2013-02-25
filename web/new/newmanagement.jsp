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
    <a href="/new/editNewPage.do" style="background-color: ghostwhite"><b>添加新闻</b></a>&nbsp;&nbsp;
    <div style="background-color:#77BBEE;height: 120px;width: 1000px">
    <h2>筛选功能</h2>
    <form action="newFilter.do" method="get">
        标题：<input type="text" name="titleFilter" value="<%=newMPM.getTitleFilter()%>"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        作者：<input type="text" name="authorFilter" value="<%=newMPM.getAuthorFilter()%>"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        所属栏目：
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
        <br/>
        <input type="checkbox" name="isPlacedInColumnTopFilter" value="true" <% if (newMPM.isIsPlacedInColumnTopFilter()) { %> checked="checked" <% } %>/>置顶 &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="checkbox" name="withRedirectURLFilter" value="true"  <% if (newMPM.isWithRedirectURLFilter()) { %> checked="checked" <% } %>/>附带重定向URL
        <br/>
        <input type="submit" value="查询"/>
    </form>
    </div>
    <br/>
    <br/>
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
