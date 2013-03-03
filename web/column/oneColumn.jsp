<%-- 
    Document   : oneColumn
    Created on : 2013-2-22, 16:05:46
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.message.ShowOneColumnMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <%!
        public ShowOneColumnMessage showOneColumnMessage;
    %>
    <%
        showOneColumnMessage = (ShowOneColumnMessage) request.getAttribute("showOneColumnMessage");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=showOneColumnMessage.getColumnEntity().getName() %></title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <link rel="stylesheet" type="text/css" href="/css/new/new.css" />
    <div id="div_left">
        <div id="position">您当前的位置：<a href="/column/column.do?id=<%=showOneColumnMessage.getColumnEntity().getID() %>"><%=showOneColumnMessage.getColumnEntity().getName() %></a></div>
        <div id="blank_div"></div>
        <div id="news"></div>
    </div>
        <div id="div_right">
            <div id="recomment">
                <div id="tab"></div>
                <div id="text"><center><span>推荐</span></center></div>
                <div id="recomment_body">
                    <ul class="recomment">
                        <% for (int i = 0; i < showOneColumnMessage.getOtherNewsInSameColumn().size(); i++ )
                            { %>
                            <li class="recomment">
                                <a href="/new/new.do?id=<%=showOneColumnMessage.getOtherNewsInSameColumn().get(i).getID()%>" title="<%=showOneColumnMessage.getOtherNewsInSameColumn().get(i).getTitle() %>"><%=showOneColumnMessage.getOtherNewsInSameColumn().get(i).getTitle() %></a>
                            </li>
                       <% } %>
                    </ul>
                </div>
            </div>
            <div id="subject">
                <div id="tab"></div>
                <div id="text"><center><span>专题</span></center></div>
                <div id="subject_body">
                    <div id="subject_item"><img src="/css/new/subject1.png"></div>
                    <div id="subject_item"><img src="/css/new/subject2.png"></div>
                    <div id="subject_item"><img src="/css/new/subject3.png"></div>
                </div>
            </div>
    </div>
    <div class="clear"></div>
    <script type="text/javascript" src="/js/pageview.js"></script>
    <script type="text/javascript">
	var pageConfig = {
	    root:$("#news"),
	    url:"/column/columnNewListPage.do?id=<%=showOneColumnMessage.getColumnEntity().getID()%>",
	    total:<%=showOneColumnMessage.getPageNumber()%>,
	    current:1,
	    arguName:"page",
	    css:false
	};
	init(pageConfig);
    </script>
    <%@include file="/templates/general_footer.jsp" %>
</html>
