<%-- 
    Document   : oneColumn
    Created on : 2013-2-22, 16:05:46
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.message.ShowOneColumnMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
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
    <table style="width: 100%;border-collapse: collapse;border:0px;margin:0 auto;">
    <tbody>
        <tr>
        <td style="width:700px;background: white;vertical-align: top;text-align: center;">
            <div id="news">
            </div>
        </td>
        <td style="width:260px;background: #EFF1F0;border-left:1px solid white;border-right: 1px solid #DADADA ;vertical-align: top;text-align: center;">
            <div style="display: block">
                <ul>
                    <li style="height:26px;float: left;"></li>
                    <li style="color:#063760;font-size: 14px;font-weight: bold;padding-left: 10px">推荐</li>
                    <li style="height:26px;float: right;padding-right: 10px; line-height: 26px"></li>
                </ul>
            </div>
            <div style="width:auto;list-style-type:none;height:auto;padding:0;margin:0 5px;text-align:left;border-right:#DBDBDB 1px solid;border-bottom:#DBDBDB 1 px solid; border-left:#DBDBDB 1 px solid;background: #F8F8F8;">
                <ul style="margin:0;padding:10px;list-style-type: none;font-size: 14px;font-weight: normal;">
                <% for (int i = 0; i < showOneColumnMessage.getOtherNewsInSameColumn().size(); i++ )
                       { %>
                       <li style="line-height: 14px;color:black;padding-left: 10px;padding-top:5px;padding-bottom: 5px">
                           <a href="/new/new.do?id=<%=showOneColumnMessage.getOtherNewsInSameColumn().get(i).getID()%>" title="<%=showOneColumnMessage.getOtherNewsInSameColumn().get(i).getTitle() %>"><%=showOneColumnMessage.getOtherNewsInSameColumn().get(i).getTitle() %></a>
                       <% } %>
                       </li>
                </ul>
            </div>
        </td>
        </tr>
    </tbody>
    </table>
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
