<%-- 
    Document   : newmanagement
    Created on : 2013-2-17, 14:51:47
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.constant.Constant"%>
<%@page import="cn.edu.tsinghua.sthu.message.NewManagementPageMessage"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" charset="utf-8" src="/js/moment.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/pikaday.min.js"></script>
	<link rel='stylesheet' type='text/css' href='/css/pikaday.css' />
        <title>新闻管理</title>
    </head>
    <%!
        public NewManagementPageMessage newMPM;
    %>
    <%
        newMPM = (NewManagementPageMessage) request.getAttribute("newManagementPageMessage");
    %>
    <%@include file="/templates/general_header.jsp" %>
    <link rel="stylesheet" type="text/css" href="/css/new/newManagePage.css" />
    <div id="position">您的当前位置：<a href="/new/newsManage.do">新闻管理</a></div>
    <div id="add_new_div">
        <a href="/new/editNewPage.do" title="点击添加新闻">添加新闻</a>
    </div>
    <div id="filter_new_div">
            <div id="filter_top"><img src="/css/new/filter_top.png"/></div>
            <form name="filter" action="newsManage.do" method="get">
            <div id="filter_content">
                <div id="filter_word"><center><span>筛选新闻</span></center>
                </div>
                <div id="filter_item">
                    <div class="top_or_bottom">
                        <div class="filter_item_div">新闻标题：<input id="title" type="text" name="titleFilter" value="<%=newMPM.getTitleFilter()%>"/></div>
                        <div class="filter_item_div">作者：<input id="author" type="text" name="authorFilter" value="<%=newMPM.getAuthorFilter()%>"/></div>
                        <div class="filter_item_div">所在栏目：
                        <select name="columnBelongFilter" id="column">
                            <option value="-1"><%=Constant.ALL_COLUMN %></option>
                            <% for (int i = 0; i < newMPM.getColumns().size(); i++)
                            { 
                                if (newMPM.getColumnBelongFilter() == newMPM.getColumns().get(i).getID())
                                {
                                %>
                                <option selected="selected" value="<%=newMPM.getColumns().get(i).getID() %>"><%=newMPM.getColumns().get(i).getName() %></option>
                                <% } 
                                else
                                { %>
                                <option value="<%=newMPM.getColumns().get(i).getID() %>"><%=newMPM.getColumns().get(i).getName() %></option>
                             <% }} %>
                         </select>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="top_or_bottom">
                        <div class="filter_item_time_div">时间区间：<input type="text" id="startTime" name="startTime" value="<%=newMPM.getStartTime() %>" /></div>
                        <div class="filter_item_div">到 <input type="text" id="endTime" name="endTime" value="<%=newMPM.getEndTime() %>" /></div>
                        <div class="filter_item_div"><input type="checkbox" name="isPlacedInColumnTopFilter" value="true" <% if (newMPM.isIsPlacedInColumnTopFilter()) { %> checked="checked" <% } %>/>置顶</div>
                        <div class="filter_item_div"><input type="checkbox" name="withRedirectURLFilter" value="true"  <% if (newMPM.isWithRedirectURLFilter()) { %> checked="checked" <% } %>/>附带重定向URL</div>
                        <div class="clear"></div>
                    </div>
                </div>
                        <div id="filter_submit_div"><input type="image" src="/css/new/filter_search.png" value="查询" onclick="filter_submit();"/></div>
                <div class="clear"></div>
            </div>
            <div id="filter_bottom"><img src="/css/new/filter_bottom.png"/>
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
        var startTime = new Pikaday({
	    field: document.getElementById('startTime'),
	    format: 'YYYY-MM-DD'
	});
        var endTime = new Pikaday({
	    field: document.getElementById('endTime'),
	    format: 'YYYY-MM-DD'
	});
        function filter_submit()
        {
            document.getElementById("title").value = encodeURIComponent(document.getElementById("title").value);
            document.getElementById("author").value = encodeURIComponent(document.getElementById("author").value);
            $('filter').submit();
        }
    </script>
</html>
