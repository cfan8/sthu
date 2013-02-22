<%-- 
    Document   : oneNew
    Created on : 2013-2-22, 14:04:18
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowOneNewMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <%!
        public ShowOneNewMessage showOneNewMessage;
    %>
    <%
        showOneNewMessage = (ShowOneNewMessage) request.getAttribute("showOneNewMessage");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=showOneNewMessage.getNewEnity().getTitle()%></title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <table style="width: 100%;border-collapse: collapse;border:0px;margin:0 auto;">
    <tbody>
        <tr>
        <td style="width:700px;background: white;vertical-align: top;text-align: center;">
            <div style="width:auto;height: 20px;line-height: 20px;list-style-type: none;padding:0;font-size: 12px; margin: 0 0 0 10px; text-align: left;vertical-align: middle;padding-left: 5px;border-top:#F1F1F1 1px solid;color:#4F4F4F">
                <a href="/column/column.do?id=<%=showOneNewMessage.getNewEnity().getColumnBelong().getID()%>"><%=showOneNewMessage.getNewEnity().getColumnBelong().getName() %></a> > <%=showOneNewMessage.getNewEnity().getTitle() %>
            </div>
            <div style="width: auto;height: auto;padding:0;margin:15px 15px;text-align: left;line-height: 150%;list-style-type: none;font-size: 14px;text-indent: 0px;">
                <p align="center"><strong><span style="font-size: 20px"><%=showOneNewMessage.getNewEnity().getTitle()%></span></strong></p>
                <p align="center"><span style="font-size: 15px">作者：<%=showOneNewMessage.getNewEnity().getAuthor()%>   
                    发表时间：<%=Util.dateToStringAccurateToDay(showOneNewMessage.getNewEnity().getUpdateTime())%>
                    浏览数：<%=showOneNewMessage.getNewEnity().getBrowseNumber() %></span></p>
                <hr/>
                <%=showOneNewMessage.getNewEnity().getContent() %>
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
                <% for (int i = 0; i < showOneNewMessage.getOtherNewsInSameColumn().size(); i++ )
                       { %>
                       <li style="line-height: 14px;color:black;padding-left: 10px;padding-top:5px;padding-bottom: 5px">
                           <a href="/new/new.do?id=<%=showOneNewMessage.getOtherNewsInSameColumn().get(i).getID()%>" title="<%=showOneNewMessage.getOtherNewsInSameColumn().get(i).getTitle() %>"><%=showOneNewMessage.getOtherNewsInSameColumn().get(i).getTitle() %></a>
                       <% } %>
                       </li>
                </ul>
            </div>
        </td>
        </tr>
    </tbody>
    </table>
    
    
    <%@include file="/templates/general_footer.jsp" %>
</html>
