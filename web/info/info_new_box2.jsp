<%-- 
    Document   : info_new_box2
    Created on : 2013-3-13, 12:45:18
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.info.ForInfoNewBoxMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <%!
        public ForInfoNewBoxMessage forInfoNewBoxMessage;
    %>
    <%
        forInfoNewBoxMessage = (ForInfoNewBoxMessage) request.getAttribute("forInfoNewBoxMessage");
    %>
    <head>
    	<link rel="stylesheet" type="text/css" href="/css/info/index_s.css"/>
    </head>
    <body>
        <table class="table_wind_clist" align="center">
            <% int max = forInfoNewBoxMessage.getNews().size() > 6 ? 6 : forInfoNewBoxMessage.getNews().size();
               for (int i = 0; i < max; i++)
              { %>
            <tr>
     		<td class="left"></td>
     		<td>
                    <a href="/new/new.do?id=<%=forInfoNewBoxMessage.getNews().get(i).getID()%>" title="<%=forInfoNewBoxMessage.getNews().get(i).getTitle() %>" target="_blank">
                        <font color>
                            <% if (forInfoNewBoxMessage.getNews().get(i).getTitle().length() > 33) {%>  <%=forInfoNewBoxMessage.getNews().get(i).getTitle().substring(0, 33).concat("..")%>
				<% } else {%> <%=forInfoNewBoxMessage.getNews().get(i).getTitle()%> <% }%> 
                        </font>
                    </a>
     		</td>
                <td class="date">
                    <%=Util.dateToStringAccurateToDayFormat1(forInfoNewBoxMessage.getNews().get(i).getUpdateTime())%>
     		</td>
            </tr>
             <% } %>
        </table>
  </body>
</html>
